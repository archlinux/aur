set(CRCPP_FOUND FALSE)
find_path(CRCPP_INCLUDE_DIR
  NAMES CRC.h
  PATHS /usr/include /usr/local/include
  NO_DEFAULT_PATH
)

if(CRCPP_INCLUDE_DIR)
  set(CRCPP_FOUND TRUE)
  set(CRCPP_INCLUDE_DIRS ${CRCPP_INCLUDE_DIR})
endif()

set(CRCPP_LIBRARIES "")
set(CRCPP_VERSION "1.0.0")
mark_as_advanced(CRCPP_INCLUDE_DIR CRCPP_LIBRARIES CRCPP_VERSION)

if(NOT CRCPP_FOUND)
  message(FATAL_ERROR "CRCpp not found")
endif()

if(NOT TARGET crcpp::crcpp)
  add_library(crcpp::crcpp INTERFACE IMPORTED)
  set_target_properties(crcpp::crcpp PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CRCPP_INCLUDE_DIRS}"
  )
endif()
