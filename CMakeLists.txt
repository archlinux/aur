cmake_minimum_required(VERSION 3.20)
project(typeless_linux_helpers LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(Threads REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(X11 REQUIRED IMPORTED_TARGET x11 xtst xi)
pkg_check_modules(ATSPI REQUIRED IMPORTED_TARGET atspi-2)
pkg_check_modules(OPUS REQUIRED IMPORTED_TARGET opus)
pkg_check_modules(OGG REQUIRED IMPORTED_TARGET ogg)

add_library(typeless_helper SHARED typeless_helper.cpp)
target_link_libraries(typeless_helper PRIVATE Threads::Threads PkgConfig::X11 PkgConfig::ATSPI)
target_compile_options(typeless_helper PRIVATE -Wall -Wextra -Wpedantic)

add_library(typeless_opusenc SHARED opus_helper.cpp)
target_link_libraries(typeless_opusenc PRIVATE PkgConfig::OPUS PkgConfig::OGG)
target_compile_options(typeless_opusenc PRIVATE -Wall -Wextra -Wpedantic)

set_target_properties(typeless_helper PROPERTIES OUTPUT_NAME typeless_helper)
set_target_properties(typeless_opusenc PROPERTIES OUTPUT_NAME opusenc)
