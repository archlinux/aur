cmake_minimum_required(VERSION 3.15)
project(smosummary LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(smosummary main.cpp)

target_compile_options(smosummary PRIVATE -O3)
