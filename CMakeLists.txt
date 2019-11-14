cmake_minimum_required(VERSION 3.10)

project(lsynth)

set(CMAKE_C_STANDARD 90)
set(CMAKE_C_STANDARD_REQUIRED True)

set(CMAKE_INSTALL_MESSAGE NEVER)

set(LSYNTH_SRC "${PROJECT_SOURCE_DIR}/src/lsynthcp.c"
               "${PROJECT_SOURCE_DIR}/src/band.c"
               "${PROJECT_SOURCE_DIR}/src/hose.c"
               "${PROJECT_SOURCE_DIR}/src/curve.c"
               "${PROJECT_SOURCE_DIR}/src/mathlib.c")

set(LSYNTH_HEADERS "${PROJECT_SOURCE_DIR}/src/lsynthcp.h"
                   "${PROJECT_SOURCE_DIR}/src/band.h"
                   "${PROJECT_SOURCE_DIR}/src/hose.h"
                   "${PROJECT_SOURCE_DIR}/src/curve.h"
                   "${PROJECT_SOURCE_DIR}/src/mathlib.h")

add_executable(lsynthcp ${LSYNTH_SRC} ${LSYNTH_HEADERS})
target_link_libraries(lsynthcp m)

install(TARGETS lsynthcp DESTINATION usr/bin)
install(FILES "${PROJECT_SOURCE_DIR}/src/lsynth.mpd" DESTINATION usr/share/lsynth)
install(DIRECTORY "${PROJECT_SOURCE_DIR}/src/constraints/" DESTINATION usr/share/lsynth/constraints)

