/*
 * Copyright 2005 - 2015  Zarafa B.V. and its licensors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License, version 3,
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#ifndef ECDBDEF_H
#define ECDBDEF_H

/**
 * @page zarafa_db Database
 *
 * @section zarafa_db_layout Database layout
 *
 * Zarafa server tables:
 * @code
 * abchanges         | All addressbook changes
 * acl               | User permission objects
 * changes           | Object changes
 * clientupdatestatus| Update status of the zarafa client, only used with auto updater
 * hierarchy         | The hiearchy between the mapi objects
 * indexedproperties | Mapi object entryid and sourcekey
 * lob               | Attachment data. Only when the setting attachment in database is enabled
 * mvproperties      | The multi value properties of a mapi object. Store, folder and message
 * names             | Custom property defines
 * outgoingqueue     | Pending messages to send
 * properties        | The single value properties of a mapi object. Store, folder and message
 * receivefolder     | Specifies the mapi receivefolder, for example the inbox
 * searchresults     | Search folder results
 * settings          | Server dependent settings
 * singleinstances   | The relation between an attachment and one or more message objects
 * stores            | A list with data stores related to one user and includes the deleted stores.
 * syncedmessages    | Messages which are synced with a specific restriction
 * syncs             | Sync state of a folder
 * users             | User relation between the userplugin and zarafa
 * versions          | Database update information
 * @endcode
 *
 * Database and unix user plugin tables:
 * @code
 * object            | Unique user object id and user type
 * objectmvproperty  | Multi value properties of a user
 * objectproperty    | Single value properties of a user
 * objectrelation    | User, group, company and sendas relations
 * @endcode
 *
 * @todo Add an image of the Zarafa database layout
 *
 * @section zarafa_db_update Database update system
 *
 * @todo describe the update system
 *
 *
 */

#define Z_TABLEDEF_ACL				"CREATE TABLE `acl` ( \
										`id` int(11) NOT NULL default '0', \
										`hierarchy_id` int(11) unsigned NOT NULL default '0', \
										`type` tinyint(4) unsigned NOT NULL default '0', \
										`rights` int(11) unsigned NOT NULL default '0', \
										PRIMARY KEY  (`hierarchy_id`,`id`,`type`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_HIERARCHY		"CREATE TABLE `hierarchy` ( \
										`id` int(11) unsigned NOT NULL auto_increment, \
										`parent` int(11) unsigned default '0', \
										`type` tinyint(4) unsigned NOT NULL default '0', \
										`flags` smallint(6) unsigned NOT NULL default '0', \
										`owner` int(11) unsigned NOT NULL default '0', \
										PRIMARY KEY  (`id`), \
										KEY `parenttypeflags` (`parent`, `type`, `flags`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_NAMES			"CREATE TABLE `names` ( \
										`id` int(11) NOT NULL auto_increment, \
										`nameid` int(11) default NULL, \
										`namestring` varchar(255) binary default NULL, \
										`guid` blob NOT NULL, \
										PRIMARY KEY  (`id`), \
										KEY `nameid` (`nameid`), \
										KEY `namestring` (`namestring`), \
										KEY `guidnameid` (`guid`(16),`nameid`), \
										KEY `guidnamestring` (`guid`(16),`namestring`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_MVPROPERTIES		"CREATE TABLE `mvproperties` ( \
										`hierarchyid` int(11) unsigned NOT NULL default '0', \
										`orderid` smallint(6) unsigned NOT NULL default '0', \
										`tag` smallint(6) unsigned NOT NULL default '0', \
										`type` smallint(6) unsigned NOT NULL default '0', \
										`val_ulong` int(11) unsigned default NULL, \
										`val_string` longtext, \
										`val_binary` longblob, \
										`val_double` double default NULL, \
										`val_longint` bigint(20) default NULL, \
										`val_hi` int(11) default NULL, \
										`val_lo` int(11) unsigned default NULL, \
										PRIMARY KEY (`hierarchyid`, `tag`, `type`, `orderid`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_TPROPERTIES		"CREATE TABLE `tproperties` ( \
										`folderid` int(11) unsigned NOT NULL default '0', \
										`hierarchyid` int(11) unsigned NOT NULL default '0', \
										`tag` smallint(6) unsigned NOT NULL default '0', \
										`type` smallint(6) unsigned NOT NULL, \
										`val_ulong` int(11) unsigned default NULL, \
										`val_string` longtext, \
										`val_binary` longblob, \
										`val_double` double default NULL, \
										`val_longint` bigint(20) default NULL, \
										`val_hi` int(11) default NULL, \
										`val_lo` int(11) unsigned default NULL, \
										PRIMARY KEY `ht` (`folderid`,`tag`,`hierarchyid`,`type`), \
										KEY `hi` (`hierarchyid`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_DELAYEDUPDATE	"CREATE TABLE `deferredupdate` (\
                                        `hierarchyid` int(11) unsigned NOT NULL, \
                                        `folderid` int(11) unsigned NOT NULL, \
                                        `srcfolderid` int(11) unsigned, \
                                        PRIMARY KEY(`hierarchyid`), \
                                        KEY `folderid` (`folderid`) \
                                    ) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_PROPERTIES		"CREATE TABLE `properties` ( \
										`hierarchyid` int(11) unsigned NOT NULL default '0', \
										`tag` smallint(6) unsigned NOT NULL default '0', \
										`type` smallint(6) unsigned NOT NULL, \
										`val_ulong` int(11) unsigned default NULL, \
										`val_string` longtext, \
										`val_binary` longblob, \
										`val_double` double default NULL, \
										`val_longint` bigint(20) default NULL, \
										`val_hi` int(11) default NULL, \
										`val_lo` int(11) unsigned default NULL, \
										`comp` bool default false, \
										PRIMARY KEY `ht` (`hierarchyid`,`tag`,`type`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_RECEIVEFOLDER	"CREATE TABLE `receivefolder` (  \
										`id` int(11) unsigned NOT NULL auto_increment, \
										`storeid` int(11) unsigned NOT NULL default '0', \
										`objid` int(11) unsigned NOT NULL default '0', \
										`messageclass` varchar(255) NOT NULL default '', \
										PRIMARY KEY  (`id`), \
										UNIQUE KEY `storeid` (`storeid`,`messageclass`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_STORES			"CREATE TABLE `stores` ( \
										`id` int(11) unsigned NOT NULL auto_increment, \
										`hierarchy_id` int(11) unsigned NOT NULL default '0', \
										`user_id` int(11) unsigned NOT NULL default '0', \
										`type` smallint(6) unsigned NOT NULL default '0', \
										`user_name` varchar(255) CHARACTER SET utf8 NOT NULL default '', \
										`company` int(11) unsigned NOT NULL default '0', \
										`guid` blob NOT NULL, \
										PRIMARY KEY  (`user_id`, `hierarchy_id`, `type`), \
										UNIQUE KEY `id` (`id`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_USERS			"CREATE TABLE `users` ( \
										`id` int(11) unsigned NOT NULL auto_increment, \
										`externid` blob, \
										`objectclass` int(11) NOT NULL default '0', \
										`signature` varbinary(255) NOT NULL default '0', \
										`company` int(11) unsigned NOT NULL default '0', \
										PRIMARY KEY  (`id`), \
										UNIQUE KEY externid (`externid`(255), `objectclass`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_OUTGOINGQUEUE	"CREATE TABLE `outgoingqueue` ( \
										`store_id` int(11) unsigned NOT NULL default '0', \
										`hierarchy_id` int(11) unsigned NOT NULL default '0', \
										`flags` tinyint(4) unsigned NOT NULL default '0', \
										PRIMARY KEY (`hierarchy_id`,`flags`,`store_id`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_LOB				"CREATE TABLE `lob` ( \
										`instanceid` int(11) unsigned NOT NULL, \
										`chunkid` smallint(6) unsigned NOT NULL, \
										`tag` smallint(6) unsigned NOT NULL, \
										`val_binary` longblob, \
										PRIMARY KEY (`instanceid`,`tag`,`chunkid`) \
									) ENGINE=InnoDB MAX_ROWS=1000000000 AVG_ROW_LENGTH=1750 CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_REFERENCES		"CREATE TABLE `singleinstances` ( \
										`instanceid` int(11) unsigned NOT NULL auto_increment, \
										`hierarchyid` int(11) unsigned NOT NULL default '0', \
										`tag` smallint(6) unsigned NOT NULL default '0', \
										PRIMARY KEY (`instanceid`, `hierarchyid`, `tag`), \
										UNIQUE KEY `hkey` (`hierarchyid`, `tag`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_OBJECT			"CREATE TABLE object ( \
										`id` int(11) unsigned NOT NULL auto_increment, \
										`externid` blob, \
										`objectclass` int(11) unsigned NOT NULL default '0', \
										PRIMARY KEY (`id`, `objectclass`), \
										UNIQUE KEY id (`id`), \
										UNIQUE KEY externid (`externid`(255), `objectclass`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_OBJECT_PROPERTY	"CREATE TABLE objectproperty ( \
										`objectid` int(11) unsigned NOT NULL default '0', \
										`propname` varchar(255) binary NOT NULL, \
										`value` text, \
										PRIMARY KEY  (`objectid`, `propname`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_OBJECT_MVPROPERTY "CREATE TABLE objectmvproperty ( \
										`objectid` int(11) unsigned NOT NULL default '0', \
										`propname` varchar(255) binary NOT NULL, \
										`orderid` tinyint(11) unsigned NOT NULL default '0', \
										`value` text, \
										PRIMARY KEY (`objectid`, `orderid`, `propname`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_OBJECT_RELATION	"CREATE TABLE objectrelation ( \
										`objectid` int(11) unsigned NOT NULL default '0', \
										`parentobjectid` int(11) unsigned NOT NULL default '0', \
										`relationtype` tinyint(11) unsigned NOT NULL, \
										PRIMARY KEY  (`objectid`, `parentobjectid`, `relationtype`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_VERSIONS			"CREATE TABLE versions ( \
										`major` int(11) unsigned NOT NULL default '0', \
										`minor` int(11) unsigned NOT NULL default '0', \
										`micro` int(11) unsigned not null default 0, \
										`revision` int(11) unsigned NOT NULL default '0', \
										`databaserevision` int(11) unsigned NOT NULL default '0', \
										`updatetime` datetime NOT NULL, \
										PRIMARY KEY  (`major`, `minor`, `micro`, `revision`, `databaserevision`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_SEARCHRESULTS	"CREATE TABLE searchresults ( \
										`folderid` int(11) unsigned NOT NULL default '0', \
										`hierarchyid` int(11) unsigned NOT NULL default '0', \
										`flags` int(11) unsigned NOT NULL default '0', \
										PRIMARY KEY (`folderid`, `hierarchyid`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_CHANGES			"CREATE TABLE `changes` ( \
										`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, \
										`sourcekey` VARBINARY(64) NOT NULL, \
										`parentsourcekey` VARBINARY(64) NOT NULL, \
										`change_type` INT(11) UNSIGNED NOT NULL DEFAULT '0', \
										`flags` INT(11) UNSIGNED DEFAULT NULL, \
										`sourcesync` INT(11) UNSIGNED DEFAULT NULL, \
										PRIMARY KEY (`parentsourcekey`,`sourcekey`,`change_type`), \
										UNIQUE KEY `changeid` (`id`), \
										UNIQUE KEY `state` (`parentsourcekey`,`id`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_ABCHANGES		"CREATE TABLE `abchanges` ( \
										`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, \
										`sourcekey` VARBINARY(255) NOT NULL, \
										`parentsourcekey` VARBINARY(255) NOT NULL, \
										`change_type` INT(11) UNSIGNED NOT NULL DEFAULT '0', \
										PRIMARY KEY (`parentsourcekey`,`change_type`,`sourcekey`), \
										UNIQUE KEY `changeid` (`id`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_SYNCS			"CREATE TABLE `syncs` ( \
										`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, \
										`sourcekey` VARBINARY(64) NOT NULL, \
										`change_id` INT(11) UNSIGNED NOT NULL, \
										`sync_type` INT(11) UNSIGNED NULL, \
										`sync_time` DATETIME NOT NULL, \
										PRIMARY KEY(`id`), \
										KEY `foldersync` (`sourcekey`,`sync_type`), \
										KEY `changes` (`change_id`), \
										KEY `sync_time` (`sync_time`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEFS_SYNCEDMESSAGES	"CREATE TABLE `syncedmessages` ( \
										`sync_id` int(11) unsigned NOT NULL, \
										`change_id` int(11) unsigned NOT NULL, \
										`sourcekey` varbinary(64) NOT NULL, \
										`parentsourcekey` varbinary(64) NOT NULL, \
										PRIMARY KEY  (`sync_id`,`change_id`,`sourcekey`), \
										KEY `sync_state` (`sync_id`,`change_id`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_INDEXED_PROPERTIES	"CREATE TABLE indexedproperties ( \
											`hierarchyid` int(11) unsigned NOT NULL default '0', \
											`tag` smallint(6) unsigned NOT NULL default '0', \
											`val_binary` varbinary(255), \
											PRIMARY KEY (`hierarchyid`, `tag`), \
											UNIQUE KEY `bin` (`tag`, `val_binary`) \
										) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_SETTINGS		"CREATE TABLE settings ( \
										`name` varchar(255) binary NOT NULL, \
										`value` blob NOT NULL, \
										PRIMARY KEY  (`name`) \
									) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

#define Z_TABLEDEF_CLIENTUPDATESTATUS "CREATE TABLE clientupdatestatus ( \
										`userid` int(11) unsigned NOT NULL, \
										`trackid` int(11) unsigned NOT NULL, \
										`updatetime` DATETIME NOT NULL, \
										`currentversion` varchar(50) binary NOT NULL, \
										`latestversion` varchar(50) binary NOT NULL, \
										`computername` varchar(255) binary NOT NULL, \
										`status` int(11) unsigned NOT NULL, \
										PRIMARY KEY (`userid`), \
										UNIQUE KEY (`trackid`) \
										)  ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;"

// Default mysql table data
#define Z_TABLEDATA_ACL				"INSERT INTO `acl` VALUES (2, 2, 2, 1531), \
										(2, 1, 2, 1531), \
										(1, 1, 2, 1531), \
										(1, 2, 2, 1531);"

#define Z_TABLEDATA_HIERARCHY		"INSERT INTO `hierarchy` VALUES \
										(1, NULL, 1, 0, 2),\
										(2, 1, 3, 0, 2);"

#define Z_TABLEDATA_PROPERTIES		"INSERT INTO `properties` VALUES \
										(1, 12289, 30, NULL, 'Admin store', NULL, NULL, NULL, NULL, NULL, false), \
										(2, 12289, 30, NULL, 'root Admin store', NULL, NULL, NULL, NULL, NULL, false);"

#define Z_TABLEDATA_STORES			"INSERT INTO `stores` VALUES (1, 1, 2, 0, 'SYSTEM', 0, 0x8962ffeffb7b4d639bc5967c4bb58234);"

//1=ZARAFA_UID_EVERYONE, 0x30002=DISTLIST_SECURITY
//2=ZARAFA_UID_SYSTEM, 0x10001=ACTIVE_USER
#define Z_TABLEDATA_USERS			"INSERT INTO `users` (`id`, `externid`, `objectclass`, `signature`, `company`) VALUES \
										(1, NULL, 0x30002, '', 0), \
										(2, NULL, 0x10001, '', 0);"

#define Z_TABLEDATA_INDEXED_PROPERTIES "INSERT INTO `indexedproperties` VALUES (1, 0x0FFF, 0x000000008962ffeffb7b4d639bc5967c4bb5823400000000010000000100000000000000 ), \
											(2,0x0FFF, 0x000000008962ffeffb7b4d639bc5967c4bb5823400000000030000000200000000000000);"

#define Z_TABLEDATA_SETTINGS "INSERT INTO `settings` VALUES ('source_key_auto_increment' , CHAR(0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)), \
															('imapseq', '3'), \
															('charset', 'utf8');"

// Database update definitions
#define Z_UPDATE_CREATE_VERSIONS_TABLE			1
#define Z_UPDATE_CREATE_SEARCHFOLDERS_TABLE		2
#define Z_UPDATE_FIX_USERTABLE_NONACTIVE		3
#define Z_UPDATE_ADD_FLAGS_TO_SEARCHRESULTS		4
#define Z_UPDATE_POPULATE_SEARCHFOLDERS			5
#define Z_UPDATE_CREATE_CHANGES_TABLE			6
#define Z_UPDATE_CREATE_SYNCS_TABLE 			7
#define Z_UPDATE_CREATE_INDEXEDPROPS_TABLE		8
#define Z_UPDATE_CREATE_SETTINGS_TABLE			9
#define Z_UPDATE_CREATE_SERVER_GUID				10
#define Z_UPDATE_CREATE_SOURCE_KEYS				11
#define Z_UPDATE_CONVERT_ENTRYIDS				12
#define Z_UPDATE_CONVERT_SC_ENTRYIDLIST			13
#define Z_UPDATE_CONVERT_USER_OBJECT_TYPE		14
#define Z_UPDATE_ADD_USER_SIGNATURE				15
#define Z_UPDATE_ADD_SOURCE_KEY_SETTING			16
#define Z_UPDATE_FIX_USERS_RESTRICTIONS			17
#define Z_UPDATE_ADD_USER_COMPANY				18
#define Z_UPDATE_ADD_OBJECT_RELATION_TYPE		19
#define Z_UPDATE_DEL_DEFAULT_COMPANY			20
#define Z_UPDATE_ADD_COMPANY_TO_STORES			21
#define Z_UPDATE_ADD_IMAP_SEQ					22
#define Z_UPDATE_KEYS_CHANGES					23
#define Z_UPDATE_MOVE_PUBLICFOLDERS				24
#define Z_UPDATE_ADD_EXTERNID_TO_OBJECT			25
#define Z_UPDATE_CREATE_REFERENCES				26
#define Z_UPDATE_LOCK_DISTRIBUTED				27
#define Z_UPDATE_CREATE_ABCHANGES_TABLE			28
#define Z_UPDATE_SINGLEINSTANCE_TAG				29
#define Z_UPDATE_CREATE_SYNCEDMESSAGES_TABLE	30
#define Z_UPDATE_FORCE_AB_RESYNC				31
#define Z_UPDATE_RENAME_OBJECT_TYPE_TO_CLASS	32
#define Z_UPDATE_CONVERT_OBJECT_TYPE_TO_CLASS	33
#define Z_UPDATE_ADD_OBJECT_MVPROPERTY_TABLE	34
#define Z_UPDATE_COMPANYNAME_TO_COMPANYID		35
#define Z_UPDATE_OUTGOINGQUEUE_PRIMARY_KEY		36
#define Z_UPDATE_ACL_PRIMARY_KEY				37
#define Z_UPDATE_BLOB_EXTERNID					38
#define Z_UPDATE_KEYS_CHANGES_2					39
#define Z_UPDATE_MVPROPERTIES_PRIMARY_KEY		40
#define Z_UPDATE_FIX_SECURITYGROUP_DBPLUGIN		41
#define Z_UPDATE_CONVERT_SENDAS_DBPLUGIN		42
#define Z_UPDATE_MOVE_IMAP_SUBSCRIBES			43
#define Z_UPDATE_SYNC_TIME_KEY					44
#define Z_UPDATE_ADD_STATE_KEY					45
#define Z_UPDATE_CONVERT_TO_UNICODE				46
#define Z_UPDATE_CONVERT_STORE_USERNAME			47
#define Z_UPDATE_CONVERT_RULES					48
#define Z_UPDATE_CONVERT_SEARCH_FOLDERS			49
#define Z_UPDATE_CONVERT_PROPERTIES				50
#define Z_UPDATE_CREATE_COUNTERS				51
#define Z_UPDATE_CREATE_COMMON_PROPS			52
#define Z_UPDATE_CHECK_ATTACHMENTS				53
#define Z_UPDATE_CREATE_TPROPERTIES				54
#define Z_UPDATE_CONVERT_HIERARCHY				55
#define Z_UPDATE_CREATE_DEFERRED				56
#define Z_UPDATE_CONVERT_CHANGES				57
#define Z_UPDATE_CONVERT_NAMES					58
#define Z_UPDATE_CONVERT_RF_TOUNICODE			59
#define Z_UPDATE_CREATE_CLIENTUPDATE_TABLE		60
#define Z_UPDATE_CONVERT_STORES					61
#define Z_UPDATE_UPDATE_STORES					62
#define Z_UPDATE_UPDATE_WLINK_RECKEY			63
#define Z_UPDATE_VERSIONTBL_MICRO 64
#define Z_UPDATE_CHANGES_PKEY 65
#define Z_UPDATE_ABCHANGES_PKEY 66

/*
 * The first population of the SQL tables can use both create-type and
 * update-type operations; %Z_UPDATE_RELEASE_ID specifies the schema
 * version that can be reached with creates only.
 * (This is never less than %Z_UPDATE_LAST.)
 */
#define Z_UPDATE_RELEASE_ID 66

// This is the last update ID always update this to the last ID
#define Z_UPDATE_LAST 66

#endif
