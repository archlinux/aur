# taken from https://github.com/wjwwood/serial/issues/52#issuecomment-28848337
cmake_minimum_required(VERSION 2.8.3)
project(my_project)

include_directories(include)

set(serial_SRCS src/serial.cc include/serial/serial.h include/serial/v8stdint.h)
if(UNIX)
    list(APPEND serial_SRCS src/impl/unix.cc)
else()
    list(APPEND serial_SRCS src/impl/win.cc)
endif()

## Add serial library
add_library(serial SHARED ${serial_SRCS})
if(UNIX AND NOT APPLE)
    target_link_libraries(serial rt)
endif()

## Build your executable
#add_executable(my_program src/my_program.cpp)
## Link your executable against the library
#target_link_libraries(my_program serial)

install(TARGETS serial DESTINATION lib)
install(FILES include/serial/serial.h DESTINATION include/serial)
install(FILES include/serial/v8stdint.h DESTINATION include/serial)
