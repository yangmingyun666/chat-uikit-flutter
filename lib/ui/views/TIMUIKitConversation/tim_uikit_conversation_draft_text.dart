import 'package:flutter/material.dart';
import 'package:tencent_chat_i18n_tool/tencent_chat_i18n_tool.dart';
import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_statelesswidget.dart';
import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_base.dart';
import 'package:tencent_cloud_chat_uikit/theme/tui_theme.dart';

class TIMUIKitDraftText extends TIMUIKitStatelessWidget {
  final BuildContext context;
  final String draftText;
  final double fontSize;

  TIMUIKitDraftText({
    Key? key,
    this.fontSize = 14.0,
    required this.context,
    required this.draftText,
  }) : super(key: key);

  String _getDraftShowText() {
    final draftShowText = TIM_t("草稿");

    return '[$draftShowText] ';
  }

  @override
  Widget tuiBuild(BuildContext context, TUIKitBuildValue value) {
    final TUITheme theme = value.theme;
    return Row(children: [
      Text(_getDraftShowText(),
          style: TextStyle(
            color: theme.conversationItemDraftTextColor,
          )),
      Expanded(
          child: Text(
        draftText,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
            height: 1.5,
            color: theme.conversationItemLastMessageTextColor,
            fontSize: fontSize),
      )),
    ]);
  }
}
