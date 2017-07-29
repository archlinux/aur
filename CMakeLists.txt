cmake_minimum_required(VERSION 2.6)
project(unarr C)

#Set up api and release version for later use.
#Increase in major api version indicates api
#breakage!! For non-breaking changes, use
#minor api version instead.
set (UNARR_API_VERSION_MAJOR 1)
set (UNARR_API_VERSION_MINOR 0)

#set build type to default if unset
if( NOT CMAKE_BUILD_TYPE )
  set( CMAKE_BUILD_TYPE Release CACHE STRING
       "Choose the type of build, options are: None Debug Release RelWithDebInfo
MinSizeRel."
       FORCE )
endif()

find_package(ZLIB)
find_package(BZip2)

if (UNIX OR MINGW)
    add_compile_options(-fomit-frame-pointer -D_FILE_OFFSET_BITS=64)
endif (UNIX OR MINGW)

if(CMAKE_BUILD_TOOL MATCHES "(make)")
    add_definitions(-Wall -pedantic)
endif()

#sources

set (HEADERS 	common/allocator.h
			common/unarr-imp.h
			rar/rar.h
			rar/lzss.h
			rar/rarvm.h
			lzmasdk/LzmaDec.h
			lzmasdk/Ppmd7.h
			lzmasdk/CpuArch.h
			lzmasdk/Ppmd.h
			lzmasdk/7zTypes.h
			lzmasdk/Ppmd8.h
			lzmasdk/Precomp.h
			_7z/_7z.h
			zip/zip.h
			zip/inflate.h
			tar/tar.h)

set (SOURCES	rar/uncompress-rar.c
			rar/huffman-rar.c
			rar/rar.c
			rar/filter-rar.c
			rar/rarvm.c
			rar/parse-rar.c
			_7z/_7z.c
			zip/zip.c
			zip/inflate.c
			zip/parse-zip.c
			zip/uncompress-zip.c
			tar/tar.c
			tar/parse-tar.c
			lzmasdk/Ppmd7.c
			lzmasdk/Ppmd8.c
			lzmasdk/CpuArch.c
			lzmasdk/LzmaDec.c
			lzmasdk/Ppmd7Dec.c
			lzmasdk/Ppmd8Dec.c
			common/custalloc.c
			common/unarr.c
			common/stream.c
			common/conv.c
			common/crc32.c
			)

#build targets

add_library(unarr SHARED unarr.h ${HEADERS} ${SOURCES})
add_library(unarr_static STATIC unarr.h ${HEADERS} ${SOURCES})
set_target_properties(unarr PROPERTIES VERSION ${UNARR_API_VERSION_MAJOR}.${UNARR_API_VERSION_MINOR} SOVERSION ${UNARR_API_VERSION_MAJOR})
set_target_properties(unarr_static PROPERTIES OUTPUT_NAME unarr VERSION ${UNARR_API_VERSION_MAJOR}.${UNARR_API_VERSION_MINOR} SOVERSION ${UNARR_API_VERSION_MAJOR})

#library detection macros

if (ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(unarr ${ZLIB_LIBRARIES})
    target_link_libraries(unarr_static ${ZLIB_LIBRARIES})
    add_definitions(-DHAVE_ZLIB)
endif(ZLIB_FOUND)

if (BZIP2_FOUND)
    include_directories(${BZIP_INCLUDE_DIRS})
    target_link_libraries (unarr ${BZIP2_LIBRARIES})
    target_link_libraries (unarr_static ${BZIP2_LIBRARIES})
    add_definitions(-DHAVE_BZIP2)
endif (BZIP2_FOUND)

#make install targets

install(TARGETS unarr DESTINATION lib)
install(TARGETS unarr_static DESTINATION lib)
install(FILES unarr.h DESTINATION include)