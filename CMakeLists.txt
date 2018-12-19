# target_compile_features has been introduced in that version
cmake_minimum_required (VERSION 3.1.0)

project (sdn CXX)
set (version 0.1)

if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU")
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic")
endif ()

# Since we use a language with slow compilers, let's at least use a fast linker
execute_process (COMMAND ${CMAKE_CXX_COMPILER} -fuse-ld=gold -Wl,--version
	ERROR_QUIET OUTPUT_VARIABLE ld_version)
if ("${ld_version}" MATCHES "GNU gold")
	set (CMAKE_EXE_LINKER_FLAGS "-fuse-ld=gold ${CMAKE_EXE_LINKER_FLAGS}")
endif ()

find_package (PkgConfig REQUIRED)
pkg_check_modules (NCURSESW QUIET ncursesw)

add_executable (${PROJECT_NAME} ${PROJECT_NAME}.cpp)
target_include_directories (${PROJECT_NAME} PUBLIC ${NCURSESW_INCLUDE_DIRS})
target_link_libraries (${PROJECT_NAME} PUBLIC ${NCURSESW_LIBRARIES} acl)
target_compile_features (${PROJECT_NAME} PUBLIC cxx_std_14)
target_compile_definitions (${PROJECT_NAME} PUBLIC
	-DPROJECT_NAME=\"${PROJECT_NAME}\" -DPROJECT_VERSION=\"${version}\")

include (GNUInstallDirs)
install (TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR})
install (FILES LICENSE DESTINATION ${CMAKE_INSTALL_DOCDIR})

set (CPACK_PACKAGE_DESCRIPTION_SUMMARY "Directory navigator")
set (CPACK_PACKAGE_VENDOR "Premysl Janouch")
set (CPACK_PACKAGE_CONTACT "Přemysl Janouch <p@janouch.name>")
set (CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")
set (CPACK_PACKAGE_VERSION ${version})
set (CPACK_GENERATOR "TGZ;ZIP")
set (CPACK_PACKAGE_FILE_NAME
	"${PROJECT_NAME}-${version}-${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
set (CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}-${version}")
set (CPACK_SOURCE_GENERATOR "TGZ;ZIP")
set (CPACK_SOURCE_IGNORE_FILES "/\\\\.git;/build;/CMakeLists.txt.user")
set (CPACK_SOURCE_PACKAGE_FILE_NAME "${PROJECT_NAME}-${version}")

set (CPACK_SET_DESTDIR TRUE)
include (CPack)
