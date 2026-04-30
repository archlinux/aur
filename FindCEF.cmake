include(FindPackageHandleStandardArgs)

find_path(CEF_INCLUDE_DIR "include/cef_version.h" HINTS /usr/include/cef)

find_library(
		CEF_LIBRARY
		NAMES libcef.so "Chromium Embedded Framework"
		NO_DEFAULT_PATH
		PATHS /usr/lib/cef)

find_path(CEF_WRAPPER_SRC_DIR "libcef_dll/CMakeLists.txt" HINTS /usr/src/cef)

if(NOT CEF_INCLUDE_DIR)
	message(WARNING "Could NOT find Chromium Embedded Framework library (missing: CEF_INCLUDE_DIR)")
	set(CEF_FOUND FALSE)
	return()
endif()

if(NOT CEF_LIBRARY)
	message(WARNING "Could NOT find Chromium Embedded Framework library (missing: CEF_LIBRARY)")
	set(CEF_FOUND FALSE)
	return()
endif()
if(NOT CEF_WRAPPER_SRC_DIR)
	message(WARNING "Could NOT find Chromium Embedded Framework library (missing: CEF_WRAPPER_SRC_DIR)")
	set(CEF_FOUND FALSE)
	return()
endif()

if(NOT CEF_API_VERSION)
	set(CEF_API_VERSION CEF_API_VERSION_EXPERIMENTAL CACHE STRING "CEF API version")
endif()

list(APPEND CEF_COMPILER_FLAGS
		-fno-strict-aliasing            # Avoid assumptions regarding non-aliasing of objects of different types
		-fstack-protector               # Protect some vulnerable functions from stack-smashing (security feature)
		-funwind-tables                 # Support stack unwinding for backtrace()
		-fvisibility=hidden             # Give hidden visibility to declarations that are not explicitly marked as visible
		--param=ssp-buffer-size=4       # Set the minimum buffer size protected by SSP (security feature, related to stack-protector)
		-Wall                           # Enable all warnings
		-Werror                         # Treat warnings as errors
		-Wno-missing-field-initializers # Don't warn about missing field initializers
		-Wno-unused-parameter           # Don't warn about unused parameters
		-Wno-error=comment              # Don't warn about code in comments
		-Wno-comment                    # Don't warn about code in comments
		-Wno-deprecated-declarations    # Don't warn about using deprecated methods
		-Wno-extra                      # Don't warn about base class initialization
		)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
	list(APPEND CEF_CXX_COMPILER_FLAGS
				-Wno-attributes             # The cfi-icall attribute is not supported by the GNU C++ compiler
				-Wno-array-bounds           # Silence "is partly outside array bounds" errors with runtime size check in wrapper
				-Wno-stringop-overflow      # Silence "overflows the destination" errors with runtime size check in wrapper
				)
endif()

if(CEF_INCLUDE_DIR)
	file(
				STRINGS
				"${CEF_INCLUDE_DIR}/include/cef_version.h"
				_VERSION_STRING
				REGEX "^.*CEF_VERSION_(MAJOR|MINOR|PATCH)[ \t]+[0-9]+[ \t]*$"
		)
	string(REGEX REPLACE ".*CEF_VERSION_MAJOR[ \t]+([0-9]+).*" "\\1" CEF_VERSION_MAJOR "${_VERSION_STRING}")
	string(REGEX REPLACE ".*CEF_VERSION_MINOR[ \t]+([0-9]+).*" "\\1" CEF_VERSION_MINOR "${_VERSION_STRING}")
	string(REGEX REPLACE ".*CEF_VERSION_PATCH[ \t]+([0-9]+).*" "\\1" CEF_VERSION_PATCH "${_VERSION_STRING}")
	set(CEF_VERSION "${CEF_VERSION_MAJOR}.${CEF_VERSION_MINOR}.${CEF_VERSION_PATCH}")
else()
	if(NOT CEF_FIND_QUIETLY)
		message(AUTHOR_WARNING "Failed to find Chromium Embedded Framework version.")
	endif()
	set(CEF_VERSION 0.0.0)
endif()

macro(SET_LIBRARY_TARGET_PROPERTIES target)
	target_include_directories(${target} PUBLIC ${CEF_INCLUDE_DIR})
	target_include_directories(${target} PRIVATE ${CEF_WRAPPER_SRC_DIR})
	target_compile_options(${target} PRIVATE ${CEF_COMPILER_FLAGS} ${CEF_CXX_COMPILER_FLAGS})
	target_compile_options(${target} PUBLIC "-DCEF_API_VERSION=${CEF_API_VERSION}")
	target_compile_features(${target} PRIVATE cxx_std_20)
	set_property(TARGET ${target} PROPERTY POSITION_INDEPENDENT_CODE ON)
endmacro()

add_subdirectory(${CEF_WRAPPER_SRC_DIR}/libcef_dll libcef_dll_wrapper)
add_library(CEF::Wrapper ALIAS libcef_dll_wrapper)

message(STATUS "Found Chromium Embedded Framework: ${CEF_LIBRARY};${CEF_INCLUDE_DIR};${CEF_WRAPPER_SRC_DIR} (${CEF_VERSION})")

set(CEF_LIBRARIES CEF::Wrapper CEF::Library)
set(CEF_INCLUDE_DIRS ${CEF_INCLUDE_DIR})

if(IS_ABSOLUTE "${CEF_LIBRARY}")
	add_library(CEF::Library UNKNOWN IMPORTED)
	set_target_properties(CEF::Library PROPERTIES IMPORTED_LOCATION ${CEF_LIBRARY})
else()
	add_library(CEF::Library INTERFACE IMPORTED)
	set_target_properties(CEF::Library PROPERTIES IMPORTED_LIBNAME ${CEF_LIBRARY})
endif()

set_target_properties(CEF::Library PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${CEF_INCLUDE_DIR}")

find_package_handle_standard_args(CEF
		REQUIRED_VARS CEF_LIBRARY CEF_INCLUDE_DIR CEF_WRAPPER_SRC_DIR
		VERSION_VAR CEF_VERSION
)


