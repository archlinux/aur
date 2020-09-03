cmake_minimum_required(VERSION 3.15)
project(pnghide VERSION 0.2.2 LANGUAGES CXX)

find_package(PNG REQUIRED)

add_definitions(-DPROJECT_VERSION="${PROJECT_VERSION}")

add_executable(pnghide pnghide.cc)

target_link_libraries(pnghide PRIVATE PNG::PNG docopt)
