cmake_minimum_required(VERSION 3.3.2)
project(hello_world CXX)
find_package(HPX REQUIRED)
add_hpx_executable(hello_world
  SOURCES main.cpp
  COMPONENT_DEPENDENCIES iostreams)
