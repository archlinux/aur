cmake_minimum_required(VERSION 2.6)

project(TinyXml)


include_directories(./)

file(
  GLOB_RECURSE
  source_files
  *.h
  tiny*.cpp
)

add_library(tinyxml ${source_files}
)

#SET_TARGET_PROPERTIES (tinyxml PROPERTIES DEFINE_SYMBOL  "EXPORT" )

INSTALL( FILES tinyxml.h tinystr.h DESTINATION include )

INSTALL( TARGETS tinyxml RUNTIME DESTINATION bin
                         LIBRARY DESTINATION lib${LIB_SUFFIX}
                         ARCHIVE DESTINATION lib${LIB_SUFFIX} )