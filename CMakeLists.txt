cmake_minimum_required(VERSION 2.8)
project(ttyvideo)
find_package(OpenCV REQUIRED)

if(MSVC)
	# Visual Studio -- /W4
	if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
		string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
	else()
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
	endif()
elseif(CMAKE_COMPILER_IS_GNUXX OR CMAKE_COMPILER_IS_GNUCC)
	# GCC -- -Wall -pedantic
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -pedantic")
endif()

add_library(handle STATIC handle.c)
add_executable(ttyvideo ttyvideo.cpp)
target_link_libraries(ttyvideo ${OpenCV_LIBS} -lm handle)

install(TARGETS ttyvideo DESTINATION bin)
