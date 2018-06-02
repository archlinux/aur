cmake_minimum_required(VERSION 3.1.0)

project(openmesh)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_library (OPENMESH_CORE_LIBRARY NAMES OpenMeshCore OpenMeshCoreStatic)
find_library (OPENMESH_TOOLS_LIBRARY NAMES OpenMeshTools OpenMeshToolsStatic)

find_package (pybind11 NO_MODULE REQUIRED)

file (GLOB HEADERS "src/*.hh")
file (GLOB SOURCES "src/*.cc")

include_directories(${OPENMESH_INCLUDE_DIRS})
pybind11_add_module(openmesh ${HEADERS} ${SOURCES})

if (WIN32)
	target_compile_definitions(openmesh PRIVATE _USE_MATH_DEFINES)
endif ()
target_link_libraries(openmesh PRIVATE ${OPENMESH_CORE_LIBRARY})
target_link_libraries(openmesh PRIVATE ${OPENMESH_TOOLS_LIBRARY})

if (NOT DEFINED PYTHON_SITE_PACKAGES)
  set (PYTHON_SITE_PACKAGES site-packages)
endif ()

install (TARGETS openmesh DESTINATION ${PYTHON_SITE_PACKAGES})

enable_testing()
add_test(
	NAME discover_tests
	COMMAND ${PYTHON_EXECUTABLE} -m unittest discover --failfast
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/tests
)
set_tests_properties(
	discover_tests PROPERTIES
	ENVIRONMENT PYTHONPATH=${CMAKE_CURRENT_BINARY_DIR}
)
