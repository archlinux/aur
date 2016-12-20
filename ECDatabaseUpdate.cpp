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

#include "ECDatabase.h"
#include "ECDatabaseUpdate.h"

#include <zarafa/stringutil.h>

#include <zarafa/ECDefs.h>
#include "ECDBDef.h"
#include "ECUserManagement.h"

#include <zarafa/ecversion.h>

#include <mapidefs.h>
#include <mapitags.h>
#include "ECConversion.h"
#include "SOAPUtils.h"
#include "ECSearchFolders.h"

#include "ZarafaICS.h"

#include <zarafa/charset/convert.h>
#include "ECStringCompat.h"
#include "ECMAPI.h"

#include <zlib.h>
#include <zarafa/mapiext.h>
#include <edkmdb.h>

#ifdef HAVE_OFFLINE_SUPPORT
#include "ECDBUpdateProgress.h"

#define PROGRESS_INIT(_curupdate)												\
	ECDBUpdateProgress *__lpProgress = NULL;									\
	const unsigned int __ulCurUpdate = (_curupdate);							\
	er = ECDBUpdateProgress::GetInstance(Z_UPDATE_CONVERT_NAMES, lpDatabase, &__lpProgress);	\
	if (er == erSuccess)														\
		er = __lpProgress->Start(__ulCurUpdate);								\
	if (er != erSuccess)														\
		goto exit;

#define PROGRESS_DONE															\
	er = __lpProgress->Finish(__ulCurUpdate);									\
	if (er != erSuccess)														\
		goto exit;

#define INTERMEDIATE_PROGRESS(_cur, _total)										\
	er = __lpProgress->SetIntermediateProgress((_cur), (_total));				\
	if (er != erSuccess)														\
		goto exit;

#define INTERMEDIATE_PROGRESS_(_progress)										\
	er = __lpProgress->SetIntermediateProgress((_progress));					\
	if (er != erSuccess)														\
		goto exit;

#else

#define PROGRESS_INIT(...)
#define PROGRESS_DONE
#define INTERMEDIATE_PROGRESS(...)
#define INTERMEDIATE_PROGRESS_(...)

#endif

extern int searchfolder_restart_required; // HACK

/*
	Zarafa database upgrade

	Version 4.20 (not include)
	* Add table object
	* Add table objectproperty
	* Add table objectrelation
	* Change user table structure
	* Converting users and group

	Optional 4.20 / 5.0 (not include)
	* Change database engine to INNODB
	* Remove key val_string on the table mvproperties and properties
	* Change the primary key, "ht" key and "hierarchyid" key on the hierarchy table
	* Change externid to field to VARBINARY(255) and add externid key

	Version 4.21 (not include)
	* change the "parent" key on the hierarchy table

	Version 5.00 (not included)
	* Add column storeid in properties table and update the ids
	* Add freebusy folders in public store
	* Set the permissions on the free/busy folders	
		
	Version 5.10
	* Add table version
	* Add table searchfolders
	* Update non-login from 10 to 1
	* (Beta update) Add flags in search table
	* rebuild searchfolders

	Version 5.20
	* Create table changes
	* Create table syncs
	* Create table indexedproperties
	* Create table settings
	* Insert server guid into settings table
	* Create from object id a sourcekeys and add them into indexedproperties

	Version 6.00
	* Create from object id an entryid and add them into indexedproperties
	* Update Search criteria
	* Update users table to have 'type' field instead of 'isgroup' and 'isnonactive'
	* Update users table to have 'signature' field
	* Add source_key_auto_increment setting
	* Fix unique key in users table

	Version 6.10
	* Add company column
	* Add company in user table
	* Add company in objectproperty table

	Version 6.20
	* Move public folders and remove favorites

	Version 6.30
	* Add externid column to object table (changed between beta's)
	* Add reference table for Single Instance Attachments
	* Add distributed lock when upgrading to 6.30 (distributed only on clean 6.30)
	* Add abchanges table to hold ab sourcekeys (since they don't fit in the changes table anymore)
	* Set tag column in singleinstance to correct tag value (beta's have wrong value)

	Version 6.40
	* Rename object_type columns to objectclass, and fix their contents with the new defined values (in 2 steps)
	* Add objectmvproperties table (for offline synced addressbook details)
	* Add syncedmessages table for keeping track of messages that were synchronized with a restriction
	* Update the primary key on the 'outgoingqueue' table
	* Update the primary key on the 'acl' table
	* Update externid in users and object table to be blob, so mysql 4.1 leaves trailing 0's
	* Update changes table primary key
	* Update mvproperties table primary key
	* Update objectclass for DB plugin groups to be security enabled
	* Update objectrelation table to switch send-as settings

	Version 7.00
	* Print error howto "convert", or if admin forced do the upgrade of tables with text fields to unicode.
	* Update stores table to store the username in a char field.
	* Update rules xml blobs to unicode.
	* Update searchfolder xml blobs to unicode.

	Version 7.0.1
	* update receive folder to unicode and increase the messageclass column size
	
	Version 7.1.0
	* update WLINK entries to new record key format

	Version independed
	* Add setting for IMAP
	* Change primary key in changetable and add an extra move key
	* Force addressbook resync
*/

struct SObject {
	SObject(unsigned int id, unsigned int type) {ulId = id; ulType = type;}
	bool operator<(const SObject &rhs) const {return (ulId < rhs.ulId || (ulId == rhs.ulId && ulType < rhs.ulType));}
	unsigned int ulId;
	unsigned int ulType;
};

struct SRelation {
	SRelation(unsigned int objectId, unsigned int parentObjectId, unsigned int relationType) {
		ulObjectId = objectId; ulParentObjectId = parentObjectId; ulRelationType = relationType;
	}
	unsigned int ulObjectId;
	unsigned int ulParentObjectId;
	unsigned int ulRelationType;
};

// 1
ECRESULT UpdateDatabaseCreateVersionsTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_VERSIONS);

	return er;
}

// 2
ECRESULT UpdateDatabaseCreateSearchFolders(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_SEARCHRESULTS);

	return er;
}

// 3
ECRESULT UpdateDatabaseFixUserNonActive(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;
	
	er = lpDatabase->DoUpdate("UPDATE users SET nonactive=1 WHERE nonactive=10");

	return er;
}

// 4
ECRESULT UpdateDatabaseCreateSearchFoldersFlags(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoUpdate("ALTER TABLE searchresults ADD COLUMN flags int(11) unsigned NOT NULL default '0'");

	return er;
}

// 5
ECRESULT UpdateDatabasePopulateSearchFolders(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	searchfolder_restart_required = 1;

	return er;
}

// 6
ECRESULT UpdateDatabaseCreateChangesTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_CHANGES);

	return er;
}

// 7
ECRESULT UpdateDatabaseCreateSyncsTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_SYNCS);

	return er;
}

// 8
ECRESULT UpdateDatabaseCreateIndexedPropertiesTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_INDEXED_PROPERTIES);

	return er;
}

// 9
ECRESULT UpdateDatabaseCreateSettingsTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_SETTINGS);

	return er;
}

ECRESULT InsertServerGUID(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	GUID guid;

	if (CoCreateGuid(&guid) != S_OK) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("InsertServerGUID(): CoCreateGuid failed");
		goto exit;
	}

	er = lpDatabase->DoInsert("INSERT INTO `settings` VALUES ('server_guid', " + lpDatabase->EscapeBinary((unsigned char *)&guid, sizeof(GUID)) + ")");
	if(er != erSuccess)
		goto exit;

exit:
	return er;
}

// 10
ECRESULT UpdateDatabaseCreateServerGUID(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = InsertServerGUID(lpDatabase);

	return er;
}

// 11
ECRESULT UpdateDatabaseCreateSourceKeys(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;
	string			strQuery;
	DB_RESULT		lpResult = NULL;
	DB_ROW			lpDBRow = NULL;
	DB_LENGTHS		lpDBLenths = NULL;


	strQuery = "SELECT `value` FROM `settings` WHERE `name` = 'server_guid'";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if(er != erSuccess)
		goto exit;

	lpDBRow = lpDatabase->FetchRow(lpResult);
	lpDBLenths = lpDatabase->FetchRowLengths(lpResult);
	if(lpDBRow == NULL || lpDBRow[0] == NULL || lpDBLenths == NULL || lpDBLenths[0] != sizeof(GUID)) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("UpdateDatabaseCreateSourceKeys(): row or columns NULL");
		goto exit;
	}
	
	//Insert source keys for folders
	strQuery = "INSERT INTO indexedproperties (tag, hierarchyid, val_binary) SELECT 26080, h.id, CONCAT(" + lpDatabase->EscapeBinary((unsigned char*)lpDBRow[0], sizeof(GUID));
	strQuery += ", CHAR(h.id&0xFF, h.id>>8&0xFF, h.id>>16&0xFF, h.id>>24&0xFF))";
	strQuery += " FROM hierarchy AS h WHERE h.type = 3";

	er = lpDatabase->DoInsert(strQuery);
	if(er != erSuccess)
		goto exit;

	//Insert source keys for messages
	strQuery = "INSERT INTO indexedproperties (tag, hierarchyid, val_binary) SELECT 26080, h.id, CONCAT(" + lpDatabase->EscapeBinary((unsigned char*)lpDBRow[0], sizeof(GUID));
	strQuery += ", CHAR(h.id&0xFF, h.id>>8&0xFF, h.id>>16&0xFF, h.id>>24&0xFF))";
	strQuery += " FROM hierarchy AS h LEFT JOIN hierarchy AS p ON h.parent = p.id WHERE h.type = 5 AND p.type = 3";

	er = lpDatabase->DoInsert(strQuery);
	if(er != erSuccess)
		goto exit;

exit:
	if(lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 12
ECRESULT UpdateDatabaseConvertEntryIDs(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;
	string			strQuery;
	DB_RESULT		lpResult = NULL;
	DB_ROW			lpDBRow = NULL;
	DB_LENGTHS		lpDBLenths = NULL;
	int				i, nStores;

	strQuery = "SELECT `guid`, `hierarchy_id` FROM `stores`";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if(er != erSuccess)
		goto exit;

	nStores = lpDatabase->GetNumRows(lpResult);

	ec_log_notice("  Stores to convert: %d", nStores);

	for (i = 0; i < nStores; ++i) {
		lpDBRow = lpDatabase->FetchRow(lpResult);
		lpDBLenths = lpDatabase->FetchRowLengths(lpResult);
		if(lpDBRow == NULL || lpDBRow[0] == NULL || lpDBRow[1] == NULL || 
			lpDBLenths == NULL || lpDBLenths[0] != sizeof(GUID) )
		{
			er = ZARAFA_E_DATABASE_ERROR;
			ec_log_crit("  Failed to convert store \"%s\"", (lpDBRow && lpDBRow[1])?lpDBRow[1]:"Unknown");
			
			if(lpDBRow == NULL || lpDBRow[0] == NULL || lpDBLenths == NULL || lpDBLenths[0] != sizeof(GUID) )
				ec_log_crit("  The table \"stores\" includes a wrong GUID");
			else
				ec_log_crit("  Check the data in table \"stores\"");
			
			goto exit;
		}

		ec_log_notice("  Converting entryids of store %d", atoui(lpDBRow[1]));

		er = CreateRecursiveStoreEntryIds(lpDatabase, atoui(lpDBRow[1]), (unsigned char*)lpDBRow[0]);
		if(er != erSuccess) {
			ec_log_crit("  Failed to convert store %d", atoui(lpDBRow[1]));
			goto exit;	
		}

	}

exit:
	if(lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

ECRESULT CreateRecursiveStoreEntryIds(ECDatabase *lpDatabase, unsigned int ulStoreHierarchyId, unsigned char* lpStoreGuid)
{
	ECRESULT		er = erSuccess;
	string			strQuery, strInsertQuery, strDefaultQuery;
	string			strInValues;
	DB_RESULT		lpDBResult = NULL;
	DB_ROW			lpDBRow = NULL;

	// FIXME: use ECListInt and ECListIntIterator (in ECGenericObjectTable.h)
	std::list<unsigned int>			lstFolders;	// The list of folders
	std::list<unsigned int>::iterator	iterFolders;

	// Insert the entryids
	strDefaultQuery = "REPLACE INTO indexedproperties (tag, hierarchyid, val_binary) ";
	strDefaultQuery+= "SELECT 0x0FFF, h.id, CONCAT('\\0\\0\\0\\0', "+ lpDatabase->EscapeBinary(lpStoreGuid, sizeof(GUID));
	strDefaultQuery+= ", '\\0\\0\\0\\0',  CHAR(h.type&0xFF, h.type>>8&0xFF, h.type>>16&0xFF, h.type>>24&0xFF), ";
	strDefaultQuery+= "CHAR(h.id&0xFF, h.id>>8&0xFF, h.id>>16&0xFF, h.id>>24&0xFF), '\\0\\0\\0\\0')";
	strDefaultQuery+= " FROM hierarchy AS h WHERE h.id IN ";

	// Add the master id
	lstFolders.push_back( ulStoreHierarchyId );

	iterFolders = lstFolders.begin();
	while (iterFolders != lstFolders.end()) {

		// Make parent list
		strInValues.clear();

		while(iterFolders != lstFolders.end()) {

			strInValues += stringify(*iterFolders);
			++iterFolders;
			if (strDefaultQuery.size() + strInValues.size() * 2 > lpDatabase->GetMaxAllowedPacket())
				break;
			if(iterFolders != lstFolders.end())
				strInValues += ",";
		}
		
		// Remove the added entries
		lstFolders.erase(lstFolders.begin(), iterFolders);

		// Insert the entryids
		er = lpDatabase->DoInsert(strDefaultQuery + "(" + strInValues + ")");
		if(er != erSuccess)
			goto exit;


		// Get the new parents
		strQuery= "SELECT id FROM hierarchy WHERE parent IN ( "+strInValues+")";

		er = lpDatabase->DoSelect(strQuery, &lpDBResult);
		if (er != erSuccess)
			goto exit;

		while(true) {
			lpDBRow = lpDatabase->FetchRow(lpDBResult);

			if (lpDBRow == NULL)
				break;
			
			if (lpDBRow[0] == NULL) {
				er = ZARAFA_E_DATABASE_ERROR;
				ec_log_err("CreateRecursiveStoreEntryIds(): column is NULL");
				goto exit;
			}

			 lstFolders.push_back(atoui(lpDBRow[0]));
		}

		if (lpDBResult) {
			lpDatabase->FreeResult(lpDBResult);
			lpDBResult = NULL;
		}
		iterFolders = lstFolders.begin();
	} //while

exit:
	return er;
}

// 13
ECRESULT UpdateDatabaseSearchCriteria(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string		strQuery;
	DB_RESULT		lpDBResult = NULL;
	DB_ROW			lpDBRow = NULL;
	unsigned int	ulStoreLast = 0;
	unsigned int	ulStoreId = 0;

	struct searchCriteria *lpNewSearchCriteria = NULL;

	// Search for all folders with PR_EC_SEARCHCRIT that are not deleted
	strQuery = "SELECT properties.storeid, hierarchy.id, properties.val_string FROM hierarchy LEFT JOIN properties ON properties.hierarchyid=hierarchy.id AND properties.tag=" + stringify(PROP_ID(PR_EC_SEARCHCRIT)) +" AND properties.type=" + stringify(PROP_TYPE(PR_EC_SEARCHCRIT)) + " WHERE hierarchy.type=3 AND hierarchy.flags=2 ORDER BY properties.storeid";

	er = lpDatabase->DoSelect(strQuery, &lpDBResult);
	if(er != erSuccess)
		goto exit;

	while(true) {
		lpDBRow = lpDatabase->FetchRow(lpDBResult);
		if (lpDBRow == NULL)
			break;

		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL) continue;

		ulStoreId = atoui(lpDBRow[0]);

		if (ulStoreLast != ulStoreId) {
			ec_log_notice(" Convert store %d", ulStoreId);
			ulStoreLast = ulStoreId;
		}
		
		// convert the entryidlist
		if (ConvertSearchCriteria52XTo6XX(lpDatabase, lpDBRow[2], &lpNewSearchCriteria) != erSuccess)
		{
			ec_log_crit("  WARNING: Unable to convert the search criteria of folder %d", atoui(lpDBRow[1]));
			goto next;
		}

		// Save criteria in new format
		er = ECSearchFolders::SaveSearchCriteria(lpDatabase, atoui(lpDBRow[0]), atoui(lpDBRow[1]), lpNewSearchCriteria);
		if (er != erSuccess) {
			ec_log_crit("  Unable to save the new search criteria of folder %d", atoui(lpDBRow[1]));
			goto exit;
		}
next: //Free
		if (lpNewSearchCriteria) { 
			FreeSearchCriteria(lpNewSearchCriteria);
			lpNewSearchCriteria = NULL;
		}
	}

exit:

	if (lpDBResult)
		lpDatabase->FreeResult(lpDBResult);
	
	if (lpNewSearchCriteria)
		FreeSearchCriteria(lpNewSearchCriteria);

	return er;
}

// 14
ECRESULT UpdateDatabaseAddUserObjectType(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	/*
	 * First we create the object_type column and initialize the values
	 * based on the isgroup and nonactive columns. Once that is done we should
	 * drop the columns. This will make the users table use the same format as
	 * the DBUserPlugin which already made use of the object_type column.
	 */
	er = lpDatabase->DoUpdate("ALTER TABLE users ADD COLUMN object_type int(11) NOT NULL default '0'");
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("UPDATE users SET object_type=5 WHERE nonactive != 0"); /* USEROBJECT_TYPE_NONACTIVE */
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("UPDATE users SET object_type=2 WHERE isgroup != 0"); /* USEROBJECT_TYPE_GROUP */
	if(er != erSuccess)
		goto exit;

	/*
	 * All other entries should be considered as users.
	 * This is safe since there are at this time no other valid object types.
	 */
	er = lpDatabase->DoUpdate("UPDATE users SET object_type=1 WHERE object_type = 0"); /* USEROBJECT_TYPE_USER */
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("ALTER TABLE users DROP COLUMN nonactive");
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("ALTER TABLE users DROP INDEX externid, DROP COLUMN isgroup, ADD INDEX externid (`externid`, `object_type`)");
	if(er != erSuccess)
		goto exit;
		
    /*
     * Another change is that for the DB plugin, the 'objects' table should now show type 5 for nonactive users (instead of 1)
     */
     
    er = lpDatabase->DoUpdate("UPDATE object SET objecttype=5 WHERE id IN (SELECT objectid FROM objectproperty WHERE propname='isnonactive' AND value != 0)");
    if(er != erSuccess)
        goto exit;

exit:

	return er;
}

// 15
ECRESULT UpdateDatabaseAddUserSignature(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	
    er = lpDatabase->DoUpdate("ALTER TABLE users ADD COLUMN signature varchar(255) NOT NULL default '0'");

    return er;
}

// 16
ECRESULT UpdateDatabaseAddSourceKeySetting(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	
    er = lpDatabase->DoUpdate("INSERT INTO `settings` VALUES ('source_key_auto_increment' , (SELECT CHAR(MAX(`id`)&0xFF, MAX(`id`)>>8&0xFF, MAX(`id`)>>16&0xFF, MAX(`id`)>>24&0xFF, 0x00, 0x00, 0x00, 0x00) FROM `hierarchy`))");

    return er;
}

// 17
ECRESULT UpdateDatabaseRestrictExternId(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	/*
	 * The previous upgrade script created an INDEX instead of an UNIQUE INDEX,
	 * this will result in incorrect behavior when multiple entries with the
	 * same externid and object_type are inserted.
	 */
	er = lpDatabase->DoUpdate("ALTER TABLE users DROP INDEX externid, ADD UNIQUE INDEX externid (`externid`, `object_type`)");

	return er;
}

// 18
ECRESULT UpdateDatabaseAddUserCompany(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er = lpDatabase->DoUpdate("ALTER TABLE users ADD COLUMN company int(11) NOT NULL default '0'");
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoInsert("INSERT INTO `users` (`externid`, `object_type`, `signature`, `company`) VALUES (NULL, 4, '', 0)");
	if(er != erSuccess)
		goto exit;
exit:
	return er;
}

// 19
ECRESULT UpdateDatabaseAddObjectRelationType(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er = lpDatabase->DoUpdate("ALTER TABLE objectrelation ADD COLUMN relationtype tinyint(11) unsigned NOT NULL");
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("ALTER TABLE objectrelation DROP PRIMARY KEY");
	if(er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("ALTER TABLE objectrelation ADD PRIMARY KEY (`objectid`, `parentobjectid`, `relationtype`)");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("UPDATE objectrelation SET relationtype = " + stringify(OBJECTRELATION_GROUP_MEMBER));
	if (er != erSuccess)
		goto exit;

exit:

	return er;
}

// 20
ECRESULT UpdateDatabaseDelUserCompany(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er = lpDatabase->DoDelete(
		"DELETE FROM `users` "
		"WHERE externid IS NULL "
			"AND object_type = 4");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoDelete(
		"DELETE FROM `objectproperty` "
		"WHERE `propname` = 'companyid' "
			"AND `value` = 'default'");
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 21
ECRESULT UpdateDatabaseAddCompanyToStore(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er = lpDatabase->DoUpdate("ALTER TABLE stores ADD COLUMN user_name varbinary(255) NOT NULL default ''");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("ALTER TABLE stores ADD COLUMN company smallint(11) NOT NULL default 0");
	if (er != erSuccess)
		goto exit;

	/*
	 * The user_name column should contain the actual username, but resolving the username for each
	 * entry will be quite tiresome without much to gain. Instead we just push the userid as
	 * username and only force the real username for new entries.
	 * The company column contains the company id to which the user belongs, we can fetch this
	 * information from the 'users' table. Note that this will always be correct regardless of
	 * hosted is enabled or disabled since the default value in the 'users' table is 0.
	 */
	er = lpDatabase->DoUpdate("UPDATE stores SET user_name = user_id, company = IFNULL( (SELECT company FROM users WHERE users.id = user_id), 0)");
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 22
ECRESULT UpdateDatabaseAddIMAPSequenceNumber(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	DB_RESULT lpResult = NULL;

	er = lpDatabase->DoSelect("SELECT * FROM settings WHERE name='imapseq'", &lpResult);
	if(er != erSuccess)
		goto exit;
	    
	if(lpDatabase->GetNumRows(lpResult) == 0) {
		er = lpDatabase->DoInsert("INSERT INTO settings (name, value) VALUES('imapseq',(SELECT max(id)+1 FROM hierarchy))");
		if(er != erSuccess)
			goto exit;
	}

exit:
	if(lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 23
ECRESULT UpdateDatabaseKeysChanges(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	string		strQuery;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	BOOL		bFirst = TRUE;
	unsigned int ulRows = 0;
	
	// Remove duplicates
	do {
		bFirst = TRUE;

		er = lpDatabase->DoSelect("SELECT id FROM changes GROUP BY parentsourcekey, change_type, sourcekey HAVING COUNT(*) > 1", &lpResult);
		if(er != erSuccess)
			goto exit;

		ulRows = lpDatabase->GetNumRows(lpResult);
		if(ulRows > 0) {
			strQuery = "DELETE FROM changes WHERE id IN (";
			while(true) {
				lpDBRow = lpDatabase->FetchRow(lpResult);

				if (lpDBRow == NULL)
					break;
				
				if (lpDBRow[0] == NULL) {
					er = ZARAFA_E_DATABASE_ERROR;
					ec_log_err("UpdateDatabaseKeysChanges(): column is NULL");
					goto exit;
				}

				if (!bFirst)
					strQuery += ",";

				bFirst = FALSE;

				strQuery += lpDBRow[0];
			}
			strQuery += ")";

			er = lpDatabase->DoUpdate(strQuery);
			if (er != erSuccess)
				goto exit;
		}

		if(lpResult) {
			lpDatabase->FreeResult(lpResult);
			lpResult = NULL;
		}

	}while(ulRows > 0);

	// Change index
	er = lpDatabase->DoUpdate("ALTER TABLE changes DROP PRIMARY KEY, DROP KEY `duplicate`, ADD PRIMARY KEY(`parentsourcekey`,`change_type`,`sourcekey`), ADD UNIQUE KEY `changeid` (`id`), ADD KEY `moved` (`moved_from`)");
	if (er != erSuccess)
		goto exit;

exit:
	if(lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 24, Move public folders and remove favorites
ECRESULT UpdateDatabaseMoveFoldersInPublicFolder(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	string		strQuery;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	unsigned int ulStoreId = 0;
	unsigned int ulSubtreeFolder = 0;
	unsigned int ulPublicFolder = 0;
	unsigned int ulFavoriteFolder = 0;
	unsigned int ulAffRows = 0;
	bool bUseStoreAcls = false;

	// Find public stores (For every company)
	// Join the subtree, publicfolders and favorites entryid

	strQuery ="SELECT s.hierarchy_id, isub.hierarchyid, ipf.hierarchyid, iff.hierarchyid FROM users AS u "
				"JOIN stores AS s ON s.user_id=u.id "
				"JOIN properties AS psub ON "
					"psub.tag = 0x35E0 AND psub.type = 0x102 AND psub.storeid = s.hierarchy_id " // PR_IPM_SUBTREE_ENTRYID
				"JOIN indexedproperties AS isub ON "
					"isub.tag=0xFFF AND isub.val_binary = psub.val_binary "
				"LEFT JOIN properties AS pf ON "
					"pf.tag = 0x6631 AND pf.type = 0x102 AND pf.storeid = s.hierarchy_id " //PR_IPM_PUBLIC_FOLDERS_ENTRYID
				"LEFT JOIN indexedproperties AS ipf ON "
					"ipf.tag=0xFFF AND ipf.val_binary = pf.val_binary "
				"LEFT JOIN properties AS ff ON "
					"ff.tag = 0x6630 AND ff.type = 0x102 AND ff.storeid = s.hierarchy_id " //PR_IPM_FAVORITES_ENTRYID
				"LEFT JOIN indexedproperties AS iff ON "
					"iff.tag=0xFFF AND iff.val_binary = ff.val_binary "
				"WHERE u.object_type=4 OR u.id = 1"; // object_type=USEROBJECT_TYPE_COMPANY or id=ZARAFA_UID_EVERYONE

	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if(er != erSuccess)
		goto exit;

	while(true) {
		lpDBRow = lpDatabase->FetchRow(lpResult);

		if (lpDBRow == NULL)
			break;
		
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL) {
			ec_log_crit("  Skip store: Unable to get the store information for storeid \"%s\"", (lpDBRow[0])?lpDBRow[0]:"Unknown");
			continue;
		}

		ulAffRows = 0;
		bUseStoreAcls = false;
		ulStoreId = atoui(lpDBRow[0]);
		ulSubtreeFolder = atoui(lpDBRow[1]);
		ulPublicFolder = (lpDBRow[2])?atoui(lpDBRow[2]):0;
		ulFavoriteFolder = (lpDBRow[3])?atoui(lpDBRow[3]):0;

		if (ulPublicFolder > 0) {

			// Move the publicfolder folders and messages to the subtree
			strQuery ="UPDATE hierarchy SET parent="+stringify(ulSubtreeFolder)+" WHERE parent="+stringify(ulPublicFolder);
			er = lpDatabase->DoUpdate(strQuery);
			if(er != erSuccess)
				goto exit;
			
			// Mark the old folder as deleted
			strQuery = "UPDATE hierarchy SET flags=flags|1024 WHERE id="+stringify(ulPublicFolder);
			er = lpDatabase->DoUpdate(strQuery);
			if(er != erSuccess)
				goto exit;

			// Remove acl's from the subtree folder 
			strQuery = "DELETE FROM acl WHERE hierarchy_id="+stringify(ulSubtreeFolder);
			er = lpDatabase->DoDelete(strQuery);
			if(er != erSuccess)
				goto exit;

			// Move the Public folder acls to the subtree folder
			strQuery = "UPDATE acl SET hierarchy_id="+stringify(ulSubtreeFolder)+" WHERE hierarchy_id="+stringify(ulPublicFolder);
			er = lpDatabase->DoUpdate(strQuery, &ulAffRows);
			if(er != erSuccess)
				goto exit;

			if (ulAffRows == 0)
				bUseStoreAcls = true;

		} else {
			bUseStoreAcls = true;
		}

		if (bUseStoreAcls) {
			// Move the store acls to the subtree folder
			strQuery = "UPDATE acl SET hierarchy_id="+stringify(ulSubtreeFolder)+" WHERE hierarchy_id="+stringify(ulStoreId);
			er = lpDatabase->DoUpdate(strQuery);
			if(er != erSuccess)
				goto exit;
		}

		if(ulFavoriteFolder > 0) {

			// Move the favoritefolder folders and messages to the subtree
			strQuery ="UPDATE hierarchy SET parent="+stringify(ulSubtreeFolder)+" WHERE parent="+stringify(ulFavoriteFolder);
			er = lpDatabase->DoUpdate(strQuery);
			if(er != erSuccess)
				goto exit;

			// Mark the old folder as deleted
			strQuery = "UPDATE hierarchy SET flags=flags|1024 WHERE id="+stringify(ulFavoriteFolder);
			er = lpDatabase->DoUpdate(strQuery);
			if(er != erSuccess)
				goto exit;

			// Remove acl's from the favorite folder 
			strQuery = "DELETE FROM acl WHERE hierarchy_id="+stringify(ulFavoriteFolder);
			er = lpDatabase->DoDelete(strQuery);
			if(er != erSuccess)
				goto exit;
		}
		
		// Remove acl's from the store 
		strQuery = "DELETE FROM acl WHERE hierarchy_id="+stringify(ulStoreId);
		er = lpDatabase->DoDelete(strQuery);
		if(er != erSuccess)
			goto exit;

		// Remove the unused properties
		strQuery = "DELETE FROM properties "
						"WHERE (tag = 0x6631 AND type=0x102 AND storeid = "+stringify(ulStoreId) + ") OR " //PR_IPM_PUBLIC_FOLDERS_ENTRYID
						"(tag = 0x6630 AND type = 0x102 AND storeid = "+stringify(ulStoreId) + ")";//PR_IPM_FAVORITES_ENTRYID

		er = lpDatabase->DoUpdate(strQuery);
		if(er != erSuccess)
			goto exit;
	}

	if(lpResult) {
		lpDatabase->FreeResult(lpResult);
		lpResult = NULL;
	}


exit:
	if(lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 25
ECRESULT UpdateDatabaseAddExternIdToObject(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;
	string			strQuery;
	DB_RESULT		lpResult = NULL;
	DB_ROW			lpDBRow = NULL;
	DB_LENGTHS		lpDBLen = NULL;
	unsigned int	ulNewId = 0;
	unsigned int	ulNewParentId = 0;
	bool			bFirstResult;

	std::list<SObject> sObjectList;
	std::list<SObject>::const_iterator sObjectIter;

	std::map<SObject,unsigned int> sObjectMap;
	std::map<SObject,unsigned int>::const_iterator sObjectMapIter;

	std::list<SRelation> sRelationList;
	std::list<SRelation>::const_iterator sRelationIter;

#define Z_TABLEDEF_OBJECT_R630	"CREATE TABLE object ( \
									`id` int(11) unsigned NOT NULL auto_increment, \
									`externid` varbinary(255), \
									`objecttype` int(11) unsigned NOT NULL default '0', \
									PRIMARY KEY (`id`, `objecttype`), \
									UNIQUE KEY id (`id`), \
									UNIQUE KEY externid (`externid`, `objecttype`) \
								) ENGINE=InnoDB;"

	// Create the new object table.
	strQuery = Z_TABLEDEF_OBJECT_R630;
	strQuery.replace(strQuery.find("object"), 6, "object_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;


	// Create the new objectproperty table.
	strQuery = Z_TABLEDEF_OBJECT_PROPERTY;
	strQuery.replace(strQuery.find("objectproperty"), 14, "objectproperty_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;


	// Create the new objectrelation table.
	strQuery = Z_TABLEDEF_OBJECT_RELATION;
	strQuery.replace(strQuery.find("objectrelation"), 14, "objectrelation_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;


	// Create a list of all current objects from the object table.
	strQuery = "SELECT id, objecttype FROM object ORDER BY objecttype";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL) {
			er = ZARAFA_E_DATABASE_ERROR;
			ec_log_err("  object table contains invalid NULL records");
			goto exit;
		}

		sObjectList.push_back(SObject(atoi(lpDBRow[0]), atoi(lpDBRow[1])));
	}

	lpDatabase->FreeResult(lpResult);
	lpResult = NULL;


	// Recreate the objects in the object_temp table and on the fly create the queries to regenerate
	// their properties in the objectpropert_temp table.
	for (sObjectIter = sObjectList.begin(); sObjectIter != sObjectList.end(); ++sObjectIter) {
		strQuery = (string)"INSERT INTO object_temp (objecttype, externid) VALUES (" + stringify(sObjectIter->ulType) + ", '" + stringify(sObjectIter->ulId) + "')";
		er = lpDatabase->DoInsert(strQuery, &ulNewId);
		if (er != erSuccess)
			goto exit;

		// Add to the map for later use
		sObjectMap[*sObjectIter] = ulNewId;

		// Find the properties for this object
		strQuery = (string)"SELECT propname, value FROM objectproperty WHERE objectid=" + stringify(sObjectIter->ulId);
		er = lpDatabase->DoSelect(strQuery, &lpResult);
		if (er != erSuccess)
			goto exit;

		strQuery.clear();
		bFirstResult = true;
		while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
			lpDBLen = lpDatabase->FetchRowLengths(lpResult);
			if (lpDBLen == NULL) {
				er = ZARAFA_E_DATABASE_ERROR;
				ec_log_err("UpdateDatabaseAddExternIdToObject(): FetchRowLengths failed");
				goto exit;
			}

			if (lpDBRow[0] == NULL) {
				er = ZARAFA_E_DATABASE_ERROR;
				ec_log_err("UpdateDatabaseAddExternIdToObject(): column NULL");
				goto exit;
			}

			if (strQuery.empty())
				strQuery = "INSERT INTO objectproperty_temp (objectid, propname, value) VALUES ";

			if (!bFirstResult)
				strQuery += ",";
			else
				bFirstResult = false;

			strQuery += 
				"(" + stringify(ulNewId) + "," + 
				lpDatabase->EscapeBinary((unsigned char*)lpDBRow[0], lpDBLen[0]) + ",";

			if (lpDBRow[1] == NULL)
				strQuery += "NULL)";
			else
				strQuery += lpDatabase->EscapeBinary((unsigned char*)lpDBRow[1], lpDBLen[1]) + ")";
		}

		lpDatabase->FreeResult(lpResult);
		lpResult = NULL;

		if (!strQuery.empty()) {
			er = lpDatabase->DoInsert(strQuery);
			if (er != erSuccess)
				goto exit;
		}

		er = lpDatabase->DoDelete("DELETE FROM objectproperty WHERE objectid=" + stringify(sObjectIter->ulId));
		if (er != erSuccess)
			goto exit;
	}


	// Now repopulate the objectrelation table.
	strQuery = "SELECT objectid, parentobjectid, relationtype FROM objectrelation";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL || lpDBRow[2] == NULL) {
			er = ZARAFA_E_DATABASE_ERROR;
			ec_log_crit("  objectrelation table contains invalid NULL records");
			goto exit;
		}

		sRelationList.push_back(SRelation(atoi(lpDBRow[0]), atoi(lpDBRow[1]), atoi(lpDBRow[2])));
	}

	lpDatabase->FreeResult(lpResult);
	lpResult = NULL;

	strQuery.clear();
	bFirstResult = true;
	for (sRelationIter = sRelationList.begin(); sRelationIter != sRelationList.end(); ++sRelationIter) {
		// Find the new parentId, if not found: ignore so they disappear .. would have been invalid relations anyway.
		switch (sRelationIter->ulRelationType) {
			case OBJECTRELATION_QUOTA_USERRECIPIENT:
			case OBJECTRELATION_USER_SENDAS:
				sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulParentObjectId, 1 /* USEROBJECT_TYPE_USER */));
				if (sObjectMapIter == sObjectMap.end())
					sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulParentObjectId, 5 /* USEROBJECT_TYPE_NONACTIVE */));
				if (sObjectMapIter == sObjectMap.end())
					continue;
				ulNewParentId = sObjectMapIter->second;
				break;

			case OBJECTRELATION_GROUP_MEMBER:
				sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulParentObjectId, 2 /* USEROBJECT_TYPE_GROUP */));
				if (sObjectMapIter == sObjectMap.end())
					continue;
				ulNewParentId = sObjectMapIter->second;
				break;

			case OBJECTRELATION_COMPANY_VIEW:
			case OBJECTRELATION_COMPANY_ADMIN:
			case OBJECTRELATION_QUOTA_COMPANYRECIPIENT:
				sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulParentObjectId, 4 /* USEROBJECT_TYPE_COMPANY */));
				if (sObjectMapIter == sObjectMap.end())
					continue;
				ulNewParentId = sObjectMapIter->second;
				break;

			case OBJECTRELATION_ADDRESSLIST_MEMBER:
				sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulParentObjectId, 6 /* USEROBJECT_TYPE_ADDRESSLIST */));
				if (sObjectMapIter == sObjectMap.end())
					continue;
				ulNewParentId = sObjectMapIter->second;
				break;
		}

		// Find the new object id
		sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulObjectId, 1 /* USEROBJECT_TYPE_USER */));
		if (sObjectMapIter == sObjectMap.end())
			sObjectMapIter = sObjectMap.find(SObject(sRelationIter->ulObjectId, 5)); // USEROBJECT_TYPE_NONACTIVE
		if (sObjectMapIter == sObjectMap.end())
			continue;
		ulNewId = sObjectMapIter->second;

		// Update strQuery for this relation
		if (strQuery.empty())
			strQuery = "INSERT INTO objectrelation_temp (objectid,parentobjectid,relationtype) VALUES ";

		if (!bFirstResult)
			strQuery += ",";
		else
			bFirstResult = false;

		strQuery += "(" + stringify(ulNewId) + "," + stringify(ulNewParentId) + "," + stringify(sRelationIter->ulRelationType) + ")";
	}

	if (!strQuery.empty()) {
		er = lpDatabase->DoInsert(strQuery);
		if (er != erSuccess)
			goto exit;
	}



	// Now delete the old tables and rename the new ones
	er = lpDatabase->DoDelete("DROP TABLE object, objectproperty, objectrelation");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("RENAME TABLE object_temp TO object, "
										   "objectproperty_temp TO objectproperty, "
										   "objectrelation_temp TO objectrelation");

exit:
	// Delete the temporary tables if they exist at this point
	lpDatabase->DoDelete("DROP TABLE IF EXISTS object_temp, objectproperty_temp, objectrelation_temp");

	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 26
ECRESULT UpdateDatabaseCreateReferences(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	string		strQuery;

#ifdef HAVE_OFFLINE_SUPPORT
	struct {
			const uLong cbUncompressed;
			const uLong cbCompressed;
			const char *lpCompressed;
	} data = {
			8678,
			271,
			"\x78\x9c\xed\xd8\xbd\x4a\x03\x41\x14\x86\xe1\x77\x67\x7f\x32\x71"
			"\x2d\x82\x24\x82\x36\x26\x60\x63\x15\xc1\xd2\x42\x2c\x2d\x84\x90"
			"\xce\x26\xb2\x46\xd1\x45\xd9\x42\xa3\x60\x97\xc2\xab\xf0\x92\xbc"
			"\x00\x2f\xc1\x5c\x84\xe0\x38\x1b\x83\x91\x54\x22\xc2\x2a\x7c\x4f"
			"\x33\x67\xbf\x81\x39\xa7\xdd\xf3\x16\xd4\x97\x43\x68\x04\xb0\x0d"
			"\x13\x5a\xf0\xf4\xb8\x4b\xc9\xec\x50\xf7\xc7\x73\x02\x1d\x66\x26"
			"\x2c\xe8\x76\xa1\xbd\x18\x8a\x88\x88\x88\x88\x88\x88\xc8\x9f\x12"
			"\xf8\x9f\xff\x25\x7f\x5a\xc2\xf2\x6b\x6c\x60\x9d\x88\x70\x6c\x61"
			"\x05\x83\x19\x27\x1f\x85\xeb\xf5\x0f\x0e\xf7\xfb\x47\xae\xea\x89"
			"\x7f\xe4\x7f\x4e\x2d\x22\x22\x22\x22\x22\x22\xf2\x4b\x5e\x02\x1a"
			"\x55\xcf\x50\xa5\x80\x88\x01\x1b\xbe\x6a\xb1\xf9\x99\xf6\x58\xf5"
			"\x37\xa5\x01\x71\x64\x9a\x5b\xed\x6f\xf2\xaf\xa5\x79\x71\x33\xca"
			"\x8a\xe1\x59\x7e\x4a\x8c\x1d\x5e\xdc\x16\x97\xbe\x4c\x88\x46\xd9"
			"\x39\x35\xd2\xbb\xec\xea\xf8\x24\x2f\xb2\xeb\x7b\xa2\x34\x4d\x99"
			"\xae\x5c\xbc\xb0\x03\xb1\x4d\x12\xa6\x1b\x17\xcf\xf8\x20\x89\x7c"
			"\x60\xbf\x04\xb5\xd4\xda\x72\x63\xb3\xf6\xd0\x84\xd7\x3d\x70\xf3"
			"\x7e\x6e\xd6\xcc\xf9\x4e\x6e\xde\xc6\xf1\x0e\x4f\x19\x36\x95"
	};
	Bytef		*lpUncompressed = NULL;
	uLong		cbUncompressed = data.cbUncompressed;
	std::string	strLobPath;
	FILE		*fdLob = NULL;
#endif

	er = lpDatabase->DoInsert(Z_TABLEDEF_REFERENCES);
	if (er != erSuccess)
		goto exit;

	/* 
	 * Create all attachment references from hierarchy table, let
	 * instanceid be equal to hierarchyid to minimize the impact
	 * on the upgrade.
	 */
	strQuery =
		"INSERT INTO `singleinstances` (`instanceid`, `hierarchyid`, `tag`) "
			"SELECT id, id, " + stringify(PROP_ID(PR_ATTACH_DATA_BIN)) + " "
			"FROM `hierarchy` "
			"WHERE type = " + stringify(MAPI_ATTACH);

	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	/* We need to rename the column in `lob` */
#ifdef HAVE_OFFLINE_SUPPORT
	lpUncompressed = new Bytef[cbUncompressed];

	if (uncompress(lpUncompressed, &cbUncompressed, (const Bytef*)data.lpCompressed, data.cbCompressed) != Z_OK) {
		er = ZARAFA_E_UNABLE_TO_COMPLETE;
		goto exit;
	}

	strLobPath = lpDatabase->GetDatabaseDir() + "/zarafa/lob.frm";
	fdLob = fopen(strLobPath.c_str(), "wb");
	if (fdLob == NULL) {
		er = ZARAFA_E_UNABLE_TO_COMPLETE;
		goto exit;
	}

	fwrite(lpUncompressed, 1, cbUncompressed, fdLob);
	fclose(fdLob);	

	er = lpDatabase->DoUpdate("FLUSH TABLES");
	if (er != erSuccess)
		goto exit;
#else
	strQuery =
		"ALTER TABLE `lob` "
		"CHANGE COLUMN `hierarchyid` `instanceid` int(11) unsigned NOT NULL";

	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;
#endif

exit:
#ifdef HAVE_OFFLINE_SUPPORT
	delete[] lpUncompressed;
#endif

	return er;
}

// 27
ECRESULT UpdateDatabaseLockDistributed(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;

	er = lpDatabase->DoInsert("INSERT INTO settings VALUES ('lock_distributed_zarafa', 'upgrade')");
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 28
ECRESULT UpdateDatabaseCreateABChangesTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;
	string			strQuery;
	DB_RESULT		lpResult = NULL;
	DB_ROW			lpDBRow = NULL;
	DB_LENGTHS		lpDBLen = NULL;
	int				ulId = 0;
	list<int>		syncIds;
	list<string>	queries;
	bool			fFirst = true;
	string			strSyncId;

	list<string>::const_iterator	queryIter;
	list<int>::const_iterator		syncIdIter;

	er = lpDatabase->DoInsert(Z_TABLEDEF_ABCHANGES);
	if (er != erSuccess)
		goto exit;
		
	strQuery = "SELECT id, sourcekey, parentsourcekey, change_type FROM changes WHERE change_type & " + stringify(ICS_AB) + " AND parentsourcekey=0x00000000AC21A95040D3EE48B319FBA75330442500000000040000000100000000000000";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	// Extract the AB changes from the changes table.
	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		lpDBLen = lpDatabase->FetchRowLengths(lpResult);

		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL || lpDBLen[1] == 0 || lpDBRow[2] == NULL || lpDBLen[2] == 0) {
			er = ZARAFA_E_DATABASE_ERROR;
			ec_log_crit("  changes table contains invalid NULL records");
			goto exit;
		}

		ulId = atoi(lpDBRow[0]);
		syncIds.push_back(ulId);

		strQuery = "INSERT INTO abchanges (id, sourcekey, parentsourcekey, change_type";
		strQuery += (string)") VALUES (" + lpDBRow[0] + ", " +
								   lpDatabase->EscapeBinary((unsigned char*)lpDBRow[1], lpDBLen[1]) + ", " +
								   lpDatabase->EscapeBinary((unsigned char*)lpDBRow[2], lpDBLen[2]) + ", " +
								   lpDBRow[3];
		strQuery += ")";
        queries.push_back(strQuery);
	}
	lpDatabase->FreeResult(lpResult);
	lpResult = NULL;

	
	// Populate the abchanges table with the extracted data
	for (queryIter = queries.begin(); queryIter != queries.end(); ++queryIter) {
		er = lpDatabase->DoInsert(*queryIter);
		if (er != erSuccess)
			goto exit;
	}


	// Remove the extracted changes from the changes table
	strQuery = "DELETE FROM changes WHERE id IN (";
	for (syncIdIter = syncIds.begin(); syncIdIter != syncIds.end(); ++syncIdIter) {
		strSyncId = stringify(*syncIdIter, false);
		
		if (strQuery.length() + strSyncId.length() + 2 >= lpDatabase->GetMaxAllowedPacket()) {	// we need to be able to add a ',' and a ')';
			strQuery += ")";
			er = lpDatabase->DoInsert(strQuery);
			if (er != erSuccess)
				goto exit;
				
			strQuery = "DELETE FROM changes WHERE id IN (";
			fFirst = true;
		}
			
		if (!fFirst)
			strQuery += ",";
		fFirst = false;

		strQuery += strSyncId;
	}
	if (!fFirst) {
		strQuery += ")";
		er = lpDatabase->DoInsert(strQuery);
	}
	
exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);
		
	if (er != erSuccess)
		lpDatabase->DoDelete("DROP TABLE IF EXISTS abchanges");

	return er;
}

// 29
ECRESULT UpdateDatabaseSetSingleinstanceTag(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	string		strQuery;

	// Force all tag values to PR_ATTACH_DATA_BIN. Up to now, no other values can be present in the table.
	strQuery = "UPDATE `singleinstances` SET `tag` = " + stringify(PROP_ID(PR_ATTACH_DATA_BIN));

	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 30
ECRESULT UpdateDatabaseCreateSyncedMessagesTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEFS_SYNCEDMESSAGES);

	return er;
}

// 31
ECRESULT UpdateDatabaseForceAbResync(ECDatabase *lpDatabase)
{
#ifdef HAVE_OFFLINE_SUPPORT
	ECRESULT	er = erSuccess;
	std::string	strQuery;

	// Remove the PR_EC_AB_SYNC_STATUS property.
	strQuery = "DELETE p.* FROM properties AS p JOIN stores AS s ON p.storeid=s.hierarchy_id AND p.hierarchyid=s.hierarchy_id WHERE p.tag=0x67a2 AND p.type=0x102";
	er = lpDatabase->DoDelete(strQuery);
#else
	ECRESULT	er = ZARAFA_E_IGNORE_ME;
#endif
	
	return er;
}

// 32
ECRESULT UpdateDatabaseRenameObjectTypeToObjectClass(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	std::string strQuery;

	// rename columns in users and object tables
	strQuery =
		"ALTER TABLE `users` "
		"CHANGE COLUMN `object_type` `objectclass` int(11) unsigned NOT NULL";
	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;

	// Note: type also changes from int to tinyint here
	strQuery =
		"ALTER TABLE `object` "
		"CHANGE COLUMN `objecttype` `objectclass` int(11) unsigned NOT NULL";
	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 33
ECRESULT UpdateDatabaseConvertObjectTypeToObjectClass(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	DB_LENGTHS	lpDBLen = NULL;
	std::string strQuery, strUpdate;
	bool bFirst = true;
	std::map<unsigned int, unsigned int> mapTypes;
	std::map<unsigned int, unsigned int>::const_iterator iTypes;
	std::list<std::string> lstUpdates;

	// make internal SYSTEM a objectclass_t user
	er = lpDatabase->DoUpdate("UPDATE `users` SET `objectclass` = "+stringify(ACTIVE_USER)+" WHERE `externid` is NULL AND `objectclass` = 1");
	if (er != erSuccess)
		goto exit;

	// make internal EVERYONE a objectclass_t security group
	er = lpDatabase->DoUpdate("UPDATE `users` SET `objectclass` = "+stringify(DISTLIST_SECURITY)+" WHERE `externid` is NULL AND `objectclass` = 2");
	if (er != erSuccess)
		goto exit;

	// database stored typed, convert to the new objectclass_t values
	mapTypes.insert(std::pair<unsigned int, unsigned int>(1, ACTIVE_USER)); // USEROBJECT_TYPE_USER
	mapTypes.insert(std::pair<unsigned int, unsigned int>(2, DISTLIST_GROUP)); // USEROBJECT_TYPE_GROUP
	mapTypes.insert(std::pair<unsigned int, unsigned int>(3, NONACTIVE_CONTACT)); // USEROBJECT_TYPE_CONTACT (unused, but who knows..)
	mapTypes.insert(std::pair<unsigned int, unsigned int>(4, CONTAINER_COMPANY)); // USEROBJECT_TYPE_COMPANY
	mapTypes.insert(std::pair<unsigned int, unsigned int>(5, NONACTIVE_USER)); // USEROBJECT_TYPE_NONACTIVE
	mapTypes.insert(std::pair<unsigned int, unsigned int>(6, CONTAINER_ADDRESSLIST)); // USEROBJECT_TYPE_ADDRESSLIST

	for (iTypes = mapTypes.begin(); iTypes != mapTypes.end(); ++iTypes) {
		// extern id, because it links to object table for DB plugin
		// on LDAP plugin, object table is empty.
		er = lpDatabase->DoSelect("SELECT `externid`, `objectclass` FROM `users` WHERE `externid` is not NULL AND `objectclass` = "+stringify(iTypes->first), &lpResult);
		if (er != erSuccess)
			goto exit;

		strUpdate = "(";
		bFirst = true;
		while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
			lpDBLen = lpDatabase->FetchRowLengths(lpResult);
			if (lpDBRow[0] == NULL || lpDBLen == NULL || lpDBLen[0] == 0) {
				er = ZARAFA_E_DATABASE_ERROR;
				ec_log_crit("  users table contains invalid NULL records for type %d", iTypes->first);
				goto exit;
			}

			if (!bFirst)
				strUpdate += ",";

			strUpdate += lpDatabase->EscapeBinary((unsigned char*)lpDBRow[0], lpDBLen[0]);
			bFirst = false;
		}
		strUpdate += ")";

		if (bFirst)
			continue;			// we had no results for this type, continue with the next

		// save all queries in a list, so we don't cross-update types

		strQuery =
			"UPDATE `users` SET `objectclass`=" + stringify(iTypes->second) + " "
			"WHERE `externid` IN " + strUpdate + " "
			"AND `objectclass` = " + stringify(iTypes->first);
		lstUpdates.push_back(strQuery);

		strQuery =
			"UPDATE `object` SET `objectclass`=" + stringify(iTypes->second) + " "
			"WHERE `externid` IN " + strUpdate + " "
			"AND `objectclass` = " + stringify(iTypes->first);
		lstUpdates.push_back(strQuery);
	}

	// process all type updates
	for (std::list<std::string>::const_iterator iu = lstUpdates.begin();
	     iu != lstUpdates.end(); ++iu) {
		er = lpDatabase->DoUpdate(*iu);
		if (er != erSuccess)
			goto exit;
	}

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 34
ECRESULT UpdateDatabaseAddMVPropertyTable(ECDatabase *lpDatabase)
{
	ECRESULT		er = erSuccess;

	er = lpDatabase->DoInsert(Z_TABLEDEF_OBJECT_MVPROPERTY);

	return er;
}

// 35
ECRESULT UpdateDatabaseCompanyNameToCompanyId(ECDatabase *lpDatabase)
{
	ECRESULT	er = erSuccess;
	string		strQuery;
	map<string, string> mapIdToName;
	std::map<std::string, std::string>::const_iterator iter;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	DB_LENGTHS	lpDBLen = NULL;

	// find all companies
	strQuery = "SELECT object.externid, objectproperty.value FROM objectproperty JOIN object ON objectproperty.objectid=object.id WHERE objectproperty.propname = 'companyname'";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL)
			continue;

		lpDBLen = lpDatabase->FetchRowLengths(lpResult);
		
		mapIdToName.insert(pair<string,string>(string(lpDBRow[0], lpDBLen[0]), string(lpDBRow[1], lpDBLen[1])));
	}

	// update objects to link via externid in companyid, not companyname anymore
	for (iter = mapIdToName.begin(); iter != mapIdToName.end(); ++iter) {
		strQuery = "UPDATE objectproperty SET value = 0x" + bin2hex(iter->first) +
			" WHERE propname='companyid' AND value = '" + iter->second + "'";

		er = lpDatabase->DoUpdate(strQuery);
		if (er != erSuccess)
			goto exit;
	}

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 36
ECRESULT UpdateDatabaseOutgoingQueuePrimarykey(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er= lpDatabase->DoUpdate("ALTER TABLE outgoingqueue DROP PRIMARY KEY, ADD PRIMARY KEY (`hierarchy_id`,`flags`,`store_id`)");
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 37
ECRESULT UpdateDatabaseACLPrimarykey(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er= lpDatabase->DoUpdate("ALTER TABLE acl DROP PRIMARY KEY, ADD PRIMARY KEY (`hierarchy_id`,`id`,`type`)");
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 38
ECRESULT UpdateDatabaseBlobExternId(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	strQuery = "ALTER TABLE `object` "
				"DROP KEY `externid`, "
				"MODIFY `externid` blob, "
				"ADD UNIQUE KEY `externid` (`externid`(255), `objectclass`)";

	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;

	strQuery = "ALTER TABLE `users` "
				"DROP KEY `externid`, "
				"MODIFY `externid` blob, "
				"ADD UNIQUE KEY `externid` (`externid`(255), `objectclass`)";

	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 39
ECRESULT UpdateDatabaseKeysChanges2(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	// Change index
	er = lpDatabase->DoUpdate("ALTER TABLE changes DROP PRIMARY KEY, ADD PRIMARY KEY(`parentsourcekey`,`sourcekey`,`change_type`)");
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

/**
 * Update the primary key in mvproperties
 *
 * Change the primary key to get more performance in mysql because the mysql can not 
 * choose the right key we change the index into one primary key.
 *
 * @remarks We are checking extra for the 'hi' key because some upgrade issues
 *
 * @param[in]	lpDatabase	ECDatabase object pointer to update.
 * @retval		erSuccess 
 *					Update is done.
 * @retval		ZARAFA_E_DATABASE_ERROR
 *					Update failed
 */
// 40
ECRESULT UpdateDatabaseMVPropertiesPrimarykey(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	bool		bUpdate = false;

	er = lpDatabase->DoSelect("SHOW KEYS FROM mvproperties", &lpResult);
	if (er != erSuccess)
		goto exit;

	// Result: | Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment |

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL || lpDBRow[2] == NULL)
			continue;

		if(stricmp(lpDBRow[2], "hi") == 0) {
			bUpdate = true;
			break;
		}
	}

	if (bUpdate) {
		er = lpDatabase->DoUpdate("ALTER TABLE mvproperties DROP PRIMARY KEY, ADD PRIMARY KEY (`hierarchyid`,`tag`,`type`,`orderid`), DROP KEY `hi`");
		if (er != erSuccess)
			goto exit;
	}

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 41
ECRESULT UpdateDatabaseFixDBPluginGroups(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	er = lpDatabase->DoUpdate("UPDATE object SET objectclass="+stringify(DISTLIST_SECURITY)+" WHERE objectclass="+stringify(DISTLIST_GROUP));
	if (er != erSuccess)
		goto exit;

exit:
	return er;
}

// 42
ECRESULT UpdateDatabaseFixDBPluginSendAs(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	DB_LENGTHS	lpDBLen = NULL;
	list<std::pair<string, string> > lstRelations;
	std::list<std::pair<std::string, std::string> >::const_iterator iRelations;

	// relation 6 == OBJECTRELATION_USER_SENDAS
	er = lpDatabase->DoSelect("SELECT objectid, parentobjectid FROM objectrelation WHERE relationtype=6", &lpResult);
	if (er != erSuccess)
		goto exit;

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL)
			continue;

		lpDBLen = lpDatabase->FetchRowLengths(lpResult);
		
		lstRelations.push_back(pair<string,string>(string(lpDBRow[0], lpDBLen[0]), string(lpDBRow[1], lpDBLen[1])));
	}

	er = lpDatabase->DoDelete("DELETE FROM objectrelation WHERE relationtype=6");
	if (er != erSuccess)
		goto exit;

	for (iRelations = lstRelations.begin(); iRelations != lstRelations.end(); ++iRelations) {
		er = lpDatabase->DoUpdate("INSERT INTO objectrelation (objectid, parentobjectid, relationtype) VALUES ("+iRelations->second+", "+iRelations->first+", 6)");
		if (er != erSuccess)
			goto exit;
	}

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

/**
 * IMAP used to store subscriptions on the store. This gave problems
 * when multi-threaded IMAP clients (Thunderbird) subscribed on
 * folders in one thread, and requested the list on another
 * thread. This would have returned the old subscribed list, since the
 * store doesn't have an update notification system like normal
 * folders do.  Moved to the Inbox, since this folder is always
 * present and easy to find on the server and client.
 *
 * @param[in]	lpDatabase	ECDatabase object pointer to update.
 * @return		ECRESULT	erSuccess or ZARAFA_E_DATABASE_ERROR
 */
// 43
ECRESULT UpdateDatabaseMoveSubscribedList(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	map<string, string> mapStoreInbox;
	std::map<std::string, std::string>::const_iterator i;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;
	DB_LENGTHS	lpDBLen = NULL;

	er = lpDatabase->DoSelect("SELECT storeid, objid FROM receivefolder WHERE messageclass='IPM'", &lpResult);
	if (er != erSuccess)
		goto exit;

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL)
			continue;

		lpDBLen = lpDatabase->FetchRowLengths(lpResult);
		
		mapStoreInbox.insert(pair<string,string>(string(lpDBRow[0], lpDBLen[0]), string(lpDBRow[1], lpDBLen[1])));
	}

	for (i = mapStoreInbox.begin(); i != mapStoreInbox.end(); ++i) {
		// Remove property if it's already there (possible if you run new gateway against old server before upgrade)
		er = lpDatabase->DoDelete("DELETE FROM properties WHERE storeid="+i->first+" AND hierarchyid="+i->first+" AND tag=0x6784 AND type=0x0102");
		if (er != erSuccess)
			goto exit;

		// does not return an error if property was not in the database
		er = lpDatabase->DoUpdate("UPDATE properties SET hierarchyid="+i->second+
								  " WHERE storeid="+i->first+" AND hierarchyid="+i->first+" AND tag=0x6784 AND type=0x0102");
		if (er != erSuccess)
			goto exit;
	}

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 44
ECRESULT UpdateDatabaseSyncTimeIndex(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	bool bHaveIndex;

	// There are upgrade paths where the sync_time key already exists.
	er = lpDatabase->CheckExistIndex("syncs", "sync_time", &bHaveIndex);
	if (er == erSuccess && !bHaveIndex)
		er = lpDatabase->DoUpdate("ALTER TABLE syncs ADD INDEX sync_time (`sync_time`)");

	return er;
}

// 45
ECRESULT UpdateDatabaseAddStateKey(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
#ifndef HAVE_OFFLINE_SUPPORT
	bool bHaveIndex;

	// There are upgrade paths where the state key already exists.
	er = lpDatabase->CheckExistIndex("changes", "state", &bHaveIndex);
	if (er == erSuccess && !bHaveIndex)
		er = lpDatabase->DoUpdate("ALTER TABLE changes ADD UNIQUE KEY `state` (`parentsourcekey`,`id`)");
#else

	er = ZARAFA_E_IGNORE_ME;
#endif

	return er;
}

// 46
ECRESULT UpdateDatabaseConvertToUnicode(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

#ifndef HAVE_OFFLINE_SUPPORT
	if (lpDatabase->m_bForceUpdate) {
#endif
		PROGRESS_INIT(Z_UPDATE_CONVERT_TO_UNICODE)

		// Admin requested a forced upgrade, converting known tables
		
		/*
		 * Since we inserted the company guid into the objectproperty
		 * table, this convert may break, since the binary data won't
		 * be valid utf-8 data in mysql. So we convert the 'companyid'
		 * properties from this table into a hexed version, which is
		 * plain text and will not break.
		 *
		 * We need to do this first, since the begin/commit will work
		 * on this statement, and won't on the following alter table
		 * commands.
		 */
		strQuery = "UPDATE objectproperty SET value = hex(value) WHERE propname = 'companyid'";
		er = lpDatabase->DoUpdate(strQuery);
		if (er != erSuccess)
			goto exit;

		// Convert tables to unicode

		strQuery = "ALTER TABLE mvproperties MODIFY val_string longtext CHARSET utf8 COLLATE utf8_general_ci";
		er = lpDatabase->DoUpdate(strQuery);
		if (er != erSuccess)
			goto exit;

		// No need to convert the properties table as that will be done on the fly in update 50 (Z_UPDATE_CONVERT_PROPERTIES)

		// db-plugin
		strQuery = "ALTER TABLE objectproperty MODIFY propname VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci, MODIFY value TEXT CHARSET utf8 COLLATE utf8_general_ci";
		er = lpDatabase->DoUpdate(strQuery);
		if (er != erSuccess)
			goto exit;

		/*
		 * Another similar change is to the SYSADMIN property; it used
		 * to be 12345:XXXXXXXX with XXXXX being a binary externid. That
		 * has changed to be a hexed version, so, 12345:HHHHHHHHHH, with
		 * HHHH being the hexed version of XXXXX
		 */
		strQuery = "UPDATE objectproperty SET value = concat(substr(value,1,instr(value,';')-1),';',hex(substr(value,instr(value,';')+1))) WHERE propname = 'companyadmin'";
		er = lpDatabase->DoUpdate(strQuery);
		if (er != erSuccess)
			goto exit; 

		strQuery = "ALTER TABLE objectmvproperty MODIFY propname VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci, MODIFY value TEXT CHARSET utf8 COLLATE utf8_general_ci";
		er = lpDatabase->DoUpdate(strQuery);
		if (er != erSuccess)
			goto exit;

		/*
		 * Other tables containing varchar's are not converted, all data in those fields are us-ascii anyway:
		 * - receivefolder
		 * - stores (specially handled in next update
		 * - settings
		 */
		PROGRESS_DONE
#ifndef HAVE_OFFLINE_SUPPORT
	} else {
		ec_log_crit("Will not upgrade your database from 6.40.x to 7.0.");
		ec_log_crit("The recommended upgrade procedure is to use the zarafa7-upgrade commandline tool.");
		ec_log_crit("Please consult the Zarafa administrator manual on how to correctly upgrade your database.");
		ec_log_crit("Alternatively you may try to upgrade using --force-database-upgrade,");
		ec_log_crit("but no progress and estimates within the updates will be available.");
		er = ZARAFA_E_USER_CANCEL;
		goto exit;
	}
#endif

exit:
	return er;
}

// 47
ECRESULT UpdateDatabaseConvertStoreUsername(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	PROGRESS_INIT(Z_UPDATE_CONVERT_STORE_USERNAME)

	er = lpDatabase->DoUpdate("UPDATE stores SET user_name = CAST(CONVERT(user_name USING latin1) AS CHAR(255) CHARACTER SET utf8)");
	if (er == erSuccess)
		er = lpDatabase->DoUpdate("ALTER TABLE stores MODIFY user_name VARCHAR(255) CHARACTER SET utf8 NOT NULL DEFAULT ''");

	PROGRESS_DONE

#ifdef HAVE_OFFLINE_SUPPORT
exit:
#endif
	return er;
}

// 48
ECRESULT UpdateDatabaseConvertRules(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;

	convert_context converter;
	char *lpszConverted = NULL;

#ifdef HAVE_OFFLINE_SUPPORT
	unsigned int ulTotal = 0;
	unsigned int ulCurrent = 0;
#endif
	PROGRESS_INIT(Z_UPDATE_CONVERT_RULES)

	er = lpDatabase->DoSelect("SELECT p.hierarchyid, p.storeid, p.val_binary FROM properties AS p JOIN receivefolder AS r ON p.hierarchyid=r.objid AND p.storeid=r.storeid JOIN stores AS s ON r.storeid=s.hierarchy_id WHERE p.tag=0x3fe1 AND p.type=0x102 AND r.messageclass='IPM'", &lpResult);
	if (er != erSuccess)
		goto exit;

#ifdef HAVE_OFFLINE_SUPPORT
	ulTotal = lpDatabase->GetNumRows(lpResult);
#endif

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL || lpDBRow[2] == NULL) {
			er = ZARAFA_E_DATABASE_ERROR;
			ec_log_err("UpdateDatabaseConvertRules(): column NULL");
			goto exit;
		}

		// Use WTF-1252 here since the pre-unicode rule serializer didn't pass the SOAP_C_UTFSTRING flag, causing
		// gsoap to encode the data as UTF8, eventhough it was already encoded as WINDOWS-1252.
		lpszConverted = ECStringCompat::WTF1252_to_UTF8(NULL, lpDBRow[2], &converter);

		er = lpDatabase->DoUpdate("UPDATE properties SET val_binary='" + lpDatabase->Escape(lpszConverted) + "' WHERE hierarchyid=" + lpDBRow[0] + " AND storeid=" + lpDBRow[1] + " AND tag=0x3fe1 AND type=0x102");
		if (er != erSuccess)
			goto exit;

		INTERMEDIATE_PROGRESS(++ulCurrent, ulTotal)

		delete[] lpszConverted;
		lpszConverted = NULL;
	}

	PROGRESS_DONE

exit:
	delete[] lpszConverted;

	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 49
ECRESULT UpdateDatabaseConvertSearchFolders(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;

	std::string strQuery;
	DB_RESULT	lpResult = NULL;
	DB_ROW		lpDBRow = NULL;

	convert_context converter;
	char *lpszConverted = NULL;

#ifdef HAVE_OFFLINE_SUPPORT
	unsigned int ulTotal = 0;
	unsigned int ulCurrent = 0;
#endif
	PROGRESS_INIT(Z_UPDATE_CONVERT_SEARCH_FOLDERS)

	strQuery = "SELECT h.id, p.storeid, p.val_string FROM hierarchy AS h JOIN properties AS p ON p.hierarchyid=h.id AND p.tag=" + stringify(PROP_ID(PR_EC_SEARCHCRIT)) +" AND p.type=" + stringify(PROP_TYPE(PR_EC_SEARCHCRIT)) + " WHERE h.type=3 AND h.flags=2";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

#ifdef HAVE_OFFLINE_SUPPORT
	ulTotal = lpDatabase->GetNumRows(lpResult);
#endif

	while ((lpDBRow = lpDatabase->FetchRow(lpResult))) {
		if (lpDBRow[0] == NULL || lpDBRow[1] == NULL || lpDBRow[2] == NULL) {
			er = ZARAFA_E_DATABASE_ERROR;
			ec_log_err("UpdateDatabaseConvertSearchFolders(): column NULL");
			goto exit;
		}

		// Use WTF-1252 here since the pre-unicode rule serializer didn't pass the SOAP_C_UTFSTRING flag, causing
		// gsoap to encode the data as UTF8, eventhough it was already encoded as WINDOWS-1252.
		lpszConverted = ECStringCompat::WTF1252_to_WINDOWS1252(NULL, lpDBRow[2], &converter);

		er = lpDatabase->DoUpdate("UPDATE properties SET val_string='" + lpDatabase->Escape(lpszConverted) + "' WHERE hierarchyid=" + lpDBRow[0] + " AND storeid=" + lpDBRow[1] + " AND tag=" + stringify(PROP_ID(PR_EC_SEARCHCRIT)) +" AND type=" + stringify(PROP_TYPE(PR_EC_SEARCHCRIT)));
		if (er != erSuccess)
			goto exit;

		INTERMEDIATE_PROGRESS(++ulCurrent, ulTotal)

		delete[] lpszConverted;
		lpszConverted = NULL;
	}

	PROGRESS_DONE

exit:
	delete[] lpszConverted;

	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 50
ECRESULT UpdateDatabaseConvertProperties(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;
	DB_RESULT lpResult = NULL;
	DB_ROW lpDBRow = NULL;

#ifdef HAVE_OFFLINE_SUPPORT
	unsigned int ulTotal = 0;
	unsigned int ulCurrent = 0;
#endif
	PROGRESS_INIT(Z_UPDATE_CONVERT_PROPERTIES)

	// Create the temporary properties table
	strQuery = Z_TABLEDEF_PROPERTIES;
	strQuery.replace(strQuery.find("CREATE TABLE"), strlen("CREATE TABLE"), "CREATE TABLE IF NOT EXISTS");
	strQuery.replace(strQuery.find("properties"), strlen("properties"), "properties_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

#ifdef HAVE_OFFLINE_SUPPORT
	strQuery = "SELECT MAX(hierarchyid) FROM properties";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	lpDBRow = lpDatabase->FetchRow(lpResult);
	if (lpDBRow == NULL) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("UpdateDatabaseConvertProperties(): row non existing");
		goto exit;
	}

	ulTotal = lpDBRow[0] ? atoui(lpDBRow[0]) : 0;
	lpDatabase->FreeResult(lpResult);
	lpResult = NULL;
#endif

	while (true) {
		strQuery = "INSERT IGNORE INTO properties_temp (hierarchyid,tag,type,val_ulong,val_string,val_binary,val_double,val_longint,val_hi,val_lo) SELECT hierarchyid,tag,type,val_ulong,val_string,val_binary,val_double,val_longint,val_hi,val_lo FROM properties ORDER BY hierarchyid ASC LIMIT 10000";
		er = lpDatabase->DoInsert(strQuery);
		if (er != erSuccess)
			goto exit;

		strQuery = "DELETE FROM properties ORDER BY hierarchyid ASC LIMIT 10000";
		er = lpDatabase->DoDelete(strQuery);
		if (er != erSuccess)
			goto exit;

		er = lpDatabase->Commit();
		if (er != erSuccess)
			goto exit;

		er = lpDatabase->Begin();
		if (er != erSuccess)
			goto exit;

		strQuery = "SELECT MIN(hierarchyid) FROM properties";
		er = lpDatabase->DoSelect(strQuery, &lpResult);
		if (er != erSuccess)
			goto exit;

		lpDBRow = lpDatabase->FetchRow(lpResult);
		if (lpDBRow == NULL || lpDBRow[0] == NULL)
			break;

		INTERMEDIATE_PROGRESS(atoui(lpDBRow[0]), ulTotal)

		lpDatabase->FreeResult(lpResult);
		lpResult = NULL;
	}

	// update webaccess settings which were already utf8 in our latin1 table
	strQuery = "UPDATE properties_temp JOIN hierarchy ON properties_temp.hierarchyid=hierarchy.id AND hierarchy.parent IS NULL SET val_string = CAST(CAST(CONVERT(val_string USING latin1) AS binary) AS CHAR CHARACTER SET utf8) WHERE properties_temp.type=0x1e AND properties_temp.tag=26480";
	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("RENAME TABLE properties TO properties_old, properties_temp TO properties");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoDelete("DROP TABLE properties_old");

	PROGRESS_DONE

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

	return er;
}

// 51
ECRESULT UpdateDatabaseCreateCounters(ECDatabase *lpDatabase)
{
	const struct {
		ULONG ulPropTag;
		ULONG ulChildType;
		ULONG ulChildFlagMask;
		ULONG ulChildFlags;
		const char* lpszValue;
	} counter_info[] = {
		{ PR_CONTENT_COUNT,				MAPI_MESSAGE,	MAPI_ASSOCIATED|MSGFLAG_DELETED,				0,									"COUNT(*)" },
		{ PR_CONTENT_UNREAD,			MAPI_MESSAGE,	MAPI_ASSOCIATED|MSGFLAG_DELETED|MSGFLAG_READ,	0,									"SUM(IF(flags&1,0,1))" },
		{ PR_ASSOC_CONTENT_COUNT,		MAPI_MESSAGE,	MAPI_ASSOCIATED|MSGFLAG_DELETED,				MAPI_ASSOCIATED,					"0" },
		{ PR_DELETED_MSG_COUNT,			MAPI_MESSAGE,	MAPI_ASSOCIATED|MSGFLAG_DELETED,				MSGFLAG_DELETED,					"0" },
		{ PR_DELETED_ASSOC_MSG_COUNT,	MAPI_MESSAGE,	MAPI_ASSOCIATED|MSGFLAG_DELETED,				MAPI_ASSOCIATED|MSGFLAG_DELETED,	"0" },
		{ PR_SUBFOLDERS,				MAPI_FOLDER,	MSGFLAG_DELETED,								0,									"0" },
		{ PR_FOLDER_CHILD_COUNT,		MAPI_FOLDER,	MSGFLAG_DELETED,								0,									"0" },
		{ PR_DELETED_FOLDER_COUNT,		MAPI_FOLDER,	MSGFLAG_DELETED,								MSGFLAG_DELETED,					"0" }
	};

	ECRESULT er = erSuccess;
	std::string strQuery;

#ifdef HAVE_OFFLINE_SUPPORT
	unsigned int ulCurrent = 0;
#endif
	PROGRESS_INIT(Z_UPDATE_CREATE_COUNTERS)

	for (unsigned i = 0; i < 8; ++i) {
		strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_ulong) "
						"SELECT parent.id,"+stringify(PROP_ID(counter_info[i].ulPropTag))+","+stringify(PROP_TYPE(counter_info[i].ulPropTag))+",count(child.id) "
						"FROM hierarchy AS parent "
							"LEFT JOIN hierarchy AS child ON parent.id=child.parent AND "
														"parent.type=3 and child.type="+stringify(counter_info[i].ulChildType)+" AND "
														"child.flags & "+stringify(counter_info[i].ulChildFlagMask)+"="+stringify(counter_info[i].ulChildFlags)+" "
						"GROUP BY parent.id";
		er = lpDatabase->DoInsert(strQuery);
		if (er != erSuccess)
			goto exit;

		INTERMEDIATE_PROGRESS(++ulCurrent, 16)

		strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_ulong) "
						"SELECT folderid,"+stringify(PROP_ID(counter_info[i].ulPropTag))+","+stringify(PROP_TYPE(counter_info[i].ulPropTag))+","+counter_info[i].lpszValue+" FROM searchresults GROUP BY folderid";
		er = lpDatabase->DoInsert(strQuery);
		if (er != erSuccess)
			goto exit;

		INTERMEDIATE_PROGRESS(++ulCurrent, 16)
	}

	PROGRESS_DONE

exit:
	return er;
}

// 52
ECRESULT UpdateDatabaseCreateCommonProps(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	PROGRESS_INIT(Z_UPDATE_CREATE_COMMON_PROPS)

	strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_hi,val_lo,val_ulong) "
					"SELECT h.id,"+stringify(PROP_ID(PR_CREATION_TIME))+","+stringify(PROP_TYPE(PR_CREATION_TIME))+",(UNIX_TIMESTAMP(h.createtime) * 10000000 + 116444736000000000) >> 32,(UNIX_TIMESTAMP(h.createtime) * 10000000 + 116444736000000000) & 0xffffffff, NULL "
					"FROM hierarchy AS h "
						"WHERE h.type IN (3,5,7)";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
	INTERMEDIATE_PROGRESS_(.25)

	strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_hi,val_lo,val_ulong) "
					"SELECT h.id,"+stringify(PROP_ID(PR_LAST_MODIFICATION_TIME))+","+stringify(PROP_TYPE(PR_LAST_MODIFICATION_TIME))+",(UNIX_TIMESTAMP(h.modtime) * 10000000 + 116444736000000000) >> 32,(UNIX_TIMESTAMP(h.modtime) * 10000000 + 116444736000000000) & 0xffffffff, NULL "
					"FROM hierarchy AS h "
						"WHERE h.type IN (3,5,7)";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
	INTERMEDIATE_PROGRESS_(.5)

	strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_hi,val_lo,val_ulong) "
					"SELECT h.id,"+stringify(PROP_ID(PR_MESSAGE_FLAGS))+","+stringify(PROP_TYPE(PR_MESSAGE_FLAGS))+",NULL, NULL, h.flags "
					"FROM hierarchy AS h "
						"WHERE h.type IN (3,5,7)";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
	INTERMEDIATE_PROGRESS_(.75)

	strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_hi,val_lo,val_ulong) "
					"SELECT h.id,"+stringify(PROP_ID(PR_FOLDER_TYPE))+","+stringify(PROP_TYPE(PR_FOLDER_TYPE))+",NULL, NULL, h.flags & 0x3 "
					"FROM hierarchy AS h "
						"WHERE h.type=3";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
	INTERMEDIATE_PROGRESS_(1)

	PROGRESS_DONE

exit:
	return er;
}

// 53
ECRESULT UpdateDatabaseCheckAttachments(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	PROGRESS_INIT(Z_UPDATE_CHECK_ATTACHMENTS)

	strQuery =	"REPLACE INTO properties(hierarchyid,tag,type,val_ulong) "
					"SELECT h.id,"+stringify(PROP_ID(PR_HASATTACH))+","+stringify(PROP_TYPE(PR_HASATTACH))+",IF(att.id,1,0) "
						"FROM hierarchy AS h "
							"LEFT JOIN hierarchy AS att ON h.id=att.parent AND att.type=7 AND h.type=5 "
					"GROUP BY h.id";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
	INTERMEDIATE_PROGRESS_(.5)

	strQuery =	"UPDATE properties AS p "
					"JOIN hierarchy AS h ON p.hierarchyid=h.id AND h.type=5 "
					"LEFT JOIN hierarchy AS c ON c.type=7 AND c.parent=p.hierarchyid "
				"SET p.val_ulong = IF(c.id,p.val_ulong|"+stringify(MSGFLAG_DELETED)+", p.val_ulong & ~"+stringify(MSGFLAG_DELETED)+") "
				"WHERE p.tag="+stringify(PROP_ID(PR_MESSAGE_FLAGS))+" AND p.type="+stringify(PROP_TYPE(PR_MESSAGE_FLAGS));
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
	INTERMEDIATE_PROGRESS_(1)

	PROGRESS_DONE

exit:
	return er;
}

// 54
ECRESULT UpdateDatabaseCreateTProperties(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

#ifndef HAVE_OFFLINE_SUPPORT 
	// Create the tproperties table
	er = lpDatabase->DoInsert(Z_TABLEDEF_TPROPERTIES);
	if (er != erSuccess)
		goto exit;

	strQuery = 	"INSERT IGNORE INTO tproperties (folderid,hierarchyid,tag,type,val_ulong,val_string,val_binary,val_double,val_longint,val_hi,val_lo) "
					"SELECT h.id, p.hierarchyid, p.tag, p.type, p.val_ulong, LEFT(p.val_string,255), LEFT(p.val_binary,255), p.val_double, p.val_longint, p.val_hi, p.val_lo "
					"FROM properties AS p "
						"JOIN hierarchy AS tmp ON p.hierarchyid = tmp.id AND p.tag NOT IN (" + stringify(PROP_ID(PR_BODY_HTML)) + "," + stringify(PROP_ID(PR_RTF_COMPRESSED)) + ")"
						"LEFT JOIN hierarchy AS h ON tmp.parent = h.id AND h.type = 3";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;
#else
	DB_RESULT lpResult = NULL;
	DB_ROW lpDBRow = NULL;
	unsigned int ulTotal = 0;
	unsigned int ulCurrent = 0;

	PROGRESS_INIT(Z_UPDATE_CREATE_TPROPERTIES)

	// Create the tproperties table
	strQuery = Z_TABLEDEF_TPROPERTIES;
	strQuery.replace(strQuery.find("CREATE TABLE"), strlen("CREATE TABLE"), "CREATE TABLE IF NOT EXISTS");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	strQuery = "SELECT MAX(hierarchyid) FROM properties";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	lpDBRow = lpDatabase->FetchRow(lpResult);
	if (lpDBRow == NULL) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("UpdateDatabaseCreateTProperties(): row non existing");
		goto exit;
	}

	ulTotal = lpDBRow[0] ? atoui(lpDBRow[0]) : 0;
	lpDatabase->FreeResult(lpResult);
	lpResult = NULL;

	while (ulCurrent <= ulTotal) {
		unsigned int ulInserted, ulAffected;

		strQuery = 	"INSERT IGNORE INTO tproperties (folderid,hierarchyid,tag,type,val_ulong,val_string,val_binary,val_double,val_longint,val_hi,val_lo) "
						"SELECT h.id, p.hierarchyid, p.tag, p.type, p.val_ulong, LEFT(p.val_string,255), LEFT(p.val_binary,255), p.val_double, p.val_longint, p.val_hi, p.val_lo "
						"FROM properties AS p "
							"JOIN hierarchy AS tmp ON p.hierarchyid = tmp.id AND p.tag NOT IN (" + stringify(PROP_ID(PR_BODY_HTML)) + "," + stringify(PROP_ID(PR_RTF_COMPRESSED)) + ") "
												 " AND p.hierarchyid >= " + stringify(ulCurrent) + " AND p.hierarchyid < " + stringify(ulCurrent + 500) + " "
							"LEFT JOIN hierarchy AS h ON tmp.parent = h.id AND h.type = 3";
		er = lpDatabase->DoInsert(strQuery, &ulInserted, &ulAffected);
		if (er != erSuccess)
			goto exit;

		ulCurrent += 500;
		INTERMEDIATE_PROGRESS(ulCurrent, ulTotal)
	}

	PROGRESS_DONE
#endif

exit:
#ifdef HAVE_OFFLINE_SUPPORT
	if (lpResult)
		lpDatabase->FreeResult(lpResult);
#endif

	return er;
}

// 55
ECRESULT UpdateDatabaseConvertHierarchy(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	PROGRESS_INIT(Z_UPDATE_CONVERT_HIERARCHY)

	// Create the temporary properties table
	strQuery = Z_TABLEDEF_HIERARCHY;
	strQuery.replace(strQuery.find("hierarchy"), strlen("hierarchy"), "hierarchy_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	// Folders can be 0, 1, 2 and 0x400 (Deleted)
	// Messages can be 0x40 (associated) and Deleted
	// Other can be Deleted
	strQuery = "INSERT INTO hierarchy_temp (id, parent, type, flags, owner) SELECT id, parent, type, CASE type WHEN 3 THEN flags & 0x403 WHEN 5 THEN flags & 0x440 ELSE flags & 0x400 END, owner FROM hierarchy";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("RENAME TABLE hierarchy TO hierarchy_old, hierarchy_temp TO hierarchy");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoDelete("DROP TABLE hierarchy_old");

	PROGRESS_DONE

exit:
	lpDatabase->DoDelete("DROP TABLE IF EXISTS hierarchy_temp");
	
	return er;
}

// 56
ECRESULT UpdateDatabaseCreateDeferred(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	PROGRESS_INIT(Z_UPDATE_CREATE_DEFERRED)

	// Create the deferred table
	er = lpDatabase->DoInsert(Z_TABLEDEF_DELAYEDUPDATE);

	PROGRESS_DONE

#ifdef HAVE_OFFLINE_SUPPORT
exit:
#endif
	return er;
}

// 57
ECRESULT UpdateDatabaseConvertChanges(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;
#ifndef HAVE_OFFLINE_SUPPORT
	bool bDropColumn;
	
	// In some upgrade paths the moved_from column doesn't exist. We'll
	// check so no error (which we could ignore) will be logged.
	er = lpDatabase->CheckExistColumn("changes", "moved_from", &bDropColumn);
	if (er == erSuccess && bDropColumn) {
		strQuery = "ALTER TABLE changes DROP COLUMN moved_from, DROP key moved";
		er = lpDatabase->DoDelete(strQuery);
	}

#else
	DB_RESULT lpResult = NULL;
	DB_ROW lpDBRow = NULL;
	unsigned int ulTotal = 0;
	unsigned int ulCurrent = 0;

	PROGRESS_INIT(Z_UPDATE_CONVERT_CHANGES)

	// Create the temporary properties table
	strQuery = Z_TABLEDEF_CHANGES;
	strQuery.replace(strQuery.find("CREATE TABLE"), strlen("CREATE TABLE"), "CREATE TABLE IF NOT EXISTS");
	strQuery.replace(strQuery.find("changes"), strlen("changes"), "changes_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	strQuery = "SELECT MAX(id) FROM changes";
	er = lpDatabase->DoSelect(strQuery, &lpResult);
	if (er != erSuccess)
		goto exit;

	lpDBRow = lpDatabase->FetchRow(lpResult);
	if (lpDBRow == NULL) {
		er = ZARAFA_E_DATABASE_ERROR;
		ec_log_err("UpdateDatabaseConvertChanges(): row non existing");
		goto exit;
	}

	ulTotal = lpDBRow[0] ? atoui(lpDBRow[0]) : 0;
	lpDatabase->FreeResult(lpResult);
	lpResult = NULL;

	while (true) {
		strQuery = "INSERT INTO changes_temp (id, sourcekey, parentsourcekey, change_type, flags, sourcesync) SELECT id, sourcekey, parentsourcekey, change_type, flags, sourcesync FROM changes ORDER BY id ASC LIMIT 10000";
		er = lpDatabase->DoInsert(strQuery);
		if (er != erSuccess)
			goto exit;

		strQuery = "DELETE FROM changes ORDER BY id ASC LIMIT 10000";
		er = lpDatabase->DoDelete(strQuery);
		if (er != erSuccess)
			goto exit;

		er = lpDatabase->Commit();
		if (er != erSuccess)
			goto exit;

		er = lpDatabase->Begin();
		if (er != erSuccess)
			goto exit;

		strQuery = "SELECT MIN(id) FROM changes";
		er = lpDatabase->DoSelect(strQuery, &lpResult);
		if (er != erSuccess)
			goto exit;

		lpDBRow = lpDatabase->FetchRow(lpResult);
		if (lpDBRow == NULL || lpDBRow[0] == NULL)
			break;

		INTERMEDIATE_PROGRESS(atoui(lpDBRow[0]), ulTotal)
		lpDatabase->FreeResult(lpResult);
		lpResult = NULL;
	}

	er = lpDatabase->DoUpdate("RENAME TABLE changes TO changes_old, changes_temp TO changes");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoDelete("DROP TABLE changes_old");

	PROGRESS_DONE

exit:
	if (lpResult)
		lpDatabase->FreeResult(lpResult);

#endif
	return er;
}

// 58
ECRESULT UpdateDatabaseConvertNames(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	PROGRESS_INIT(Z_UPDATE_CONVERT_NAMES)

	// CharsetDetect(names)

	// Create the temporary names table
	strQuery = Z_TABLEDEF_NAMES;
	strQuery.replace(strQuery.find("names"), strlen("names"), "names_temp");
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	strQuery = "INSERT INTO names_temp (id,nameid,namestring,guid) SELECT id,nameid,CAST(CAST(CONVERT(namestring USING latin1) AS binary) AS CHAR CHARACTER SET utf8),guid FROM names";
	er = lpDatabase->DoInsert(strQuery);
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoUpdate("RENAME TABLE names TO names_old, names_temp TO names");
	if (er != erSuccess)
		goto exit;

	er = lpDatabase->DoDelete("DROP TABLE names_old");

	PROGRESS_DONE

exit:
	lpDatabase->DoDelete("DROP TABLE IF EXISTS names_temp");
	
	return er;
}

// 59
ECRESULT UpdateDatabaseReceiveFolderToUnicode(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	strQuery = "ALTER TABLE receivefolder MODIFY messageclass varchar(255) CHARSET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT''";
	
	er = lpDatabase->DoUpdate(strQuery);

	return er;
}

// 60
ECRESULT UpdateDatabaseClientUpdateStatus(ECDatabase *lpDatabase)
{
	return lpDatabase->DoInsert(Z_TABLEDEF_CLIENTUPDATESTATUS);
}

// 61
ECRESULT UpdateDatabaseConvertStores(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;

	// user_hierarchy_id does not exist on all servers, depends on upgrade path
	strQuery = "ALTER TABLE stores "
					"DROP KEY `user_hierarchy_id` ";
	er = lpDatabase->DoUpdate(strQuery);
	if (er != erSuccess) {
		ec_log_err("Ignoring optional index error, and continuing database upgrade");
		er = erSuccess;
	}

	strQuery = "ALTER TABLE stores "
					"DROP PRIMARY KEY, "
					"ADD COLUMN `type` smallint(6) unsigned NOT NULL default '0', "
					"ADD PRIMARY KEY (`user_id`, `hierarchy_id`, `type`), "
					"ADD UNIQUE KEY `id` (`id`)";
	er = lpDatabase->DoUpdate(strQuery);

	return er;
}

// 62
ECRESULT UpdateDatabaseUpdateStores(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;
	
	strQuery = "UPDATE stores SET type="+stringify(ECSTORE_TYPE_PUBLIC)+" WHERE user_id=1 OR user_id IN (SELECT id FROM users where objectclass="+stringify(CONTAINER_COMPANY)+")";
	er = lpDatabase->DoUpdate(strQuery);

	return er;
}

// 63
ECRESULT UpdateWLinkRecordKeys(ECDatabase *lpDatabase)
{
	ECRESULT er = erSuccess;
	std::string strQuery;
	
	strQuery = "update stores "	// For each store
				"join properties as p1 on p1.tag = 0x35E6 and p1.hierarchyid=stores.hierarchy_id " // Get PR_COMMON_VIEWS_ENTRYID
				"join indexedproperties as i1 on i1.val_binary = p1.val_binary and i1.tag=0xfff " // Get hierarchy for common views
				"join hierarchy as h2 on h2.parent=i1.hierarchyid " // Get children of common views
				"join properties as p2 on p2.hierarchyid=h2.id and p2.tag=0x684d " // Get PR_WLINK_RECKEY for each child
				"join properties as p3 on p3.hierarchyid=h2.id and p3.tag=0x684c " // Get PR_WLINK_ENTRYID for each child
				"set p2.val_binary = p3.val_binary "								// Set PR_WLINK_RECKEY = PR_WLINK_ENTRYID
				"where length(p3.val_binary) = 48";									// Where entryid length is 48 (zarafa)
	er = lpDatabase->DoUpdate(strQuery);

	return er;
}

/* Edit no. 64 */
ECRESULT UpdateVersionsTbl(ECDatabase *db)
{
	return db->DoUpdate(
		"alter table `versions` "
		"add column `micro` int(11) unsigned not null default 0 after `minor`, "
		"drop primary key, "
		"add primary key (`major`, `minor`, `micro`, `revision`, `databaserevision`)");
}

/* Edit no. 65 */
ECRESULT UpdateChangesTbl(ECDatabase *db)
{
	return db->DoUpdate(
		"alter table `changes` "
		"modify change_type int(11) unsigned not null default 0");
}

/* Edit no. 66 */
ECRESULT UpdateABChangesTbl(ECDatabase *db)
{
	return db->DoUpdate(
		"alter table `abchanges` "
		"modify change_type int(11) unsigned not null default 0");
}
