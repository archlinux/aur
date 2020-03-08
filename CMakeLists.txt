cmake_minimum_required(VERSION 3.11)
project(slitherling)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} /usr/share/SFML/cmake/Modules/)
find_package(SFML REQUIRED COMPONENTS system graphics window)

set(EXECUTABLE_NAME "slitherling")
add_compile_options(-std=c++17 -Wall -Wextra -pedantic -Werror)
include_directories(${SFML_INCLUDE_DIRS} ${SFMLsystem_INCLUDE_DIRS} ${SFMLwindow_INCLUDE_DIRS} ${SFMLgraphics_INCLUDE_DIRS} src/main/headers/)
add_executable(${EXECUTABLE_NAME})
target_sources(${EXECUTABLE_NAME} PRIVATE
src/main/cpp/info-board.cpp
src/main/cpp/version-provider.cpp
src/main/cpp/path-finder.cpp
src/main/cpp/slitherling.cpp
src/main/cpp/apple-texture.cpp
src/main/cpp/gulp-sound.cpp
src/main/cpp/infect-sound.cpp
src/main/cpp/spawn-sound.cpp
src/main/cpp/cycle-time.cpp
src/main/cpp/font-provider.cpp
)
target_link_libraries(${EXECUTABLE_NAME} sfml-graphics sfml-audio ${SFML_LIBRARIES})
