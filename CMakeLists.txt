cmake_minimum_required(VERSION 3.16)

project(QCustomPlot VERSION 2.1.1)

find_package(Qt6 COMPONENTS Widgets PrintSupport REQUIRED)

include(GNUInstallDirs)

set(CMAKE_AUTOMOC ON)

add_library(qcustomplot-qt6 SHARED
            qcustomplot.cpp)

set_target_properties(qcustomplot-qt6 PROPERTIES
                      VERSION ${PROJECT_VERSION}
                      SOVERSION ${PROJECT_VERSION_MAJOR})

target_compile_definitions(qcustomplot-qt6 PRIVATE QCUSTOMPLOT_COMPILE_LIBRARY)

target_link_libraries(qcustomplot-qt6 PUBLIC
                      Qt::Widgets Qt::PrintSupport)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/QCustomPlotQt6ConfigVersion.cmake
                                 VERSION ${PROJECT_VERSION}
                                 COMPATIBILITY AnyNewerVersion)

set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
set(QCUSTOMPLOT_LIB QCustomPlotQt6::qcustomplot-qt6)
configure_package_config_file(QCustomPlotQt6Config.cmake.in
                              ${CMAKE_CURRENT_BINARY_DIR}/QCustomPlotQt6Config.cmake
                              INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/QCustomPlotQt6
                              PATH_VARS INCLUDE_INSTALL_DIR LIB_INSTALL_DIR)

install(TARGETS qcustomplot-qt6
        EXPORT QCustomPlotQt6Targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

install(EXPORT QCustomPlotQt6Targets
        FILE QCustomPlotQt6Targets.cmake
        NAMESPACE QCustomPlotQt6::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/QCustomPlotQt6)

install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/QCustomPlotQt6Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/QCustomPlotQt6ConfigVersion.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/QCustomPlotQt6)

install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/changelog.txt
        DESTINATION ${CMAKE_INSTALL_DATADIR}/doc/qcustomplot-qt6)
