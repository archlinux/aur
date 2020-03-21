cmake_minimum_required(VERSION 3.11)
project(slitherling)
set(CMAKE_EXPORT_COMPILE_COMMANDS true)
include(CTest)

add_compile_options(-std=c++17 -Wall -Wextra -pedantic -Werror)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH};/usr/share/SFML/cmake/Modules/)
find_package(SFML REQUIRED COMPONENTS system graphics window audio)

add_subdirectory(src/main/resources)
add_subdirectory(src/main)

if(BUILD_TESTING)
add_subdirectory(src/test)
endif()
