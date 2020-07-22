/*
 Navicat Premium Data Transfer

 Source Server         : myblog-localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 20/03/2020 17:12:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (1, b'1', b'1', 'Java入门学习路线目录索引Java入门学习路线目录索引Java入门学习路线目录索引Java入门学习路线目录索引Java入门学习路线目录索引', '2020-03-09 16:58:35', 'Java入门学习路线目录索引Java入门学习路线目录索引Java入门学习路线目录索引', 'https://note.youdao.com/yws/api/personal/file/83D553511A8643F680BD21C03D963E70?method=download&shareKey=2985e6991de6d823544f142923b1b2cc', '原创', b'1', b'1', b'1', 'Java入门学习路线目录索引', '2020-03-09 16:58:35', 30, 1, 1);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, b'1', '/images/me.jpg', '测试', '2020-03-09 16:58:58', 'onestarlr@hotmail.com', 'oneStar', 1, NULL);
INSERT INTO `t_comment` VALUES (2, b'1', '/images/me.jpg', '收到的', '2020-03-09 16:59:02', 'onestarlr@hotmail.com', 'oneStar', 1, 1);
INSERT INTO `t_comment` VALUES (3, b'1', '/images/me.jpg', '达到', '2020-03-09 16:59:05', 'onestarlr@hotmail.com', 'oneStar', 1, 2);
INSERT INTO `t_comment` VALUES (4, b'1', '/images/me.jpg', '阿斯顿发', '2020-03-09 16:59:12', 'onestarlr@hotmail.com', 'oneStar', 1, 1);
INSERT INTO `t_comment` VALUES (5, b'1', '/images/me.jpg', '阿斯顿发', '2020-03-09 16:59:16', 'onestarlr@hotmail.com', 'oneStar', 1, NULL);
INSERT INTO `t_comment` VALUES (6, b'0', '/images/avatar.png', '试一试', '2020-03-09 19:07:35', 'onestarlr@hotmail.com', 'oneStar', 1, 4);
INSERT INTO `t_comment` VALUES (7, b'0', '/images/avatar.png', '对对对', '2020-03-09 19:09:07', 'onestarlr@hotmail.com', 'oneStar', 1, NULL);
INSERT INTO `t_comment` VALUES (8, b'0', '/images/avatar.png', '对对对', '2020-03-09 19:09:36', 'onestarlr@hotmail.com', 'oneStar', 1, 1);
INSERT INTO `t_comment` VALUES (9, b'0', '/images/avatar.png', '的', '2020-03-09 21:54:38', 'onestarlr@hotmail.com', 'oneStar', 1, 8);
INSERT INTO `t_comment` VALUES (10, b'0', '/images/avatar.png', '不是吧', '2020-03-09 21:54:56', 'onestarlr@hotmail.com', '是大法', 1, NULL);
INSERT INTO `t_comment` VALUES (11, b'0', '/images/avatar.png', '大学生', '2020-03-09 22:05:48', 'onestarlr@hotmail.com', '阿斯顿发送到', 1, NULL);
INSERT INTO `t_comment` VALUES (12, b'0', '/images/avatar.png', '再来一次', '2020-03-09 22:07:06', 'onestarlr@hotmail.com', '大丰收的', 1, NULL);
INSERT INTO `t_comment` VALUES (13, b'0', '/images/avatar.png', '阿斯顿发', '2020-03-09 22:08:22', 'onestarlr@hotmail.com', 'oneStar', 1, NULL);
INSERT INTO `t_comment` VALUES (14, b'0', '/images/avatar.png', '阿法士大夫', '2020-03-09 22:11:33', 'onestarlr@hotmail.com', '阿斯顿发啊', 1, NULL);
INSERT INTO `t_comment` VALUES (15, b'0', '/images/avatar.png', '阿萨斯多所多的点点滴滴', '2020-03-09 22:12:20', 'onestarlr@hotmail.com', '的', 1, NULL);
INSERT INTO `t_comment` VALUES (16, b'0', '/images/avatar.png', '来了老弟', '2020-03-10 09:11:35', 'q@dd.com', '的', 1, NULL);
INSERT INTO `t_comment` VALUES (17, b'0', '/images/avatar.png', '又来了', '2020-03-10 09:13:25', 'dd@qq.com', '的达到', 1, NULL);
INSERT INTO `t_comment` VALUES (18, b'0', '/images/avatar.png', 'buhuiba d', '2020-03-10 09:27:22', 'd@qq.com', 'd', 1, 4);
INSERT INTO `t_comment` VALUES (19, b'0', '/images/avatar.png', 'asdfasdf 暗示如果撒地方', '2020-03-10 09:27:59', 'd@qq.com', '达到', 1, NULL);
INSERT INTO `t_comment` VALUES (20, b'0', '/images/avatar.png', 'd ', '2020-03-10 09:42:46', 'd@qq.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (21, b'0', '/images/avatar.png', 'd dd', '2020-03-10 09:42:53', 'd@qq.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (22, b'0', '/images/avatar.png', 'd ddasdf a', '2020-03-10 09:43:00', 'd@qq.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (23, b'0', '/images/avatar.png', 'd ddasdf a', '2020-03-10 09:43:04', 'd@qq.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (24, b'0', '/images/avatar.png', 'd ddasdf a', '2020-03-10 09:43:08', 'd@qq.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (25, b'0', '/images/avatar.png', '重', '2020-03-10 09:45:19', 's@qq.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (26, b'0', '/images/avatar.png', '可以了', '2020-03-10 10:03:24', 'W@qq.com', 'dd', 1, NULL);
INSERT INTO `t_comment` VALUES (27, b'0', '/images/avatar.png', '再来一个', '2020-03-10 10:06:42', 'qq!@ww.com', 'd', 1, NULL);
INSERT INTO `t_comment` VALUES (28, b'0', '/images/avatar.png', 'keyi ', '2020-03-10 10:07:16', 'asdf@qq.com', 'adsf', 1, NULL);

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blogaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blogname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `pictureaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES (45, 'http://122.51.28.187:8080/', 'ONESTAR', '2020-03-14 15:29:43', 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e');
INSERT INTO `t_friend` VALUES (46, 'http://122.51.28.187:8080/', 'ONESTAR', '2020-03-14 15:30:55', 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e');
INSERT INTO `t_friend` VALUES (47, 'http://122.51.28.187:8080/', 'ONESTAR', '2020-03-14 15:31:18', 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e');
INSERT INTO `t_friend` VALUES (48, 'http://122.51.28.187:8080/', 'ONESTAR', '2020-03-14 15:31:36', 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e');
INSERT INTO `t_friend` VALUES (49, 'http://122.51.28.187:8080/', 'ONESTAR', '2020-03-14 15:31:51', 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e');
INSERT INTO `t_friend` VALUES (51, 'http://122.51.28.187:8080/', 'ONESTAR', '2020-03-14 21:54:32', 'https://note.youdao.com/yws/api/personal/file/EEB40CE03F1A451AA77936EB5432EABD?method=download&shareKey=c5a62b8d86f08bf76ae15408b53ca7ae');
INSERT INTO `t_friend` VALUES (52, 'http://122.51.28.187:8080/', '一颗星', '2020-03-19 21:19:10', 'https://note.youdao.com/yws/api/personal/file/EEB40CE03F1A451AA77936EB5432EABD?method=download&shareKey=c5a62b8d86f08bf76ae15408b53ca7ae');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_message_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKago0xu8rpmkur23smololhr86`(`parent_message_id`) USING BTREE,
  CONSTRAINT `FKago0xu8rpmkur23smololhr86` FOREIGN KEY (`parent_message_id`) REFERENCES `t_message` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, b'0', '/images/avatar.png', '测试', '2020-03-09 11:46:50', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (2, b'0', '/images/avatar.png', 'saf', '2020-03-09 11:46:57', 'onestarlr@hotmail.com', 'oneStar', 1);
INSERT INTO `t_message` VALUES (3, b'0', '/images/avatar.png', 'asdfasddd', '2020-03-09 11:47:01', 'onestarlr@hotmail.com', 'oneStar', 2);
INSERT INTO `t_message` VALUES (4, b'0', '/images/avatar.png', 'sddd', '2020-03-09 13:42:58', 'onestarlr@hotmail.com', 'oneStar', 2);
INSERT INTO `t_message` VALUES (5, b'0', '/images/avatar.png', 'asd111', '2020-03-09 15:18:32', '111@qq.com', '111', 2);
INSERT INTO `t_message` VALUES (6, b'1', '/images/me.jpg', '回复', '2020-03-09 16:02:42', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (7, b'1', '/images/me.jpg', '是是是', '2020-03-09 16:02:47', 'onestarlr@hotmail.com', 'oneStar', 2);
INSERT INTO `t_message` VALUES (8, b'1', '/images/me.jpg', '达到', '2020-03-09 16:09:29', 'onestarlr@hotmail.com', 'oneStar', 1);
INSERT INTO `t_message` VALUES (9, b'1', '/images/me.jpg', '星', '2020-03-09 16:09:41', 'onestarlr@hotmail.com', 'oneStar', 8);
INSERT INTO `t_message` VALUES (10, b'1', '/images/me.jpg', '卡卡办卡上岛咖啡', '2020-03-09 16:10:21', 'onestarlr@hotmail.com', 'oneStar', 6);
INSERT INTO `t_message` VALUES (11, b'1', '/images/me.jpg', '咱能你', '2020-03-09 16:10:55', 'onestarlr@hotmail.com', 'oneStar', 10);
INSERT INTO `t_message` VALUES (12, b'0', '/images/avatar.png', 'dddd', '2020-03-09 17:10:52', 'd@qq.com', '试一试', 8);
INSERT INTO `t_message` VALUES (13, b'0', '/images/avatar.png', 'laibabb', '2020-03-09 17:12:09', 'd@qq.com', '试一试', NULL);
INSERT INTO `t_message` VALUES (14, b'0', '/images/avatar.png', 'ddddddddssssss', '2020-03-09 17:12:53', 'd@qq.com', '试一试', 13);
INSERT INTO `t_message` VALUES (15, b'0', '/images/avatar.png', 'asdfasdfasd', '2020-03-09 17:12:58', 'd@qq.com', '试一试', 14);
INSERT INTO `t_message` VALUES (16, b'0', '/images/avatar.png', 'kankkkkk', '2020-03-09 17:24:43', 'a@qq.com', 'a', 8);
INSERT INTO `t_message` VALUES (17, b'0', '/images/avatar.png', '起到', '2020-03-09 17:39:33', 'onestarlr@hotmail.com', 'd', 8);
INSERT INTO `t_message` VALUES (18, b'0', '/images/avatar.png', '循环', '2020-03-09 17:46:32', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (19, b'0', '/images/avatar.png', '新互殴', '2020-03-09 17:46:46', 'onestarlr@hotmail.com', 'oneStar', 8);
INSERT INTO `t_message` VALUES (20, b'0', '/images/avatar.png', '的点点滴滴', '2020-03-09 17:51:12', 'onestarlr@hotmail.com', 'oneStar', 8);
INSERT INTO `t_message` VALUES (21, b'0', '/images/avatar.png', '不会吧', '2020-03-09 17:55:01', 'onestarlr@hotmail.com', 'oneStar', 8);
INSERT INTO `t_message` VALUES (22, b'0', '/images/avatar.png', '坎坎坷坷扩', '2020-03-09 17:57:53', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (23, b'0', '/images/avatar.png', '顶顶顶顶付', '2020-03-09 17:58:00', 'onestarlr@hotmail.com', 'oneStar', 8);
INSERT INTO `t_message` VALUES (24, b'0', '/images/avatar.png', '哈哈哈\n', '2020-03-09 19:16:59', 'onestarlr@hotmail.com', 'oneStar', 22);
INSERT INTO `t_message` VALUES (25, b'0', '/images/avatar.png', '假假按揭', '2020-03-09 19:17:07', 'onestarlr@hotmail.com', 'oneStar', 24);
INSERT INTO `t_message` VALUES (26, b'0', '/images/avatar.png', '顶一顶', '2020-03-09 19:43:56', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (27, b'0', '/images/avatar.png', '改好了', '2020-03-09 21:03:02', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (28, b'0', '/images/avatar.png', '是吗', '2020-03-09 21:51:38', 'onestarlr@hotmail.com', '提阿尼天', 23);
INSERT INTO `t_message` VALUES (29, b'0', '/images/avatar.png', '大是大非', '2020-03-09 21:54:00', 'onestarlr@hotmail.com', '提阿尼天', NULL);
INSERT INTO `t_message` VALUES (30, b'0', '/images/avatar.png', '评论一下', '2020-03-09 22:02:55', 'onestarlr@hotmail.com', '达到', NULL);
INSERT INTO `t_message` VALUES (31, b'0', '/images/avatar.png', '巨虎好好读书粪便还', '2020-03-10 08:59:46', 'jj@hj.com', 'sad', NULL);
INSERT INTO `t_message` VALUES (32, b'0', '/images/avatar.png', 'sdf ', '2020-03-10 09:15:48', 'Q@qq.com', 'aaa', 18);
INSERT INTO `t_message` VALUES (33, b'1', '/images/me.jpg', '很多好', '2020-03-14 14:58:38', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (34, b'1', '/images/me.jpg', '对方水电费', '2020-03-14 14:58:58', 'qq@qq.com', '的', 33);
INSERT INTO `t_message` VALUES (35, b'1', '/images/me.jpg', 'sdf ', '2020-03-14 14:59:36', 'qq@qq.com', 'sd a ', 31);
INSERT INTO `t_message` VALUES (36, b'1', '/images/me.jpg', 'asdf ', '2020-03-14 15:00:09', 'onestarlr@hotmail.com', 'oneStar', 33);
INSERT INTO `t_message` VALUES (37, b'0', '/images/avatar.png', 'asd撒旦法', '2020-03-14 15:00:57', 'onestarlr@hotmail.com', '发', NULL);
INSERT INTO `t_message` VALUES (38, b'0', '/images/avatar.png', '阿斯顿发', '2020-03-14 15:01:08', 'onestarlr@hotmail.com', 'oneStar', 7);
INSERT INTO `t_message` VALUES (39, b'1', '/images/me.jpg', 'sdfghsfgdh', '2020-03-14 22:00:32', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (40, b'1', '/images/me.jpg', '莱奥拉', '2020-03-14 22:01:44', 'onestarlr@hotmail.com', 'oneStar', NULL);
INSERT INTO `t_message` VALUES (41, b'0', '/images/avatar.png', '来了老弟', '2020-03-20 16:28:35', 'onestarlr@hotmail.com', '的', NULL);
INSERT INTO `t_message` VALUES (42, b'1', '/images/me.jpg', '来啦来啦', '2020-03-20 16:29:24', 'onestarlr@hotmail.com', 'oneStar', 41);

-- ----------------------------
-- Table structure for t_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pictureaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picturedescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picturename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picturetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_picture
-- ----------------------------
INSERT INTO `t_picture` VALUES (2, 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e', '1937年，那是一个春天，以为老人在这里花了歌曲', '归来', '2020年2月3日  深圳');
INSERT INTO `t_picture` VALUES (3, 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e', '1937年，那是一个春天，以为老人在这里花了歌曲', '归来', '2020年2月3日  深圳');
INSERT INTO `t_picture` VALUES (5, 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e', '1937年，那是一个春天，以为老人在这里花了歌曲', '归来的是', '2020年2月3日  深圳');
INSERT INTO `t_picture` VALUES (6, 'https://note.youdao.com/yws/api/personal/file/2AF44B325F5F4B868B28BABE1DED0B12?method=download&shareKey=3aff342c129d7c3ca52e813adc150f3e', '1937年，那是一个春天，以为老人在这里花了一个圈', '归来的是', '2020年2月3日  深圳的');
INSERT INTO `t_picture` VALUES (8, 'https://note.youdao.com/yws/api/personal/file/74CA567A16BF4119A36EDE1184E08176?method=download&shareKey=5f4110973d01477437c34bdb494f07b6', '蓝天、白云、草原、快马、这些我都没有', '策马奔腾', '2020年2月3日  深圳');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, 'Java基础阿阿斯顿多舒服对对对达到');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '/images/me.jpg', '2020-03-09 15:59:52', 'onestarlr@hotmail.com', 'oneStar', '4473634a5b6102e24e38b42d56e61b7c', 1, '2020-03-09 16:00:26', 'ONESTAR');

SET FOREIGN_KEY_CHECKS = 1;
