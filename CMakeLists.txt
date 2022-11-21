cmake_minimum_required(VERSION 3.25)

project (XPwn)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fcommon")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcommon")

# We want win32 executables to build staticly by default, since it's more difficult to keep the shared libraries straight on Windows
IF(WIN32)
	SET(BUILD_STATIC ON CACHE BOOL "Force compilation with static libraries")
ELSE(WIN32)
	SET(BUILD_STATIC OFF CACHE BOOL "Force compilation with static libraries")
ENDIF(WIN32)

IF(BUILD_STATIC)
	SET(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
ENDIF(BUILD_STATIC)

include_directories (${PROJECT_SOURCE_DIR}/includes)

add_subdirectory (common)
add_subdirectory (minizip)
add_subdirectory (dmg)
add_subdirectory (hdutil)
add_subdirectory (hfs)
add_subdirectory (ipsw-patch)
add_subdirectory (dfu-util)
add_subdirectory (xpwn)
add_subdirectory (idevice)

install(FILES README.markdown DESTINATION . RENAME README.txt)
install(FILES LICENSE DESTINATION . RENAME LICENSE.txt)

IF(WIN32 OR APPLE)
	SET(CPACK_GENERATOR "ZIP")
ELSE(WIN32 OR APPLE)
	SET(CPACK_GENERATOR "TBZ2")
ENDIF(WIN32 OR APPLE)

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "XPwn")
SET(CPACK_PACKAGE_VENDOR "iPhone Dev Team")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${PROJECT_SOURCE_DIR}/README.markdown")
SET(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README.markdown")
SET(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")
SET(CPACK_PACKAGE_VERSION_MAJOR "0")
SET(CPACK_PACKAGE_VERSION_MINOR "5")
SET(CPACK_PACKAGE_VERSION_PATCH "8")
SET(CPACK_PACKAGE_EXECUTABLES "xpwn" "XPwn Pwner")
SET(CPACK_PACKAGE_EXECUTABLES "ipsw" "IPSW Tool")
SET(CPACK_PACKAGE_EXECUTABLES "hdutil" "Apple disk image utility")
SET(CPACK_PACKAGE_EXECUTABLES "dmg" "Apple DMG utility")
SET(CPACK_PACKAGE_EXECUTABLES "hfsplus" "Apple HFS+ utility")
INCLUDE(CPack)

