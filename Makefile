CC = g++
LIBS = -lm -lopenjpeg -lexpat -lasdcp -lkumu -lcrypto
SRCS = ../../src/
BINS = ../../bin/

mkcpl : $(SRCS)mkcpl.cpp
	$(CC) -o $(BINS)mkcpl $(SRCS)mkcpl.cpp $(LIBS) -D_FILE_OFFSET_BITS=64

mkpkl : $(SRCS)mkpkl.cpp
	$(CC) -o $(BINS)mkpkl $(SRCS)mkpkl.cpp $(LIBS) -D_FILE_OFFSET_BITS=64

mkmap : $(SRCS)mkmap.cpp
	$(CC) -o $(BINS)mkmap $(SRCS)mkmap.cpp $(LIBS) -D_FILE_OFFSET_BITS=64

