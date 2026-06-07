cmake_minimum_required(VERSION 3.16)
project(Lindora VERSION 1.0 LANGUAGES CXX)

# Ensure C++17 support
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find the necessary Qt6 modules (Added Svg)
find_package(Qt6 REQUIRED COMPONENTS 
    Core 
    Widgets 
    WebEngineWidgets
    Svg
)

# Define your executable
add_executable(lindora-native main.cpp)

# Link the Qt libraries (Added Qt6::Svg)
target_link_libraries(lindora-native PRIVATE 
    Qt6::Core 
    Qt6::Widgets 
    Qt6::WebEngineWidgets
    Qt6::Svg
)

# Optional: Add compiler definitions
target_compile_definitions(lindora-native PRIVATE 
    QT_DEPRECATED_WARNINGS
)

install(TARGETS lindora-native DESTINATION bin)
install(FILES Lindora.svg DESTINATION share/icons/hicolor/scalable/apps)
install(FILES lindora-native.desktop DESTINATION share/applications)
