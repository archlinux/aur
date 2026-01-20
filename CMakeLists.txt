cmake_minimum_required(VERSION 3.16)
project(bbfmux)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Threads REQUIRED)

add_executable(bbfmux
    src/bbfenc.cpp
    src/libbbf.cpp
    src/xxhash.c
)

target_link_libraries(bbfmux PRIVATE Threads::Threads)

install(TARGETS bbfmux DESTINATION bin)
