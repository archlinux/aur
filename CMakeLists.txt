
cmake_minimum_required (VERSION 2.8.9)
project (Csdp C)

option (BUILD_SHARED_LIBS "Build shared libraries instead of static." ON)

find_package(LAPACK REQUIRED)


file(GLOB csdp_srcs "lib/*.c")

include_directories(${PROJECT_SOURCE_DIR}/include)

add_library (libcsdp ${csdp_srcs})
set_target_properties(libcsdp PROPERTIES OUTPUT_NAME csdp)
target_link_libraries(libcsdp PRIVATE ${LAPACK_LIBRARIES})
install(TARGETS libcsdp
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin)

add_executable(csdp solver/csdp.c)
target_link_libraries(csdp libcsdp)
install(TARGETS csdp DESTINATION bin)

add_executable(theta theta/theta.c)
target_link_libraries(theta libcsdp)
install(TARGETS theta DESTINATION bin)

add_executable(graphtoprob theta/graphtoprob.c)
target_link_libraries(graphtoprob libcsdp)
install(TARGETS graphtoprob DESTINATION bin)

add_executable(complement theta/complement.c)
target_link_libraries(complement libcsdp)
install(TARGETS complement DESTINATION bin)

add_executable(rand_graph theta/rand_graph.c)
target_link_libraries(rand_graph libcsdp)
install(TARGETS rand_graph DESTINATION bin)

enable_testing()
add_test (NAME theta1 COMMAND csdp ${PROJECT_SOURCE_DIR}/test/theta1.dat-s)
add_test (NAME g50 COMMAND theta ${PROJECT_SOURCE_DIR}/test/g50)
