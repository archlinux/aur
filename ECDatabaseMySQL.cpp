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

#include <zarafa/platform.h>

#include <iostream>
#include <errmsg.h>
#include "ECDatabaseMySQL.h"
#include "mysqld_error.h"

#include <zarafa/stringutil.h>

#include <zarafa/ECDefs.h>
#include "ECDBDef.h"
#include "ECUserManagement.h"
#include <zarafa/ECConfig.h>
#include <zarafa/ECLogger.h>
#include <zarafa/MAPIErrors.h>
#include <zarafa/ZarafaCode.h>

#include <zarafa/ecversion.h>

#include <mapidefs.h>
#include "ECConversion.h"
#include "SOAPUtils.h"
#include "ECSearchFolders.h"

#include "ECDatabaseUpdate.h"
#include "ECStatsCollector.h"

#ifdef HAVE_OFFLINE_SUPPORT
#include "ECDBUpdateProgress.h"
#endif

using namespace std;

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static const char THIS_FILE[] = __FILE__;
#endif
#ifdef DEBUG
#define DEBUG_SQL 0
#define DEBUG_TRANSACTION 0
#endif

#define LOG_SQL_DEBUG(_msg, ...) \
	ec_log(EC_LOGLEVEL_DEBUG | EC_LOGLEVEL_SQL, _msg, ##__VA_ARGS__)

// The maximum packet size. This is automatically also the maximum
// size of a single entry in the database. This means that PR_BODY, PR_COMPRESSED_RTF
// etc. cannot grow larger than 16M. This shouldn't be such a problem in practice.

// In debian lenny, setting your max_allowed_packet to 16M actually gives this value.... Unknown
// why.
#define MAX_ALLOWED_PACKET			16776192

typedef struct _sUpdateList {
	unsigned int ulVersion;
	unsigned int ulVersionMin; // Version to start the update
	const char *lpszLogComment;
	ECRESULT (*lpFunction)(ECDatabase* lpDatabase);
} sUpdateList_t;

typedef struct _sNewDatabase {
	const char *lpComment;
	const char *lpSQL;
} sSQLDatabase_t;

class zcp_versiontuple _zcp_final {
	public:
	zcp_versiontuple(unsigned int maj = 0, unsigned int min = 0,
	    unsigned int mic = 0, unsigned int rev = 0, unsigned int dbs = 0) :
		v_major(maj), v_minor(min), v_micro(mic),
		v_rev(rev), v_schema(dbs)
	{
	}
	std::string stringify(char sep = '.') const;
	int compare(const zcp_versiontuple &) const;
	/* stupid major(3) function uses a #define in glibc */
	unsigned int v_major, v_minor, v_micro, v_rev, v_schema;
};

static const sUpdateList_t sUpdateList[] = {
	// Updates from version 5.02 to 5.10
	{ Z_UPDATE_CREATE_VERSIONS_TABLE, 0, "Create table: versions", UpdateDatabaseCreateVersionsTable },
	{ Z_UPDATE_CREATE_SEARCHFOLDERS_TABLE, 0, "Create table: searchresults", UpdateDatabaseCreateSearchFolders },
	{ Z_UPDATE_FIX_USERTABLE_NONACTIVE, 0, "Update table: users, field: nonactive", UpdateDatabaseFixUserNonActive },
	// Only update if previous revision was after Z_UPDATE_CREATE_SEARCHFOLDERS_TABLE, because the definition has changed
	{ Z_UPDATE_ADD_FLAGS_TO_SEARCHRESULTS, Z_UPDATE_CREATE_SEARCHFOLDERS_TABLE, "Update table: searchresults", UpdateDatabaseCreateSearchFoldersFlags },
	{ Z_UPDATE_POPULATE_SEARCHFOLDERS, 0, "Populate search folders", UpdateDatabasePopulateSearchFolders },

	// Updates from version 5.10 to 5.20
	{ Z_UPDATE_CREATE_CHANGES_TABLE, 0, "Create table: changes", UpdateDatabaseCreateChangesTable },
	{ Z_UPDATE_CREATE_SYNCS_TABLE, 0, "Create table: syncs", UpdateDatabaseCreateSyncsTable },
	{ Z_UPDATE_CREATE_INDEXEDPROPS_TABLE, 0, "Create table: indexedproperties", UpdateDatabaseCreateIndexedPropertiesTable },
	{ Z_UPDATE_CREATE_SETTINGS_TABLE, 0, "Create table: settings", UpdateDatabaseCreateSettingsTable},
	{ Z_UPDATE_CREATE_SERVER_GUID, 0, "Insert server GUID into settings", UpdateDatabaseCreateServerGUID },
	{ Z_UPDATE_CREATE_SOURCE_KEYS, 0, "Insert source keys into indexedproperties", UpdateDatabaseCreateSourceKeys },

	// Updates from version 5.20 to 6.00
	{ Z_UPDATE_CONVERT_ENTRYIDS, 0, "Convert entryids: indexedproperties", UpdateDatabaseConvertEntryIDs },
	{ Z_UPDATE_CONVERT_SC_ENTRYIDLIST, 0, "Update entrylist searchcriteria", UpdateDatabaseSearchCriteria },
	{ Z_UPDATE_CONVERT_USER_OBJECT_TYPE, 0, "Add Object type to 'users' table", UpdateDatabaseAddUserObjectType },
	{ Z_UPDATE_ADD_USER_SIGNATURE, 0, "Add signature to 'users' table", UpdateDatabaseAddUserSignature },
	{ Z_UPDATE_ADD_SOURCE_KEY_SETTING, 0, "Add setting 'source_key_auto_increment'", UpdateDatabaseAddSourceKeySetting },
	{ Z_UPDATE_FIX_USERS_RESTRICTIONS, 0, "Add restriction to 'users' table", UpdateDatabaseRestrictExternId },

	// Update from version 6.00 to 6.10
	{ Z_UPDATE_ADD_USER_COMPANY, 0, "Add company column to 'users' table", UpdateDatabaseAddUserCompany },
	{ Z_UPDATE_ADD_OBJECT_RELATION_TYPE, 0, "Add Object relation type to 'objectrelation' table", UpdateDatabaseAddObjectRelationType },
	{ Z_UPDATE_DEL_DEFAULT_COMPANY, 0, "Delete default company from 'users' table", UpdateDatabaseDelUserCompany},
	{ Z_UPDATE_ADD_COMPANY_TO_STORES, 0, "Adding company to 'stores' table", UpdateDatabaseAddCompanyToStore},

	// Update from version x to x
	{ Z_UPDATE_ADD_IMAP_SEQ, 0, "Add IMAP sequence number in 'settings' table", UpdateDatabaseAddIMAPSequenceNumber},
	{ Z_UPDATE_KEYS_CHANGES, Z_UPDATE_CREATE_CHANGES_TABLE, "Update keys in 'changes' table", UpdateDatabaseKeysChanges},

	// Update from version 6.1x to 6.20
	{ Z_UPDATE_MOVE_PUBLICFOLDERS, 0, "Moving publicfolders and favorites", UpdateDatabaseMoveFoldersInPublicFolder},

	// Update from version 6.2x to 6.30
	{ Z_UPDATE_ADD_EXTERNID_TO_OBJECT, 0, "Adding externid to 'object' table", UpdateDatabaseAddExternIdToObject}, 
	{ Z_UPDATE_CREATE_REFERENCES, 0, "Creating Single Instance Attachment table", UpdateDatabaseCreateReferences},
	{ Z_UPDATE_LOCK_DISTRIBUTED, 0, "Locking multiserver capability", UpdateDatabaseLockDistributed},
	{ Z_UPDATE_CREATE_ABCHANGES_TABLE, 0, "Creating Addressbook Changes table", UpdateDatabaseCreateABChangesTable},
	{ Z_UPDATE_SINGLEINSTANCE_TAG, 0, "Updating 'singleinstances' table to correct tag value", UpdateDatabaseSetSingleinstanceTag},

	// Update from version 6.3x to 6.40
	{ Z_UPDATE_CREATE_SYNCEDMESSAGES_TABLE, 0, "Create table: synced messages", UpdateDatabaseCreateSyncedMessagesTable},
	
	// Update from < 6.30 to >= 6.30
	{ Z_UPDATE_FORCE_AB_RESYNC, 0, "Force Addressbook Resync", UpdateDatabaseForceAbResync},
	
	// Update from version 6.3x to 6.40
	{ Z_UPDATE_RENAME_OBJECT_TYPE_TO_CLASS, 0, "Rename objecttype columns to objectclass", UpdateDatabaseRenameObjectTypeToObjectClass},
	{ Z_UPDATE_CONVERT_OBJECT_TYPE_TO_CLASS, 0, "Convert objecttype columns to objectclass values", UpdateDatabaseConvertObjectTypeToObjectClass},
	{ Z_UPDATE_ADD_OBJECT_MVPROPERTY_TABLE, 0, "Add object MV property table", UpdateDatabaseAddMVPropertyTable},
	{ Z_UPDATE_COMPANYNAME_TO_COMPANYID, 0, "Link objects in DB plugin through companyid", UpdateDatabaseCompanyNameToCompanyId},
	{ Z_UPDATE_OUTGOINGQUEUE_PRIMARY_KEY, 0, "Update outgoingqueue key", UpdateDatabaseOutgoingQueuePrimarykey},
	{ Z_UPDATE_ACL_PRIMARY_KEY, 0, "Update acl key", UpdateDatabaseACLPrimarykey},
	{ Z_UPDATE_BLOB_EXTERNID, 0, "Update externid in object table", UpdateDatabaseBlobExternId}, // Avoid MySQL 4.x traling spaces quirk
	{ Z_UPDATE_KEYS_CHANGES_2, 0, "Update keys in 'changes' table", UpdateDatabaseKeysChanges2},
	{ Z_UPDATE_MVPROPERTIES_PRIMARY_KEY, 0, "Update mvproperties key", UpdateDatabaseMVPropertiesPrimarykey},
	{ Z_UPDATE_FIX_SECURITYGROUP_DBPLUGIN, 0, "Update DB plugin group to security groups", UpdateDatabaseFixDBPluginGroups},
	{ Z_UPDATE_CONVERT_SENDAS_DBPLUGIN, 0, "Update DB/Unix plugin sendas settings", UpdateDatabaseFixDBPluginSendAs},

	{ Z_UPDATE_MOVE_IMAP_SUBSCRIBES, 0, "Move IMAP subscribed list from store to inbox", UpdateDatabaseMoveSubscribedList},
	{ Z_UPDATE_SYNC_TIME_KEY, 0, "Update sync table time index", UpdateDatabaseSyncTimeIndex },

	// Update within the 6.40
	{ Z_UPDATE_ADD_STATE_KEY, 0, "Update changes table state key", UpdateDatabaseAddStateKey },

	// Blocking upgrade from 6.40 to 7.00, tables are not unicode compatible.
	{ Z_UPDATE_CONVERT_TO_UNICODE, 0, "Converting database to Unicode", UpdateDatabaseConvertToUnicode },

	// Update from version 6.4x to 7.00
	{ Z_UPDATE_CONVERT_STORE_USERNAME, 0, "Update stores table usernames", UpdateDatabaseConvertStoreUsername },
	{ Z_UPDATE_CONVERT_RULES, 0, "Converting rules to Unicode", UpdateDatabaseConvertRules },
	{ Z_UPDATE_CONVERT_SEARCH_FOLDERS, 0, "Converting search folders to Unicode", UpdateDatabaseConvertSearchFolders },
	{ Z_UPDATE_CONVERT_PROPERTIES, 0, "Converting properties for IO performance", UpdateDatabaseConvertProperties },
	{ Z_UPDATE_CREATE_COUNTERS, 0, "Creating counters for IO performance", UpdateDatabaseCreateCounters },
	{ Z_UPDATE_CREATE_COMMON_PROPS, 0, "Creating common properties for IO performance", UpdateDatabaseCreateCommonProps },
	{ Z_UPDATE_CHECK_ATTACHMENTS, 0, "Checking message attachment properties for IO performance", UpdateDatabaseCheckAttachments },
	{ Z_UPDATE_CREATE_TPROPERTIES, 0, "Creating tproperties for IO performance", UpdateDatabaseCreateTProperties },
	{ Z_UPDATE_CONVERT_HIERARCHY, 0, "Converting hierarchy for IO performance", UpdateDatabaseConvertHierarchy },
	{ Z_UPDATE_CREATE_DEFERRED, 0, "Creating deferred table for IO performance", UpdateDatabaseCreateDeferred },
	{ Z_UPDATE_CONVERT_CHANGES, 0, "Converting changes for IO performance", UpdateDatabaseConvertChanges },
	{ Z_UPDATE_CONVERT_NAMES, 0, "Converting names table to Unicode", UpdateDatabaseConvertNames },

	// Update from version 7.00 to 7.0.1
	{ Z_UPDATE_CONVERT_RF_TOUNICODE, 0, "Converting receivefolder table to Unicode", UpdateDatabaseReceiveFolderToUnicode },

	// Update from 6.40.13 / 7.0.3
	{ Z_UPDATE_CREATE_CLIENTUPDATE_TABLE, 0, "Creating client update status table", UpdateDatabaseClientUpdateStatus },

	{ Z_UPDATE_CONVERT_STORES, 0, "Converting stores table", UpdateDatabaseConvertStores },
	{ Z_UPDATE_UPDATE_STORES, 0, "Updating stores table", UpdateDatabaseUpdateStores },
	
	// Update from 7.0 to 7.1
	{ Z_UPDATE_UPDATE_WLINK_RECKEY, 0, "Updating wunderbar record keys", UpdateWLinkRecordKeys },

	// New in 7.2.2
	{ Z_UPDATE_VERSIONTBL_MICRO, 0, "Add \"micro\" column to \"versions\" table", UpdateVersionsTbl },
	
	// New in 8.1.0 / 7.2.4, MySQL 5.7 compatibility
	{ Z_UPDATE_ABCHANGES_PKEY, 0, "Updating abchanges table", UpdateABChangesTbl },
	{ Z_UPDATE_CHANGES_PKEY, 0, "Updating changes table", UpdateChangesTbl },
};

static const char *const server_groups[] = {
  "zarafa",
  NULL,
};

typedef struct {
	const char *szName;
	const char *szSQL;
} STOREDPROCS;

/**
 * Mode 0 = All bodies
 * Mode 1 = Best body only (RTF better than HTML) + plaintext
 * Mode 2 = Plaintext only
 */
 
static const char szGetProps[] =
"CREATE PROCEDURE GetProps(IN hid integer, IN mode integer)\n"
"BEGIN\n"
"  DECLARE bestbody INT;\n"

"  IF mode = 1 THEN\n"
"  	 call GetBestBody(hid, bestbody);\n"
"  END IF;\n"
  
"  SELECT 0, tag, properties.type, val_ulong, val_string, val_binary, val_double, val_longint, val_hi, val_lo, 0, names.nameid, names.namestring, names.guid\n"
"    FROM properties LEFT JOIN names ON (properties.tag-0x8501)=names.id WHERE hierarchyid=hid AND (tag <= 0x8500 OR names.id IS NOT NULL) AND (tag NOT IN (0x1009, 0x1013) OR mode = 0 OR (mode = 1 AND tag = bestbody) )\n"
"  UNION\n"
"  SELECT count(*), tag, mvproperties.type, \n"
"          group_concat(length(mvproperties.val_ulong),':', mvproperties.val_ulong ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_string),':', mvproperties.val_string ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_binary),':', mvproperties.val_binary ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_double),':', mvproperties.val_double ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_longint),':', mvproperties.val_longint ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_hi),':', mvproperties.val_hi ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_lo),':', mvproperties.val_lo ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          0, names.nameid, names.namestring, names.guid \n"
"    FROM mvproperties LEFT JOIN names ON (mvproperties.tag-0x8501)=names.id WHERE hierarchyid=hid AND (tag <= 0x8500 OR names.id IS NOT NULL) GROUP BY tag, mvproperties.type; \n"
"END;\n";

static const char szPrepareGetProps[] =
"CREATE PROCEDURE PrepareGetProps(IN hid integer)\n"
"BEGIN\n"
"  SELECT 0, tag, properties.type, val_ulong, val_string, val_binary, val_double, val_longint, val_hi, val_lo, hierarchy.id, names.nameid, names.namestring, names.guid\n"
"    FROM properties JOIN hierarchy ON properties.hierarchyid=hierarchy.id LEFT JOIN names ON (properties.tag-0x8501)=names.id WHERE hierarchy.parent=hid AND (tag <= 0x8500 OR names.id IS NOT NULL);\n"
"  SELECT count(*), tag, mvproperties.type, \n"
"          group_concat(length(mvproperties.val_ulong),':', mvproperties.val_ulong ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_string),':', mvproperties.val_string ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_binary),':', mvproperties.val_binary ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_double),':', mvproperties.val_double ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_longint),':', mvproperties.val_longint ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_hi),':', mvproperties.val_hi ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          group_concat(length(mvproperties.val_lo),':', mvproperties.val_lo ORDER BY mvproperties.orderid SEPARATOR ''), \n"
"          hierarchy.id, names.nameid, names.namestring, names.guid \n"
"    FROM mvproperties JOIN hierarchy ON mvproperties.hierarchyid=hierarchy.id LEFT JOIN names ON (mvproperties.tag-0x8501)=names.id WHERE hierarchy.parent=hid AND (tag <= 0x8500 OR names.id IS NOT NULL) GROUP BY tag, mvproperties.type; \n"
"END;\n";


static const char szGetBestBody[] =
"CREATE PROCEDURE GetBestBody(hid integer, OUT bestbody integer)\n"
"DETERMINISTIC\n"
"BEGIN\n"
"  DECLARE best INT;\n"
"  DECLARE CONTINUE HANDLER FOR NOT FOUND\n"
"    SET bestbody = 0 ;\n"
"  \n"
"  # Get body with lowest id (RTF before HTML)\n"
"  SELECT tag INTO bestbody FROM properties WHERE hierarchyid=hid AND tag IN (0x1009, 0x1013) ORDER BY tag LIMIT 1;\n"
"END;\n";

static const char szStreamObj[] =
"# Read a type-5 (Message) item from the database, output properties and subobjects\n"
"CREATE PROCEDURE StreamObj(IN rootid integer, IN maxdepth integer, IN mode integer)\n"
"BEGIN\n"
"DECLARE no_more_rows BOOLEAN;\n"
"DECLARE subid INT;\n"
"DECLARE subsubid INT;\n"
"DECLARE subtype INT;\n"
"DECLARE cur_hierarchy CURSOR FOR\n"
"	SELECT id,hierarchy.type FROM hierarchy WHERE parent=rootid AND type=7; \n"
"DECLARE CONTINUE HANDLER FOR NOT FOUND\n"
"    SET no_more_rows = TRUE;\n"

"  call GetProps(rootid, mode);\n"

"  call PrepareGetProps(rootid);\n"
 
"  SELECT id,hierarchy.type FROM hierarchy WHERE parent=rootid;\n"

"  OPEN cur_hierarchy;\n"

"  the_loop: LOOP\n"
"    FETCH cur_hierarchy INTO subid, subtype;\n"

"    IF no_more_rows THEN\n"
"      CLOSE cur_hierarchy;\n"
"      LEAVE the_loop;\n"
"    END IF;\n"

"    IF subtype = 7 THEN\n"
"      BEGIN\n"
"        DECLARE CONTINUE HANDLER FOR NOT FOUND set subsubid = 0;\n"

"        IF maxdepth > 0 THEN\n"
"          SELECT id INTO subsubid FROM hierarchy WHERE parent=subid LIMIT 1;\n"
"          SELECT id, hierarchy.type FROM hierarchy WHERE parent = subid LIMIT 1;\n"

"          IF subsubid != 0 THEN\n"
"            # Recurse into submessage (must be type 5 since attachments can only contain nested messages)\n"
"            call StreamObj(subsubid, maxdepth-1, mode);\n"
"          END IF;\n"
"        ELSE\n"
"          # Maximum depth reached. Output a zero-length subset to indicate that we're\n"
"          # not recursing further.\n"
"          SELECT id, hierarchy.type FROM hierarchy WHERE parent=subid LIMIT 0;\n"
"        END IF;\n"
"      END;\n"

"    END IF;\n"
"  END LOOP the_loop;\n"

"END\n";

static const STOREDPROCS stored_procedures[] = {
	{ "GetProps", szGetProps },
	{ "PrepareGetProps", szPrepareGetProps },
	{ "GetBestBody", szGetBestBody },
	{ "StreamObj", szStreamObj }
};

std::string	ECDatabaseMySQL::m_strDatabaseDir;

std::string zcp_versiontuple::stringify(char sep) const
{
	return ::stringify(v_major) + sep + ::stringify(v_minor) + sep +
	       ::stringify(v_micro) + sep + ::stringify(v_rev) + sep +
	       ::stringify(v_schema);
}

int zcp_versiontuple::compare(const zcp_versiontuple &rhs) const
{
	if (v_major < rhs.v_major)
		return -1;
	if (v_major > rhs.v_major)
		return 1;
	if (v_minor < rhs.v_minor)
		return -1;
	if (v_minor > rhs.v_minor)
		return 1;
	if (v_micro < rhs.v_micro)
		return -1;
	if (v_micro > rhs.v_micro)
		return 1;
	if (v_rev < rhs.v_rev)
		return -1;
	if (v_rev > rhs.v_rev)
		return 1;
	return 0;
}

ECDatabaseMySQL::ECDatabaseMySQL(ECConfig *lpConfig)
{
	m_bMysqlInitialize	= false;
	m_bConnected		= false;
	m_bAutoLock			= true;
	m_lpConfig			= lpConfig;
	m_bSuppressLockErrorLogging = false;

	// Create a mutex handle for mysql
	pthread_mutexattr_t mattr;
	pthread_mutexattr_init(&mattr);
	pthread_mutexattr_settype(&mattr, PTHREAD_MUTEX_RECURSIVE);
	pthread_mutex_init(&m_hMutexMySql, &mattr);

#ifdef DEBUG
	m_ulTransactionState = 0;
#endif	

}

ECDatabaseMySQL::~ECDatabaseMySQL()
{
	Close();
	// Close the mutex handle of mysql
	pthread_mutex_destroy(&m_hMutexMySql);
}

ECRESULT ECDatabaseMySQL::InitLibrary(const char *lpDatabaseDir,
    const char *lpConfigFile)
{
	ECRESULT	er = erSuccess;
	string		strDatabaseDir;
	string		strConfigFile;
	int			ret = 0;

	if(lpDatabaseDir) {
    	strDatabaseDir = "--datadir=";
    	strDatabaseDir+= lpDatabaseDir;

		m_strDatabaseDir = lpDatabaseDir;
    }

    if(lpConfigFile) {
    	strConfigFile = "--defaults-file=";
    	strConfigFile+= lpConfigFile;
    }
	
	const char *server_args[] = {
		"zarafa",		/* this string is not used */
		strConfigFile.c_str(),
		strDatabaseDir.c_str(),
	};
	/*
	 * mysql's function signature stinks, and even their samples
	 * do the cast :(
	 */
	if ((ret = mysql_library_init(arraySize(server_args),
	     const_cast<char **>(server_args),
	     const_cast<char **>(server_groups))) != 0) {
		ec_log_crit("Unable to initialize mysql: error 0x%08X", ret);
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}

exit:
	return er;
}

/**
 * Initialize anything that has to be initialized at server startup.
 *
 * Currently this means we're updating all the stored procedure definitions
 */
ECRESULT ECDatabaseMySQL::InitializeDBState(void)
{
	ECRESULT ret = InitializeDBStateInner();

#ifdef HAVE_OFFLINE_SUPPORT
	/* Only do this recovery on the Windows thing */
	if (ret == erSuccess)
		return ret;

	/* Start "repair" */
	ec_log_err("InitializeDBState unsuccessful: %s (%d). Attempting drop, and retry.",
		GetMAPIErrorMessage(ZarafaErrorToMAPIError(ret, hrSuccess)),
		ret);
	ret = DoUpdate("DROP TABLE mysql.proc");
	if (ret != erSuccess)
		goto exit;
	ret = DoUpdate("DROP TABLE mysql.plugin");
	if (ret != erSuccess)
		goto exit;
	ret = DoUpdate("DROP TABLE mysql.innodb_table_stats");
	if (ret != erSuccess)
		goto exit;
	ret = DoUpdate("DROP TABLE mysql.innodb_index_stats");
	if (ret != erSuccess)
		goto exit;
	return InitializeDBStateInner();
 exit:
	ec_log_err("Error during drop");
#endif

	return ret;
}

ECRESULT ECDatabaseMySQL::InitializeDBStateInner()
{
	ECRESULT er = erSuccess;

#ifdef HAVE_OFFLINE_SUPPORT
	// Unsure the stored procedures table is available
	
	const char szProc[] =
		"CREATE TABLE IF NOT EXISTS mysql.proc (db char(64) collate utf8_bin DEFAULT '' NOT NULL, name char(64) DEFAULT '' NOT NULL, type enum('FUNCTION','PROCEDURE') NOT NULL, specific_name char(64) DEFAULT '' NOT NULL, language enum('SQL') DEFAULT 'SQL' NOT NULL, sql_data_access enum( 'CONTAINS_SQL', 'NO_SQL', 'READS_SQL_DATA', 'MODIFIES_SQL_DATA') DEFAULT 'CONTAINS_SQL' NOT NULL, is_deterministic enum('YES','NO') DEFAULT 'NO' NOT NULL, security_type enum('INVOKER','DEFINER') DEFAULT 'DEFINER' NOT NULL, param_list blob NOT NULL, returns longblob NOT NULL, body longblob NOT NULL, definer char(141) collate utf8_bin DEFAULT '' NOT NULL, created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, modified timestamp NOT NULL DEFAULT '0000-00-00 00:00:00', sql_mode set( 'REAL_AS_FLOAT', 'PIPES_AS_CONCAT', 'ANSI_QUOTES', 'IGNORE_SPACE', 'IGNORE_BAD_TABLE_OPTIONS', 'ONLY_FULL_GROUP_BY', 'NO_UNSIGNED_SUBTRACTION', 'NO_DIR_IN_CREATE', 'POSTGRESQL', 'ORACLE', 'MSSQL', 'DB2', 'MAXDB', 'NO_KEY_OPTIONS', 'NO_TABLE_OPTIONS', 'NO_FIELD_OPTIONS', 'MYSQL323', 'MYSQL40', 'ANSI', 'NO_AUTO_VALUE_ON_ZERO', 'NO_BACKSLASH_ESCAPES', 'STRICT_TRANS_TABLES', 'STRICT_ALL_TABLES', 'NO_ZERO_IN_DATE', 'NO_ZERO_DATE', 'INVALID_DATES', 'ERROR_FOR_DIVISION_BY_ZERO', 'TRADITIONAL', 'NO_AUTO_CREATE_USER', 'HIGH_NOT_PRECEDENCE', 'NO_ENGINE_SUBSTITUTION', 'PAD_CHAR_TO_FULL_LENGTH') DEFAULT '' NOT NULL, comment text collate utf8_bin NOT NULL, character_set_client char(32) collate utf8_bin, collation_connection char(32) collate utf8_bin, db_collation char(32) collate utf8_bin, body_utf8 longblob, PRIMARY KEY (db,name,type)) engine=MyISAM character set utf8 comment='Stored Procedures';";
	const char szPlugin[] =
		"CREATE TABLE IF NOT EXISTS mysql.plugin (name varchar(64) DEFAULT '' NOT NULL, dl varchar(128) DEFAULT '' NOT NULL, PRIMARY KEY (name)) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci comment='MySQL plugins';";
	const char szInnoStats[] =
		"CREATE TABLE IF NOT EXISTS mysql.innodb_table_stats ( database_name VARCHAR(64) NOT NULL, table_name VARCHAR(64) NOT NULL, last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, n_rows BIGINT UNSIGNED NOT NULL, clustered_index_size BIGINT UNSIGNED NOT NULL, sum_of_other_index_sizes BIGINT UNSIGNED NOT NULL, PRIMARY KEY (database_name, table_name)) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;";
	const char szInnoIndexStats[] =
		"CREATE TABLE IF NOT EXISTS mysql.innodb_index_stats ( database_name VARCHAR(64) NOT NULL, table_name VARCHAR(64) NOT NULL, index_name VARCHAR(64) NOT NULL, last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, stat_name VARCHAR(64) NOT NULL, stat_value BIGINT UNSIGNED NOT NULL, sample_size BIGINT UNSIGNED, stat_description VARCHAR(1024) NOT NULL, PRIMARY KEY (database_name, table_name, index_name, stat_name)) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;";

	er = DoUpdate("CREATE DATABASE IF NOT EXISTS mysql");
	if(er != erSuccess)
		goto exit;

	er = DoUpdate(szProc);
	if(er != erSuccess)
		goto exit;
		
	er = DoUpdate(szPlugin);
	if(er != erSuccess)
		goto exit;

	er = DoUpdate(szInnoStats);
	if(er != erSuccess)
		goto exit;

	er = DoUpdate(szInnoIndexStats);
	if(er != erSuccess)
		goto exit;
#endif
	
	for (unsigned int i = 0; i < arraySize(stored_procedures); ++i) {
		er = DoUpdate(std::string("DROP PROCEDURE IF EXISTS ") + stored_procedures[i].szName);
		if(er != erSuccess)
			goto exit;
			
		er = DoUpdate(stored_procedures[i].szSQL);
		if(er != erSuccess) {
			int err = mysql_errno(&m_lpMySQL);
			if (err == ER_DBACCESS_DENIED_ERROR) {
				ec_log_err("zarafa-server is not allowed to create stored procedures");
				ec_log_err("Please grant CREATE ROUTINE permissions to the mysql user \"%s\" on the \"%s\" database",
								m_lpConfig->GetSetting("mysql_user"), m_lpConfig->GetSetting("mysql_database"));
			} else {
				ec_log_err("zarafa-server is unable to create stored procedures, error %d", err);
			}
			goto exit;
		}
	}

exit:	
	return er;
}

void ECDatabaseMySQL::UnloadLibrary(void)
{
	/*
	 * MySQL will timeout waiting for its own threads if the mysql
	 * initialization was done in another thread than the one where
	 * mysql_*_end() is called. [Global problem - it also affects
	 * projects other than Zarafa's.] :(
	 */
	ec_log_notice("Waiting for mysql_server_end");
	mysql_server_end();// mysql > 4.1.10 = mysql_library_end();
	ec_log_notice("Waiting for mysql_library_end");
	mysql_library_end();
}

ECRESULT ECDatabaseMySQL::InitEngine()
{
	ECRESULT er = erSuccess;

	_ASSERT(m_bMysqlInitialize == false);

	//Init mysql and make a connection
	if(mysql_init(&m_lpMySQL) == NULL) {
		ec_log_crit("ECDatabaseMySQL::InitEngine(): mysql_init failed");
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}

	m_bMysqlInitialize = true; 

	// Set auto reconnect OFF
	// mysql < 5.0.4 default on, mysql 5.0.4 > reconnection default off
	// Zarafa always wants reconnect OFF, because we want to know when the connection
	// is broken since this creates a new MySQL session, and we want to set some session
	// variables
	m_lpMySQL.reconnect = 0;

exit:
	return er;
}

std::string ECDatabaseMySQL::GetDatabaseDir()
{
	ASSERT(!m_strDatabaseDir.empty());
	return m_strDatabaseDir;
}

ECRESULT ECDatabaseMySQL::CheckExistColumn(const std::string &strTable, const std::string &strColumn, bool *lpbExist)
{
	ECRESULT		er = erSuccess;
	std::string		strQuery;
	DB_RESULT		lpDBResult = NULL;

	strQuery = "SELECT 1 FROM information_schema.COLUMNS "
				"WHERE TABLE_SCHEMA = '" + string(m_lpConfig->GetSetting("mysql_database")) + "' "
				"AND TABLE_NAME = '" + strTable + "' "
				"AND COLUMN_NAME = '" + strColumn + "'";
				
	er = DoSelect(strQuery, &lpDBResult);
	if (er != erSuccess)
		goto exit;
	
	*lpbExist = (FetchRow(lpDBResult) != NULL);
	
exit:
	if (lpDBResult)
		FreeResult(lpDBResult);
	
	return er;
}

ECRESULT ECDatabaseMySQL::CheckExistIndex(const std::string &strTable,
    const std::string &strKey, bool *lpbExist)
{
	ECRESULT		er = erSuccess;
	std::string		strQuery;
	DB_RESULT		lpDBResult = NULL;
	DB_ROW			lpRow = NULL;

	// WHERE not supported in MySQL < 5.0.3 
	strQuery = "SHOW INDEXES FROM " + strTable;

	er = DoSelect(strQuery, &lpDBResult);
	if (er != erSuccess)
		goto exit;

	*lpbExist = false;
	while ((lpRow = FetchRow(lpDBResult)) != NULL) {
		// 2 is Key_name
		if (lpRow[2] && strcmp(lpRow[2], strKey.c_str()) == 0) {
			*lpbExist = true;
			break;
		}
	}

exit:
	if (lpDBResult)
		FreeResult(lpDBResult);
	
	return er;
}

ECRESULT ECDatabaseMySQL::Connect()
{
	ECRESULT		er = erSuccess;
	std::string		strQuery;
	const char *lpMysqlPort = m_lpConfig->GetSetting("mysql_port");
	const char *lpMysqlSocket = m_lpConfig->GetSetting("mysql_socket");
	DB_RESULT		lpDBResult = NULL;
	DB_ROW			lpDBRow = NULL;
	unsigned int	gcm = 0;

	if (*lpMysqlSocket == '\0')
		lpMysqlSocket = NULL;
	
	er = InitEngine();
	if(er != erSuccess)
		goto exit;

	if(mysql_real_connect(&m_lpMySQL, 
			m_lpConfig->GetSetting("mysql_host"), 
			m_lpConfig->GetSetting("mysql_user"), 
			m_lpConfig->GetSetting("mysql_password"), 
			m_lpConfig->GetSetting("mysql_database"), 
			(lpMysqlPort)?atoi(lpMysqlPort):0, 
			lpMysqlSocket, CLIENT_MULTI_STATEMENTS) == NULL)
	{
		if(mysql_errno(&m_lpMySQL) == ER_BAD_DB_ERROR) // Database does not exist
			er = ZARAFA_E_DATABASE_NOT_FOUND;
		else
			er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("ECDatabaseMySQL::Connect(): mysql connect fail %x", er);
		goto exit;
	}
	
	// Check if the database is available, but empty
	strQuery = "SHOW tables";
	er = DoSelect(strQuery, &lpDBResult);
	if(er != erSuccess)
		goto exit;
		
	if(GetNumRows(lpDBResult) == 0) {
		er = ZARAFA_E_DATABASE_NOT_FOUND;
		goto exit;
	}
	
	if(lpDBResult) {
		FreeResult(lpDBResult);
		lpDBResult = NULL;
	}
	
	strQuery = "SHOW variables LIKE 'max_allowed_packet'";
	er = DoSelect(strQuery, &lpDBResult);
	if(er != erSuccess)
	    goto exit;
	
	lpDBRow = FetchRow(lpDBResult);
	/* lpDBRow[0] has the variable name, [1] the value */
	if(lpDBRow == NULL || lpDBRow[0] == NULL || lpDBRow[1] == NULL) {
	    ec_log_warn("Unable to retrieve max_allowed_packet value. Assuming 16M");
	    m_ulMaxAllowedPacket = (unsigned int)MAX_ALLOWED_PACKET;
    } else {
        m_ulMaxAllowedPacket = atoui(lpDBRow[1]);
    }

	m_bConnected = true;

#if HAVE_MYSQL_SET_CHARACTER_SET
	// function since mysql 5.0.7
	if (mysql_set_character_set(&m_lpMySQL, "utf8")) {
	    ec_log_err("Unable to set character set to \"utf8\"");
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}
#else
	if (Query("set character_set_client = 'utf8'") != 0) {
		ec_log_warn("Unable to set character_set_client value");
		goto exit;
	}
	if (Query("set character_set_connection = 'utf8'") != 0) {
		ec_log_warn("Unable to set character_set_connection value");
		goto exit;
	}
	if (Query("set character_set_results = 'utf8'") != 0) {
		ec_log_warn("Unable to set character_set_results value");
		goto exit;
	}
#endif
	if (Query("set max_sp_recursion_depth = 255") != 0) {
		ec_log_err("Unable to set recursion depth");
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}

	// Force to a sane value
	gcm = atoui(m_lpConfig->GetSetting("mysql_group_concat_max_len"));
	if(gcm < 1024)
		gcm = 1024;
		
	strQuery = (string)"SET SESSION group_concat_max_len = " + stringify(gcm);
	if(Query(strQuery) != erSuccess ) {
	    ec_log_warn("Unable to set group_concat_max_len value");
	}

	// changing the SESSION max_allowed_packet is removed since mysql 5.1, and GLOBAL is for SUPER users only, so just give a warning
	if (m_ulMaxAllowedPacket < MAX_ALLOWED_PACKET)
		ec_log_warn("max_allowed_packet is smaller than 16M (%d). You are advised to increase this value by adding max_allowed_packet=16M in the [mysqld] section of my.cnf.", m_ulMaxAllowedPacket);

	if (m_lpMySQL.server_version) {
		// m_lpMySQL.server_version is a C type string (char*) containing something like "5.5.37-0+wheezy1" (MySQL),
		// "5.5.37-MariaDB-1~wheezy-log" or "10.0.11-MariaDB=1~wheezy-log" (MariaDB)
		// The following code may look funny, but it is correct, see http://www.cplusplus.com/reference/cstdlib/strtol/
		long int majorversion = strtol(m_lpMySQL.server_version, NULL, 10);
		// Check for over/underflow and version.
		if (errno != ERANGE && majorversion >= 5) {
			// this option was introduced in mysql 5.0, so let's not even try on 4.1 servers
			strQuery = "SET SESSION sql_mode = 'STRICT_ALL_TABLES,NO_UNSIGNED_SUBTRACTION'";
			Query(strQuery); // ignore error
		}
	}

exit:
	if(lpDBResult)
		FreeResult(lpDBResult);

	if (er == erSuccess)
		g_lpStatsCollector->Increment(SCN_DATABASE_CONNECTS);
	else
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_CONNECTS);
		
	return er;
}

ECRESULT ECDatabaseMySQL::Close()
{
	ECRESULT er = erSuccess;

	//INFO: No locking here

	m_bConnected = false;

	// Close mysql data connection and deallocate data
	if(m_bMysqlInitialize)
		mysql_close(&m_lpMySQL);

	m_bMysqlInitialize = false;

	return er;
}

// Get database ownership
void ECDatabaseMySQL::Lock()
{
	pthread_mutex_lock(&m_hMutexMySql);
}

// Release the database ownership
void ECDatabaseMySQL::UnLock()
{
	pthread_mutex_unlock(&m_hMutexMySql);
}

bool ECDatabaseMySQL::isConnected() {

	return m_bConnected;
}

/**
 * Perform an SQL query on MySQL
 *
 * Sends a query to the MySQL server, and does a reconnect if the server connection is lost before or during
 * the SQL query. The reconnect is done only once. If the query fails after the reconnect, the entire call
 * fails.
 * 
 * It is up to the caller to get any result information from the query.
 *
 * @param[in] strQuery SQL query to perform
 * @return result (erSuccess or ZARAFA_E_DATABASE_ERROR)
 */
ECRESULT ECDatabaseMySQL::Query(const string &strQuery) {
	ECRESULT er = erSuccess;
	int err;
	
	LOG_SQL_DEBUG("SQL [%08lu]: \"%s;\"", m_lpMySQL.thread_id, strQuery.c_str());

	// use mysql_real_query to be binary safe ( http://dev.mysql.com/doc/mysql/en/mysql-real-query.html )
	err = mysql_real_query( &m_lpMySQL, strQuery.c_str(), strQuery.length() );

	if(err && (mysql_errno(&m_lpMySQL) == CR_SERVER_LOST || mysql_errno(&m_lpMySQL) == CR_SERVER_GONE_ERROR)) {
		ec_log_warn("SQL [%08lu] info: Try to reconnect", m_lpMySQL.thread_id);
			
		er = Close();
		if(er != erSuccess)
			goto exit;
			
		er = Connect();
		if(er != erSuccess)
			goto exit;
			
		// Try again
		err = mysql_real_query( &m_lpMySQL, strQuery.c_str(), strQuery.length() );
	}

	if(err) {
		if (!m_bSuppressLockErrorLogging || GetLastError() == DB_E_UNKNOWN)
			ec_log_err("SQL [%08lu] Failed: %s, Query Size: %lu, Query: \"%s\"", m_lpMySQL.thread_id, mysql_error(&m_lpMySQL), static_cast<unsigned long>(strQuery.size()), strQuery.c_str());
		er = ZARAFA_E_DATABASE_ERROR;
		// Don't assert on ER_NO_SUCH_TABLE because it's an anticipated error in the db upgrade code.
		if (mysql_errno(&m_lpMySQL) != ER_NO_SUCH_TABLE)
			ASSERT(false);
	}

exit:
	return er;
}

/**
 * Perform a SELECT operation on the database
 *
 * Sends the passed SELECT-like (any operation that outputs a result set) query to the MySQL server and retrieves
 * the result.
 *
 * Setting fStreamResult will delay retrieving data from the network until FetchRow() is called. The only
 * drawback is that GetRowCount() can therefore not be used unless all rows are fetched first. The main reason to
 * use this is to conserve memory and increase pipelining (the client can start processing data before the server
 * has completed the query)
 *
 * @param[in] strQuery SELECT query string
 * @param[out] Result output
 * @param[in] fStreamResult TRUE if data should be streamed instead of stored
 * @return result erSuccess or ZARAFA_E_DATABASE_ERROR
 */
ECRESULT ECDatabaseMySQL::DoSelect(const string &strQuery, DB_RESULT *lppResult, bool fStreamResult) {

	ECRESULT er = erSuccess;
	DB_RESULT lpResult = NULL;

	_ASSERT(strQuery.length()!= 0);

	// Autolock, lock data
	if(m_bAutoLock)
		Lock();
		
	if( Query(strQuery) != erSuccess ) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("ECDatabaseMySQL::DoSelect(): query failed");
		goto exit;
	}

	if (fStreamResult)
		lpResult = mysql_use_result(&m_lpMySQL);
	else
		lpResult = mysql_store_result(&m_lpMySQL);
    
	if( lpResult == NULL ) {
		er = ZARAFA_E_DATABASE_ERROR;
		if (!m_bSuppressLockErrorLogging || GetLastError() == DB_E_UNKNOWN)
			ec_log_err("SQL [%08lu] result failed: %s, Query: \"%s\"", m_lpMySQL.thread_id, mysql_error(&m_lpMySQL), strQuery.c_str());
	}

	g_lpStatsCollector->Increment(SCN_DATABASE_SELECTS);
	
	if (lppResult)
		*lppResult = lpResult;
	else if(lpResult)
			FreeResult(lpResult);

exit:
	if (er != erSuccess) {
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_SELECTS);
		g_lpStatsCollector->SetTime(SCN_DATABASE_LAST_FAILED, time(NULL));
	}

	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

ECRESULT ECDatabaseMySQL::DoSelectMulti(const string &strQuery) {

	ECRESULT er = erSuccess;

	_ASSERT(strQuery.length()!= 0);

	// Autolock, lock data
	if(m_bAutoLock)
		Lock();
		
	if( Query(strQuery) != erSuccess ) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("ECDatabaseMySQL::DoSelectMulti(): select failed");
		goto exit;
	}
	
	m_bFirstResult = true;

	g_lpStatsCollector->Increment(SCN_DATABASE_SELECTS);
	
exit:
	if (er != erSuccess) {
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_SELECTS);
		g_lpStatsCollector->SetTime(SCN_DATABASE_LAST_FAILED, time(NULL));
	}

	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

/**
 * Get next resultset from a multi-resultset query
 * 
 * @param[out] lppResult Resultset
 * @return result
 */
ECRESULT ECDatabaseMySQL::GetNextResult(DB_RESULT *lppResult) {

	ECRESULT er = erSuccess;
	DB_RESULT lpResult = NULL;
	int ret = 0;

	// Autolock, lock data
	if(m_bAutoLock)
		Lock();
		
	if(!m_bFirstResult)
		ret = mysql_next_result( &m_lpMySQL );
		
	m_bFirstResult = false;
		
	if(ret < 0) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("SQL [%08lu] next_result failed: expected more results", m_lpMySQL.thread_id);
		goto exit;
	}
	
	if(ret > 0) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("SQL [%08lu] next_result of multi-resultset failed: %s", m_lpMySQL.thread_id, mysql_error(&m_lpMySQL));
		goto exit;
	}		

   	lpResult = mysql_store_result( &m_lpMySQL );
   	if(lpResult == NULL) {
   		// I think this can only happen on the first result set of a query since otherwise mysql_next_result() would already fail
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("SQL [%08lu] result failed: %s", m_lpMySQL.thread_id, mysql_error(&m_lpMySQL));
		goto exit;
   	}

	if (lppResult)
		*lppResult = lpResult;
	else {
		if(lpResult)
			FreeResult(lpResult);
	}

exit:
	if (er != erSuccess) {
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_SELECTS);
		g_lpStatsCollector->SetTime(SCN_DATABASE_LAST_FAILED, time(NULL));
	}

	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

/**
 * Finalize a multi-SQL call
 *
 * A stored procedure will output a NULL result set at the end of the stored procedure to indicate
 * that the results have ended. This must be consumed here, otherwise the database will be left in a bad
 * state.
 */
ECRESULT ECDatabaseMySQL::FinalizeMulti() {

	ECRESULT er = erSuccess;
	DB_RESULT lpResult = NULL;

	mysql_next_result(&m_lpMySQL);
	
	lpResult = mysql_store_result(&m_lpMySQL);
	
	if(lpResult != NULL) {
		ec_log_err("SQL [%08lu] result failed: unexpected results received at end of batch", m_lpMySQL.thread_id);
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}
exit:
	if(lpResult)
		FreeResult(lpResult);
		
	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

/**
 * Perform a UPDATE operation on the database
 *
 * Sends the passed UPDATE query to the MySQL server, and optionally returns the number of affected rows. The
 * affected rows is the number of rows that have been MODIFIED, which is not necessarily the number of rows that
 * MATCHED the WHERE-clause.
 *
 * @param[in] strQuery UPDATE query string
 * @param[out] lpulAffectedRows (optional) Receives the number of affected rows 
 * @return result erSuccess or ZARAFA_E_DATABASE_ERROR
 */
ECRESULT ECDatabaseMySQL::DoUpdate(const string &strQuery, unsigned int *lpulAffectedRows) {
	
	ECRESULT er = erSuccess;

	// Autolock, lock data
	if(m_bAutoLock)
		Lock();
	
	er = _Update(strQuery, lpulAffectedRows);

	if (er != erSuccess) {
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_UPDATES);
		g_lpStatsCollector->SetTime(SCN_DATABASE_LAST_FAILED, time(NULL));
	}

	g_lpStatsCollector->Increment(SCN_DATABASE_UPDATES);

	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

ECRESULT ECDatabaseMySQL::_Update(const string &strQuery, unsigned int *lpulAffectedRows)
{
	ECRESULT er = erSuccess;
					
	if( Query(strQuery) != erSuccess ) {
		// FIXME: Add the mysql error system ?
		// er = nMysqlError;
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("ECDatabaseMySQL::_Update() query failed");
		goto exit;
	}
	
	if(lpulAffectedRows)
		*lpulAffectedRows = GetAffectedRows();
	
exit:
	return er;
}

/**
 * Perform an INSERT operation on the database
 *
 * Sends the passed INSERT query to the MySQL server, and optionally returns the new insert ID and the number of inserted
 * rows.
 *
 * @param[in] strQuery INSERT query string
 * @param[out] lpulInsertId (optional) Receives the last insert id
 * @param[out] lpulAffectedRows (optional) Receives the number of inserted rows
 * @return result erSuccess or ZARAFA_E_DATABASE_ERROR
 */
ECRESULT ECDatabaseMySQL::DoInsert(const string &strQuery, unsigned int *lpulInsertId, unsigned int *lpulAffectedRows)
{
	ECRESULT er = erSuccess;

	// Autolock, lock data
	if(m_bAutoLock)
		Lock();
	
	er = _Update(strQuery, lpulAffectedRows);

	if (er == erSuccess) {
		if (lpulInsertId)
			*lpulInsertId = GetInsertId();
	} else {
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_INSERTS);
		g_lpStatsCollector->SetTime(SCN_DATABASE_LAST_FAILED, time(NULL));
	}

	g_lpStatsCollector->Increment(SCN_DATABASE_INSERTS);

	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

/**
 * Perform a DELETE operation on the database
 *
 * Sends the passed DELETE query to the MySQL server, and optionally the number of deleted rows
 *
 * @param[in] strQuery INSERT query string
 * @param[out] lpulAffectedRows (optional) Receives the number of deleted rows
 * @return result erSuccess or ZARAFA_E_DATABASE_ERROR
 */
ECRESULT ECDatabaseMySQL::DoDelete(const string &strQuery, unsigned int *lpulAffectedRows) {

	ECRESULT er = erSuccess;

	// Autolock, lock data
	if(m_bAutoLock)
		Lock();
	
	er = _Update(strQuery, lpulAffectedRows);

	if (er != erSuccess) {
		g_lpStatsCollector->Increment(SCN_DATABASE_FAILED_DELETES);
		g_lpStatsCollector->SetTime(SCN_DATABASE_LAST_FAILED, time(NULL));
	}

	g_lpStatsCollector->Increment(SCN_DATABASE_DELETES);

	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

/*
 * This function updates a sequence in an atomic fashion - if called correctly;
 *
 * To make it work correctly, the state of the database connection should *NOT* be in a transaction; this would delay
 * committing of the data until a later time, causing other concurrent threads to possibly generate the same ID or lock
 * while waiting for this transaction to end. So, don't call Begin() before calling this function unless you really
 * know what you're doing.
 *
 * @todo measure sequence update calls, currently it is a update
 */
ECRESULT ECDatabaseMySQL::DoSequence(const std::string &strSeqName, unsigned int ulCount, unsigned long long *lpllFirstId) {
	ECRESULT er = erSuccess;
	unsigned int ulAffected = 0;

    // Autolock, lock data
	if(m_bAutoLock)
		Lock();

#ifdef DEBUG
#if DEBUG_TRANSACTION
	if(m_ulTransactionState != 0) {
		ASSERT(FALSE);
	}		
#endif
#endif

	// Attempt to update the sequence in an atomic fashion
	er = DoUpdate("UPDATE settings SET value=LAST_INSERT_ID(value+1)+" + stringify(ulCount-1) + " WHERE name = '" + strSeqName + "'", &ulAffected);
	if(er != erSuccess)
		goto exit;
	
	// If the setting was missing, insert it now, starting at sequence 1 (not 0 for safety - maybe there's some if(ulSequenceId) code somewhere)
	if(ulAffected == 0) {
		er = Query("INSERT INTO settings (name, value) VALUES('" + strSeqName + "',LAST_INSERT_ID(1)+" + stringify(ulCount-1) + ")");
		if(er != erSuccess)
			goto exit;
	}
			
	*lpllFirstId = mysql_insert_id(&m_lpMySQL);
	
exit:
	// Autolock, unlock data
	if(m_bAutoLock)
		UnLock();

	return er;
}

unsigned int ECDatabaseMySQL::GetAffectedRows() {

	return (unsigned int)mysql_affected_rows(&m_lpMySQL);
}

unsigned int ECDatabaseMySQL::GetInsertId() {

	return (unsigned int)mysql_insert_id(&m_lpMySQL);
}

void ECDatabaseMySQL::FreeResult(DB_RESULT sResult) {

	_ASSERT(sResult != NULL);

	if(sResult)
		mysql_free_result((MYSQL_RES *)sResult);
}

unsigned int ECDatabaseMySQL::GetNumRows(DB_RESULT sResult) {

	return (unsigned int)mysql_num_rows((MYSQL_RES *)sResult);
}

unsigned int ECDatabaseMySQL::GetNumRowFields(DB_RESULT sResult) {

	return mysql_num_fields((MYSQL_RES *)sResult);
}

unsigned int ECDatabaseMySQL::GetRowIndex(DB_RESULT sResult, const std::string &strFieldname) {

	MYSQL_FIELD *lpFields;
	unsigned int cbFields;
	unsigned int ulIndex = (unsigned int)-1;

	lpFields = mysql_fetch_fields((MYSQL_RES *)sResult);
	cbFields = mysql_field_count(&m_lpMySQL);

	for (unsigned int i = 0; i < cbFields && ulIndex == (unsigned int)-1; ++i)
		if (stricmp(lpFields[i].name, strFieldname.c_str()) == 0)
			ulIndex = i;
	
	return ulIndex;
}

DB_ROW ECDatabaseMySQL::FetchRow(DB_RESULT sResult) {

	return mysql_fetch_row((MYSQL_RES *)sResult);
}

DB_LENGTHS ECDatabaseMySQL::FetchRowLengths(DB_RESULT sResult) {

	return (DB_LENGTHS)mysql_fetch_lengths((MYSQL_RES *)sResult);
}

/** 
 * For some reason, MySQL only supports up to 3 bytes of utf-8 data. This means
 * that data outside the BMP is not supported. This function filters the passed utf-8 string
 * and removes the non-BMP characters. Since it should be extremely uncommon to have useful
 * data outside the BMP, this should be acceptable.
 *
 * Note: BMP stands for Basic Multilingual Plane (first 0x10000 code points in unicode)
 *
 * If somebody points out a useful use case for non-BMP characters in the future, then we'll
 * have to rethink this.
 *
 */
std::string ECDatabaseMySQL::FilterBMP(const std::string &strToFilter)
{
	const char *c = strToFilter.c_str();
	std::string::size_type pos = 0;
	std::string strFiltered;

	while(pos < strToFilter.size()) {
		// Copy 1, 2, and 3-byte utf-8 sequences
		int len;
		
		if((c[pos] & 0x80) == 0)
			len = 1;
		else if((c[pos] & 0xE0) == 0xC0)
			len = 2;
		else if((c[pos] & 0xF0) == 0xE0)
			len = 3;
		else if((c[pos] & 0xF8) == 0xF0)
			len = 4;
		else if((c[pos] & 0xFC) == 0xF8)
			len = 5;
		else if((c[pos] & 0xFE) == 0xFC)
			len = 6;
		else {
			// Invalid utf-8 ?
			len = 1;
		}
		
		if(len < 4) {
			strFiltered.append(&c[pos], len);
		}
		
		pos += len;
	}
	
	return strFiltered;
}

std::string ECDatabaseMySQL::Escape(const std::string &strToEscape)
{
	ULONG size = strToEscape.length()*2+1;
	char *szEscaped = new char[size];
	std::string escaped;

	memset(szEscaped, 0, size);

	mysql_real_escape_string(&this->m_lpMySQL, szEscaped, strToEscape.c_str(), strToEscape.length());

	escaped = szEscaped;

	delete [] szEscaped;

	return escaped;
}

std::string ECDatabaseMySQL::EscapeBinary(unsigned char *lpData, unsigned int ulLen)
{
	ULONG size = ulLen*2+1;
	char *szEscaped = new char[size];
	std::string escaped;
	
	memset(szEscaped, 0, size);

	mysql_real_escape_string(&this->m_lpMySQL, szEscaped, (const char *)lpData, ulLen);

	escaped = szEscaped;

	delete [] szEscaped;

	return "'" + escaped + "'";
}

std::string ECDatabaseMySQL::EscapeBinary(const std::string& strData)
{
	return EscapeBinary((unsigned char *)strData.c_str(), strData.size());
}

void ECDatabaseMySQL::ResetResult(DB_RESULT sResult) {

	mysql_data_seek((MYSQL_RES *)sResult, 0);
}

const char *ECDatabaseMySQL::GetError(void)
{
	if(m_bMysqlInitialize == false)
		return "MYSQL not initialized";

	return mysql_error(&m_lpMySQL);
}

DB_ERROR ECDatabaseMySQL::GetLastError()
{
	DB_ERROR dberr;
	
	switch (mysql_errno(&m_lpMySQL)) {
		case ER_LOCK_WAIT_TIMEOUT:
			dberr = DB_E_LOCK_WAIT_TIMEOUT;
			break;
		
		case ER_LOCK_DEADLOCK:
			dberr = DB_E_LOCK_DEADLOCK;
			break;
			
		default:
			dberr = DB_E_UNKNOWN;
			break;
	}
	
	return dberr;
}

bool ECDatabaseMySQL::SuppressLockErrorLogging(bool bSuppress)
{
	std::swap(bSuppress, m_bSuppressLockErrorLogging);
	return bSuppress;
}

ECRESULT ECDatabaseMySQL::Begin() {
	ECRESULT er = erSuccess;
	
	er = Query("BEGIN");

#ifdef DEBUG
#if DEBUG_TRANSACTION
	ec_log_debug("%08X: BEGIN", &m_lpMySQL);
	if(m_ulTransactionState != 0) {
		ec_log_debug("BEGIN ALREADY ISSUED");
		ASSERT(("BEGIN ALREADY ISSUED", FALSE));
	}
	m_ulTransactionState = 1;
#endif
#endif
	
	return er;
}

ECRESULT ECDatabaseMySQL::Commit() {
	ECRESULT er = erSuccess;
	er = Query("COMMIT");
	
#ifdef DEBUG
#if DEBUG_TRANSACTION
	ec_log_debug("%08X: COMMIT", &m_lpMySQL);
	if(m_ulTransactionState != 1) {
		ec_log_debug("NO BEGIN ISSUED");
		ASSERT(("NO BEGIN ISSUED", FALSE));
	}
	m_ulTransactionState = 0;
#endif
#endif

	return er;
}

ECRESULT ECDatabaseMySQL::Rollback() {
	ECRESULT er = erSuccess;
#ifdef HAVE_OFFLINE_SUPPORT
	const char *lpQuery = "SHOW ENGINE INNODB STATUS";
	int err = 0;
#endif

	er = Query("ROLLBACK");
	
#ifdef DEBUG
#if DEBUG_TRANSACTION
	ec_log_debug("%08X: ROLLBACK", &m_lpMySQL);
	if(m_ulTransactionState != 1) {
		ec_log_debug("NO BEGIN ISSUED");
		ASSERT(("NO BEGIN ISSUED", FALSE));
	}
	m_ulTransactionState = 0;
#endif
#endif
#ifdef HAVE_OFFLINE_SUPPORT
	// We'll log the innodb status after each rollback. This shouldn't
	// happen too much though.
	err = mysql_real_query(&m_lpMySQL, lpQuery, strlen(lpQuery));
	if (!err) {
		MYSQL_RES *lpResult = mysql_use_result(&m_lpMySQL);
		if (lpResult) {
			MYSQL_ROW row = mysql_fetch_row(lpResult);
			if (row) {
				unsigned int fields = mysql_num_fields(lpResult);
				for (unsigned int i = 0; i < fields; ++i)
					if (row[i])
						ec_log_err("%s", row[i]);
			}
			mysql_free_result(lpResult);
		}
	}
#endif

	return er;
}

unsigned int ECDatabaseMySQL::GetMaxAllowedPacket() {
    return m_ulMaxAllowedPacket;
}

void ECDatabaseMySQL::ThreadInit() {
	mysql_thread_init();
}

void ECDatabaseMySQL::ThreadEnd() {
	mysql_thread_end();
}

ECRESULT ECDatabaseMySQL::IsInnoDBSupported()
{
	ECRESULT	er = erSuccess;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;

	er = DoSelect("SHOW ENGINES", &lpResult);
	if(er != erSuccess) {
		ec_log_crit("Unable to query supported database engines. Error: %s", GetError());
		goto exit;
	}

	while ((lpDBRow = FetchRow(lpResult)) != NULL) {
		if (stricmp(lpDBRow[0], "InnoDB") != 0)
			continue;

		if (stricmp(lpDBRow[1], "DISABLED") == 0) {
			// mysql has run with innodb enabled once, but disabled this.. so check your log.
			ec_log_crit("INNODB engine is disabled. Please re-enable the INNODB engine. Check your MySQL log for more information or comment out skip-innodb in the mysql configuration file.");
			er = ZARAFA_E_DATABASE_ERROR;
			goto exit;
		} else if (stricmp(lpDBRow[1], "YES") != 0 && stricmp(lpDBRow[1], "DEFAULT") != 0) {
			// mysql is incorrectly configured or compiled.
			ec_log_crit("INNODB engine is not supported. Please enable the INNODB engine in the mysql configuration file.");
			er = ZARAFA_E_DATABASE_ERROR;
			goto exit;
		}
		break;
	}
	if (lpDBRow == NULL) {
		ec_log_crit("Unable to find the \"InnoDB\" engine from the mysql server. Probably INNODB is not supported.");
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}

exit:
	if(lpResult)
		FreeResult(lpResult);

	return er;
}

ECRESULT ECDatabaseMySQL::CreateDatabase()
{
	ECRESULT	er = erSuccess;
	string		strQuery;
	const char *lpDatabase = m_lpConfig->GetSetting("mysql_database");
	const char *lpMysqlPort = m_lpConfig->GetSetting("mysql_port");
	const char *lpMysqlSocket = m_lpConfig->GetSetting("mysql_socket");

	if(*lpMysqlSocket == '\0')
		lpMysqlSocket = NULL;

	// Zarafa database tables
	static const sSQLDatabase_t sDatabaseTables[] = {
		{"acl", Z_TABLEDEF_ACL},
		{"hierarchy", Z_TABLEDEF_HIERARCHY},
		{"names", Z_TABLEDEF_NAMES},
		{"mvproperties", Z_TABLEDEF_MVPROPERTIES},
		{"tproperties", Z_TABLEDEF_TPROPERTIES},
		{"properties", Z_TABLEDEF_PROPERTIES},
		{"delayedupdate", Z_TABLEDEF_DELAYEDUPDATE},
		{"receivefolder", Z_TABLEDEF_RECEIVEFOLDER},

		{"stores", Z_TABLEDEF_STORES},
		{"users", Z_TABLEDEF_USERS},
		{"outgoingqueue", Z_TABLEDEF_OUTGOINGQUEUE},
		{"lob", Z_TABLEDEF_LOB},
		{"searchresults", Z_TABLEDEF_SEARCHRESULTS},
		{"changes", Z_TABLEDEF_CHANGES},
		{"syncs", Z_TABLEDEF_SYNCS},
		{"versions", Z_TABLEDEF_VERSIONS},
		{"indexedproperties", Z_TABLEDEF_INDEXED_PROPERTIES},
		{"settings", Z_TABLEDEF_SETTINGS},

		{"object", Z_TABLEDEF_OBJECT},
		{"objectproperty", Z_TABLEDEF_OBJECT_PROPERTY},
		{"objectmvproperty", Z_TABLEDEF_OBJECT_MVPROPERTY},
		{"objectrelation", Z_TABLEDEF_OBJECT_RELATION},

		{"singleinstances", Z_TABLEDEF_REFERENCES },
		{"abchanges", Z_TABLEDEF_ABCHANGES },
		{"syncedmessages", Z_TABLEDEFS_SYNCEDMESSAGES },
		{"clientupdatestatus", Z_TABLEDEF_CLIENTUPDATESTATUS },
	};

	// Zarafa database default data
	static const sSQLDatabase_t sDatabaseData[] = {
		{"users", Z_TABLEDATA_USERS},
		{"stores", Z_TABLEDATA_STORES},
		{"hierarchy", Z_TABLEDATA_HIERARCHY},
		{"properties", Z_TABLEDATA_PROPERTIES},
		{"acl", Z_TABLEDATA_ACL},
		{"settings", Z_TABLEDATA_SETTINGS},
		{"indexedproperties", Z_TABLEDATA_INDEXED_PROPERTIES},
	};

	er = InitEngine();
	if(er != erSuccess)
		goto exit;

	// Connect
	if(mysql_real_connect(&m_lpMySQL, 
			m_lpConfig->GetSetting("mysql_host"), 
			m_lpConfig->GetSetting("mysql_user"), 
			m_lpConfig->GetSetting("mysql_password"), 
			NULL, 
			(lpMysqlPort)?atoi(lpMysqlPort):0, 
			lpMysqlSocket, 0) == NULL)
	{
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("ECDatabaseMySQL::CreateDatabase(): mysql connect failed");
		goto exit;
	}

	if(lpDatabase == NULL) {
		ec_log_crit("Unable to create database: Unknown database");
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}

	ec_log_notice("Creating database \"%s\"", lpDatabase);

	er = IsInnoDBSupported();
	if(er != erSuccess)
		goto exit;

	strQuery = "CREATE DATABASE IF NOT EXISTS `"+std::string(m_lpConfig->GetSetting("mysql_database"))+"`";
	if(Query(strQuery) != erSuccess){
		ec_log_crit("Unable to create database: %s", GetError());
		er = ZARAFA_E_DATABASE_ERROR;
		goto exit;
	}

	strQuery = "USE `"+std::string(m_lpConfig->GetSetting("mysql_database"))+"`";
	er = DoInsert(strQuery);
	if(er != erSuccess)
		goto exit;

	// Database tables
	for (size_t i = 0; i < ARRAY_SIZE(sDatabaseTables); ++i) {
		ec_log_info("Creating table \"%s\"", sDatabaseTables[i].lpComment);
		er = DoInsert(sDatabaseTables[i].lpSQL);
		if(er != erSuccess)
			goto exit;	
	}

	// Add the default table data
	for (size_t i = 0; i < ARRAY_SIZE(sDatabaseData); ++i) {
		ec_log_info("Add table data for \"%s\"", sDatabaseData[i].lpComment);
		er = DoInsert(sDatabaseData[i].lpSQL);
		if(er != erSuccess)
			goto exit;
	}

	er = InsertServerGUID(this);
	if(er != erSuccess)
		goto exit;

	// Add the release id in the database
	er = UpdateDatabaseVersion(Z_UPDATE_RELEASE_ID);
	if(er != erSuccess)
		goto exit;

	// Loop throught the update list
	for (size_t i = Z_UPDATE_RELEASE_ID;
	     i < ARRAY_SIZE(sUpdateList); ++i)
	{
		er = UpdateDatabaseVersion(sUpdateList[i].ulVersion);
		if(er != erSuccess)
			goto exit;
	}

	
	ec_log_notice("Database has been created");

exit:
	return er;
}

static inline bool row_has_null(DB_ROW row, size_t z)
{
	if (row == NULL)
		return true;
	while (z-- > 0)
		if (row[z] == NULL)
			return true;
	return false;
}

ECRESULT ECDatabaseMySQL::GetDatabaseVersion(zcp_versiontuple *dbv)
{
	ECRESULT		er = erSuccess;
	string			strQuery;
	DB_RESULT		lpResult = NULL;
	DB_ROW			lpDBRow = NULL;
	bool have_micro;

	/* Check if the "micro" column already exists (it does since v64) */
	er = DoSelect("SELECT databaserevision FROM versions WHERE databaserevision>=64 LIMIT 1", &lpResult);
	if (er != erSuccess)
		goto exit;
	have_micro = GetNumRows(lpResult) > 0;
	FreeResult(lpResult);

	strQuery = "SELECT major, minor";
	strQuery += have_micro ? ", micro" : ", 0";
	strQuery += ", revision, databaserevision FROM versions ORDER BY major DESC, minor DESC";
	if (have_micro)
		strQuery += ", micro DESC";
	strQuery += ", revision DESC, databaserevision DESC LIMIT 1";

	er = DoSelect(strQuery, &lpResult);
	if(er != erSuccess && mysql_errno(&m_lpMySQL) != ER_NO_SUCH_TABLE)
		goto exit;

	if(er != erSuccess || GetNumRows(lpResult) == 0) {
		// Ok, maybe < than version 5.10
		// check version

		strQuery = "SHOW COLUMNS FROM properties";
		er = DoSelect(strQuery, &lpResult);
		if(er != erSuccess)
			goto exit;

		lpDBRow = FetchRow(lpResult);
		er = ZARAFA_E_UNKNOWN_DATABASE;

		while (lpDBRow != NULL) {
			if (lpDBRow[0] != NULL && stricmp(lpDBRow[0], "storeid") == 0) {
				dbv->v_major  = 5;
				dbv->v_minor  = 0;
				dbv->v_rev    = 0;
				dbv->v_schema = 0;
				er = erSuccess;
				break;
			}
			lpDBRow = FetchRow(lpResult);
		}
		
		goto exit;
	}

	lpDBRow = FetchRow(lpResult);
	if (row_has_null(lpDBRow, 5)) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("ECDatabaseMySQL::GetDatabaseVersion(): NULL row or columns");
		goto exit;
	}

	dbv->v_major  = strtoul(lpDBRow[0], NULL, 0);
	dbv->v_minor  = strtoul(lpDBRow[1], NULL, 0);
	dbv->v_micro  = strtoul(lpDBRow[2], NULL, 0);
	dbv->v_rev    = strtoul(lpDBRow[3], NULL, 0);
	dbv->v_schema = strtoul(lpDBRow[4], NULL, 0);

exit:
	if(lpResult)
		FreeResult(lpResult);

	return er;
}

ECRESULT ECDatabaseMySQL::IsUpdateDone(unsigned int ulDatabaseRevision, unsigned int ulRevision)
{
	ECRESULT		er = ZARAFA_E_NOT_FOUND;
	string			strQuery;
	DB_RESULT		lpResult = NULL;

	strQuery = "SELECT major,minor,revision,databaserevision FROM versions WHERE databaserevision = " + stringify(ulDatabaseRevision);
	if (ulRevision > 0)
		strQuery += " AND revision = " + stringify(ulRevision);

	strQuery += " ORDER BY major DESC, minor DESC, revision DESC, databaserevision DESC LIMIT 1";
	
	er = DoSelect(strQuery, &lpResult);
	if(er != erSuccess)
		goto exit;

	if(GetNumRows(lpResult) != 1)
		er = ZARAFA_E_NOT_FOUND;

exit:
	if(lpResult != NULL)
		FreeResult(lpResult);
	return er;
}

ECRESULT ECDatabaseMySQL::GetFirstUpdate(unsigned int *lpulDatabaseRevision)
{
	ECRESULT		er = erSuccess;
	DB_RESULT		lpResult = NULL;
	DB_ROW			lpDBRow = NULL;

	er = DoSelect("SELECT MIN(databaserevision) FROM versions", &lpResult);
	if(er != erSuccess && mysql_errno(&m_lpMySQL) != ER_NO_SUCH_TABLE)
		goto exit;
	else if(er == erSuccess)
		lpDBRow = FetchRow(lpResult);

	er = erSuccess;

	if (lpDBRow == NULL || lpDBRow[0] == NULL ) {
		*lpulDatabaseRevision = 0;
	}else
		*lpulDatabaseRevision = atoui(lpDBRow[0]);


exit:
	if (lpResult != NULL)
		FreeResult(lpResult);
	return er;
}

/** 
 * Update the database to the current version.
 * 
 * @param[in]  bForceUpdate possebly force upgrade
 * @param[out] strReport error message
 * 
 * @return Zarafa error code
 */
ECRESULT ECDatabaseMySQL::UpdateDatabase(bool bForceUpdate, std::string &strReport)
{
	ECRESULT		er = erSuccess;
	bool			bUpdated = false;
	bool			bSkipped = false;
	unsigned int	ulDatabaseRevisionMin = 0;
	zcp_versiontuple stored_ver;
	zcp_versiontuple program_ver(PROJECT_VERSION_MAJOR, PROJECT_VERSION_MINOR, PROJECT_VERSION_MICRO, PROJECT_VERSION_REVISION, Z_UPDATE_LAST);
	int cmp;

	er = GetDatabaseVersion(&stored_ver);
	if(er != erSuccess)
		goto exit;

	
	er = GetFirstUpdate(&ulDatabaseRevisionMin);
	if(er != erSuccess)
		goto exit;

	//default error
	strReport = "Unable to upgrade zarafa from version " +
	            stored_ver.stringify() + " to " + program_ver.stringify();

	// Check version
	cmp = stored_ver.compare(program_ver);
	if (cmp == 0 && stored_ver.v_schema == Z_UPDATE_LAST) {
		// up to date
		goto exit;
	} else if (cmp > 0) {
		// Start a old server with a new database
		strReport = "Database version (" + stored_ver.stringify(',') +
		            ") is newer than the server version (" + program_ver.stringify(',') + ")";
		er = ZARAFA_E_INVALID_VERSION;
		goto exit;
	}

	this->m_bForceUpdate = bForceUpdate;

	if (bForceUpdate)
		ec_log_warn("Manually forced the database upgrade because the option \"--force-database-upgrade\" was given.");

	// Loop throught the update list
	for (size_t i = ulDatabaseRevisionMin;
	     i < ARRAY_SIZE(sUpdateList); ++i)
	{
		if ( (ulDatabaseRevisionMin > 0 && IsUpdateDone(sUpdateList[i].ulVersion) == hrSuccess) ||
			(sUpdateList[i].ulVersionMin != 0 && stored_ver.v_schema >= sUpdateList[i].ulVersion &&
			stored_ver.v_schema >= sUpdateList[i].ulVersionMin) ||
			(sUpdateList[i].ulVersionMin != 0 && IsUpdateDone(sUpdateList[i].ulVersionMin, PROJECT_VERSION_REVISION) == hrSuccess))
		{
			// Update already done, next
			continue;
		}

		ec_log_info("Start: %s", sUpdateList[i].lpszLogComment);

		er = Begin();
		if(er != erSuccess)
			goto exit;

		bSkipped = false;
		er = sUpdateList[i].lpFunction(this);
		if (er == ZARAFA_E_IGNORE_ME) {
			bSkipped = true;
			er = erSuccess;
		} else if (er == ZARAFA_E_USER_CANCEL) {
			goto exit; // Reason should be logged in the update itself.
		} else if (er != hrSuccess) {
			Rollback();
			ec_log_err("Failed: Rollback database");
			goto exit;
		}

		er = UpdateDatabaseVersion(sUpdateList[i].ulVersion);
		if(er != erSuccess)
			goto exit;

		er = Commit();
		if(er != erSuccess)
			goto exit;
		ec_log_notice("%s: %s", bSkipped ? "Skipped" : "Done", sUpdateList[i].lpszLogComment);
		bUpdated = true;
	}

	// Ok, no changes for the database, but for update history we add a version record
	if(bUpdated == false) {
		// Update version table
		er = UpdateDatabaseVersion(Z_UPDATE_LAST);
		if(er != erSuccess)
			goto exit;
	}

exit:

	return er;
}

ECRESULT ECDatabaseMySQL::UpdateDatabaseVersion(unsigned int ulDatabaseRevision)
{
	ECRESULT	er = erSuccess;
	string		strQuery;
	DB_RESULT result;
	bool have_micro;

	/* Check for "micro" column (present in v64+) */
	er = DoSelect("SELECT databaserevision FROM versions WHERE databaserevision>=64 LIMIT 1", &result);
	if (er != erSuccess)
		goto exit;
	have_micro = GetNumRows(result) > 0;
	FreeResult(result);

	// Insert version number
	strQuery = "INSERT INTO versions (major, minor, ";
	if (have_micro)
		strQuery += "micro, ";
	strQuery += "revision, databaserevision, updatetime) VALUES(";
	strQuery += stringify(PROJECT_VERSION_MAJOR) + std::string(", ") + stringify(PROJECT_VERSION_MINOR) + std::string(", ");
	if (have_micro)
		strQuery += stringify(PROJECT_VERSION_MICRO) + std::string(", ");
	strQuery += std::string("'") + std::string(PROJECT_SVN_REV_STR) +  std::string("', ") + stringify(ulDatabaseRevision) + ", FROM_UNIXTIME("+stringify(time(NULL))+") )";

	er = DoInsert(strQuery);
	if(er != erSuccess)
		goto exit;

exit:
	return er;
}
/**
 * Validate all database tables
*/
ECRESULT ECDatabaseMySQL::ValidateTables()
{
	ECRESULT	er = erSuccess;
	string		strQuery;
	list<std::string> listTables;
	list<std::string> listErrorTables;
	list<std::string>::const_iterator iterTables;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;

	er = DoSelect("SHOW TABLES", &lpResult);
	if(er != erSuccess) {
		ec_log_err("Unable to get all tables from the mysql database. %s", GetError());
		goto exit;
	}

	// Get all tables of the database
	while( (lpDBRow = FetchRow(lpResult))) {
		if (lpDBRow == NULL || lpDBRow[0] == NULL) {
			ec_log_err("Wrong table information.");
			er = ZARAFA_E_DATABASE_ERROR;
			goto exit;
		}

		listTables.insert(listTables.end(), lpDBRow[0]);
	}
	if(lpResult) FreeResult(lpResult);
	lpResult = NULL;

	for (iterTables = listTables.begin(); iterTables != listTables.end(); ++iterTables) {
		er = DoSelect("CHECK TABLE " + *iterTables, &lpResult);
		if(er != erSuccess) {
			ec_log_err("Unable to check table \"%s\"", iterTables->c_str());
			goto exit;
		}

		lpDBRow = FetchRow(lpResult);
		if (lpDBRow == NULL || lpDBRow[0] == NULL || lpDBRow[1] == NULL || lpDBRow[2] == NULL) {
			ec_log_err("Wrong check table information.");
			er = ZARAFA_E_DATABASE_ERROR;
			goto exit;
		}

		ec_log_info("%30s | %15s | %s", lpDBRow[0], lpDBRow[2], lpDBRow[3]);
		if (strcmp(lpDBRow[2], "error") == 0)
			listErrorTables.insert(listErrorTables.end(), lpDBRow[0]);

		if(lpResult) FreeResult(lpResult);
		lpResult = NULL;
	}

	if (!listErrorTables.empty())
	{
		ec_log_notice("Rebuilding tables.");
#ifdef HAVE_OFFLINE_SUPPORT
		ECDBUpdateProgress *lpProgress = NULL;
		unsigned int cUpdate = 0;

		ECDBUpdateProgress::GetInstance(listErrorTables.size(), this, &lpProgress);
#endif
		for (iterTables = listErrorTables.begin();
		     iterTables != listErrorTables.end(); ++iterTables) {
#ifdef HAVE_OFFLINE_SUPPORT
			if (lpProgress) {
				er = lpProgress->Start(cUpdate); 
				if(er != erSuccess) {
					ec_log_err("Rebuild of tables canceled by user.");
					goto exit;
				}
			}
#endif

			er = DoUpdate("ALTER TABLE " + *iterTables + " FORCE");
			if(er != erSuccess) {
				ec_log_crit("Unable to fix table \"%s\"", iterTables->c_str());
				break;
			}
#ifdef HAVE_OFFLINE_SUPPORT
			if (lpProgress)
				lpProgress->Finish(cUpdate++);
#endif
		}
#ifdef HAVE_OFFLINE_SUPPORT
		ECDBUpdateProgress::DestroyInstance();
#endif
		if(er != erSuccess) {
			ec_log_crit("Rebuild tables failed. Error code 0x%08x", er);
		} else {
			ec_log_notice("Rebuilding tables done.");
		}
	}//	if (!listErrorTables.empty())

exit:
	if(lpResult)
		FreeResult(lpResult);

	return er;
}
