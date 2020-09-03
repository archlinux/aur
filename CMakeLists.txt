cmake_minimum_required(VERSION 3.15)
project(aes VERSION 0.2.0 LANGUAGES CXX)

add_definitions(-DPROJECT_VERSION="${PROJECT_VERSION}")

add_executable(aes aes.cc)
target_link_libraries(aes gcrypt docopt)
