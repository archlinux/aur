LIBS = `sdl-config --libs` `smpeg-config --libs` -lSDL_ttf -lSDL_image -lSDL_mixer -lbz2 -ljpeg -lm -logg -lvorbis -lvorbisfile
CFLAGS += -c `sdl-config --cflags` `smpeg-config --cflags` -DLINUX -DUSE_OGG_VORBIS
OBJSUFFIX = .o
CC = g++
LD = g++ -o
TARGET = onscripter
include Makefile.onscripter
