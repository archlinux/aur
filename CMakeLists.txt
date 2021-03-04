cmake_minimum_required(VERSION 3.19.0 )

project(onscripter LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

set(HEADERS
	BaseReader.h
	ButtonLink.h
	DirectReader.h
	SarReader.h
	NsaReader.h
	ScriptHandler.h
	ScriptParser.h
	AnimationInfo.h
	FontInfo.h
	DirtyRect.h
	LUAHandler.h
	Encoding.h
)

set(SOURCES
	AnimationInfo.cpp
	conv_shared.cpp
	DirectReader.cpp
	DirtyRect.cpp
	Encoding.cpp
	FontInfo.cpp
	LUAHandler.cpp
	NsaReader.cpp
	ONScripter_animation.cpp
	ONScripter_command.cpp
	ONScripter.cpp
	ONScripter_effect_breakup.cpp
	ONScripter_effect_cascade.cpp
	ONScripter_effect.cpp
	ONScripter_event.cpp
	ONScripter_file2.cpp
	ONScripter_file.cpp
	ONScripter_image.cpp
	ONScripter_lut.cpp
	ONScripter_rmenu.cpp
	ONScripter_sound.cpp
	ONScripter_text.cpp
	resize_image.cpp
	SarReader.cpp
	ScriptHandler.cpp
	ScriptParser_command.cpp
	ScriptParser.cpp
	sjis2utf16.cpp
)

find_package(SDL REQUIRED)
find_package(SDL_sound REQUIRED)
find_package(SDL_mixer REQUIRED)
find_package(SDL_image REQUIRED)
find_package(SDL_ttf REQUIRED)
find_package(Lua51 REQUIRED)
find_package(BZip2 REQUIRED)
find_package(Fontconfig REQUIRED)
find_package(JPEG REQUIRED)

# Find SMPEG
find_library(SMPEG_LIBRARY
    NAMES smpeg SMPEG Smpeg SMpeg
    PATHS
      ENV SMPEGDIR
      ENV SDLSOUNDDIR
      ENV SDLDIR
      /opt
    PATH_SUFFIXES
      lib
)

add_compile_definitions(LINUX USE_SMPEG USE_FONTCONFIG USE_OGG_VORBIS USE_CDROM USE_LUA)

set(ALL_LIBS
	SDL::SDL
	${SDL_SOUND_LIBRARIES}
	${SDL_IMAGE_LIBRARIES}
	${SDL_MIXER_LIBRARIES}
	${SDL_TTF_LIBRARIES}
	${SMPEG_LIBRARY}
	${LUA_LIBRARIES}
	${BZIP2_LIBRARIES}
	Fontconfig::Fontconfig
	${JPEG_LIBRARIES}
)

add_executable(onscripter onscripter_main.cpp ${HEADERS} ${SOURCES})
target_link_libraries(onscripter ${ALL_LIBS})
install(TARGETS onscripter DESTINATION bin)

add_executable(sardec sardec.cpp ${HEADERS} ${SOURCES})
target_link_libraries(sardec ${ALL_LIBS})
install(TARGETS onscripter DESTINATION bin)

add_executable(nsadec nsadec.cpp ${HEADERS} ${SOURCES})
target_link_libraries(nsadec ${ALL_LIBS})
install(TARGETS onscripter DESTINATION bin)

add_executable(sarconv sarconv.cpp ${HEADERS} ${SOURCES})
target_link_libraries(sarconv ${ALL_LIBS})
install(TARGETS onscripter DESTINATION bin)

add_executable(nsaconv nsaconv.cpp ${HEADERS} ${SOURCES})
target_link_libraries(nsaconv ${ALL_LIBS})
install(TARGETS onscripter DESTINATION bin)
