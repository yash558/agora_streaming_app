import 'package:agora_live/widget/loading_screen.dart';

import 'package:flutter/material.dart';

class LiveChat extends StatefulWidget {
  final String channelId;
  const LiveChat({super.key, required this.channelId});

  @override
  State<LiveChat> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<dynamic>(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                }

                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      snapshot.data.docs[index]['username'],
                      // style: TextStyle(color: snapshot.data.docs[index]["uid"] == userProvider.user.uid),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
