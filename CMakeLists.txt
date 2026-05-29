cmake_minimum_required(VERSION 3.15)
project(smosummary LANGUAGES CXX)

# Force the modern C++20 engine 
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Tell CMake to build your binary from main.cpp
add_executable(smosummary main.cpp)

# Inject aggressive optimizations (-O3) for maximum speedrunning precision!
target_compile_options(smosummary PRIVATE -O3)
