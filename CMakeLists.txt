cmake_minimum_required(VERSION 3.11)
project(slitherling)
include(CTest)

add_subdirectory(src/main)

if(BUILD_TESTING)
add_subdirectory(src/test)
endif()
