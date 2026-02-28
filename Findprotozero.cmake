#----------------------------------------------------------------------
#
#  FindProtozero.cmake
#
#  Find the protozero headers.
#
#----------------------------------------------------------------------
#
#  Usage:
#
#    Copy this file somewhere into your project directory, where cmake can
#    find it. Usually this will be a directory called "cmake" which you can
#    add to the CMake module search path with the following line in your
#    CMakeLists.txt:
#
#      list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
#
#    Then add the following in your CMakeLists.txt:
#
#      find_package(Protozero [version] [REQUIRED])
#      include_directories(SYSTEM ${PROTOZERO_INCLUDE_DIR})
#
#    The version number is optional. If it is not set, any version of
#    protozero will do.
#
#      if(NOT PROTOZERO_FOUND)
#          message(WARNING "Protozero not found!\n")
#      endif()
#
#----------------------------------------------------------------------
#
#  Variables:
#
#    PROTOZERO_FOUND        - True if Protozero was found.
#    PROTOZERO_INCLUDE_DIR  - Where to find include files.
#
#----------------------------------------------------------------------

# find include path
find_path(PROTOZERO_INCLUDE_DIR protozero/version.hpp
    PATH_SUFFIXES include
    PATHS ${CMAKE_SOURCE_DIR}/../protozero
)

# Check version number
if(protozero_FIND_VERSION)
    file(STRINGS "${PROTOZERO_INCLUDE_DIR}/protozero/version.hpp" _version_define REGEX "#define PROTOZERO_VERSION_STRING")
    if("${_version_define}" MATCHES "#define PROTOZERO_VERSION_STRING \"([0-9.]+)\"")
        set(_version "${CMAKE_MATCH_1}")
    else()
        set(_version "unknown")
    endif()
endif()

#set(PROTOZERO_INCLUDE_DIRS "${PROTOZERO_INCLUDE_DIR}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(protozero
                                  REQUIRED_VARS PROTOZERO_INCLUDE_DIR
                                  VERSION_VAR _version)


if(protozero_FOUND)
  if(NOT TARGET protozero::protozero)
    add_library(protozero INTERFACE EXCLUDE_FROM_ALL)
    target_include_directories(protozero INTERFACE 
      $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/protozero/include>
    )
    add_library(protozero::protozero ALIAS protozero)
  endif()
endif()

#----------------------------------------------------------------------
