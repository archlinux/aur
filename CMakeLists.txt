project(curlcpp)
cmake_minimum_required(VERSION 2.8)

set(PROJECT_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(COMMON_SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)

include_directories("${PROJECT_INCLUDE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}")
include_directories("${COMMON_SOURCE_DIR}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

file(GLOB HEADERS ${PROJECT_INCLUDE_DIR}/*.h)

file(GLOB SOURCES ${COMMON_SOURCE_DIR}/*.cpp)

add_library(curlcpp SHARED ${SOURCES} ${HEADERS})
target_link_libraries(curlcpp curl)

install(TARGETS curlcpp LIBRARY DESTINATION lib)
