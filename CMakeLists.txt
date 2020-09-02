cmake_minimum_required(VERSION 3.15)
project(pnghide VERSION 0.1.0 LANGUAGES CXX)

find_package(PNG REQUIRED)

add_executable(pnghide pnghide.cc)
add_executable(pngunhide pngunhide.cc)

target_link_libraries(pnghide PRIVATE PNG::PNG)
target_link_libraries(pngunhide PRIVATE PNG::PNG)
