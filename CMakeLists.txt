cmake_minimum_required(VERSION 2.8)

project(ExRootAnalysis)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

find_package(ROOT)
include(${ROOT_USE_FILE})

file(GLOB sources src/*.cc)
file(GLOB headers ExRootAnalysis/*.h)

if(${ROOT_VERSION} LESS 6.0)
  ROOT_GENERATE_DICTIONARY(ExRootAnalysisDict ${headers} LINKDEF src/ExRootAnalysisLinkDef.h)
else()
  ROOT_GENERATE_DICTIONARY(ExRootAnalysisDict MODULE ExRootAnalysisDict ${headers} LINKDEF src/ExRootAnalysisLinkDef.h)
endif()

include_directories(${ROOT_INCLUDE_DIR} .)

add_library(ExRootAnalysis SHARED ${sources} ExRootAnalysisDict.cxx)
install(FILES ${headers} DESTINATION include/ExRootAnalaysis)
install(TARGETS ExRootAnalysis
  LIBRARY DESTINATION lib)

if (${ROOT_VERSION} GREATER 6)
  install(FILES
      ${PROJECT_BINARY_DIR}/libExRootAnalysisDict_rdict.pcm
      DESTINATION lib)
endif()
