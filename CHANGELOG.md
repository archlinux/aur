## 0.7.0

* py-sonic should now python 2/3 compatible.  Unfortunately, this adds the requirement of the "six" module for this compatibility.  Please file a bug if you run into issues with either python 2 or 3.
* Cut over to setuptools from disttools for pip requirement support

## 0.6.2

* Added an option to use GET requests, instead of the default POST requests

## 0.6.1

* Added `legacyAuth` option for pre-1.13.0 support

## 0.6.0

* Added API 1.14.0 support

## 0.5.1

* Added the ability to use a netrc file for credentials

## 0.5.0

* Added support for using credentials via a netrc file

## 0.4.1

* Fixed SSL handling issues

## 0.4.0

* Added missing 1.12.0 API items
* Added 1.13.0 API items
* All timestamps both passed in, and returned, should now be in **proper** unix time, which is seconds since the epoch, **not** milliseconds since the epoch

## 0.3.5

* allow for self-signed certs

## 0.3.4

* Add missing parameters to getAlbumList2 (thanks to basilfx)
* Remove trailing whitespace (thanks to basilfx)

## 0.3.3

* Added support for API version 1.11.0
* Added a couple of additions from API version 1.10.x that were previously 
  missed

## 0.3.1

*  Incorporated unofficial API calls (beallio)

## 0.2.1

*  Added a patch to force SSLv3 as some users were apparently having issues
   with the 4.7 release of Subsonic and SSL.  (thanks to orangepeelbeef)

## 0.2.0

*  Added support for API version 1.8.0 (Subsonic verion 4.7)
