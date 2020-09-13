PLATFORM=LINUX

# Sources
PROJECT_ROOT=./SIDFactoryII
SOURCE=$(PROJECT_ROOT)/source
SRC=$(PROJECT_ROOT)/main.cpp $(shell find $(SOURCE) -name "*.cpp")

# Artifacts
APP_NAME=SIDFactoryII
ARTIFACTS_FOLDER=artifacts
EXE=$(ARTIFACTS_FOLDER)/$(APP_NAME)

BUILD_IMAGE_UBUNTU=sidfactory2/build-ubuntu
TMP_CONTAINER=sf2_build_tmp

# The compiler (gcc, g++, c++,clang++)
CC=g++

CC_FLAGS= $(shell sdl2-config --cflags) \
  -I $(SOURCE) \
	-D _SF2_$(PLATFORM) \
	-O2 \
	-std=gnu++14 \
	-flto

ifeq ($(PLATFORM),MACOS)
	LINKER_FLAGS= $(shell sdl2-config --libs) -lstdc++ -flto \
	-framework ApplicationServices 
else
	LINKER_FLAGS= $(shell sdl2-config --libs) -lstdc++ -flto
endif

.PHONY: clean
.PHONY: ubuntu
.PHONY: dist

# Rule to compile .o from .cpp
%.o: %.cpp
	$(CC) $(CC_FLAGS) -c $< -o $@

# Determine all .o files to be built
OBJ = $(SRC:.cpp=.o)

# Compile executable
$(EXE): $(OBJ) $(ARTIFACTS_FOLDER)
	$(CC) $(OBJ) $(LINKER_FLAGS) -o $(EXE)
	strip $(EXE)

dist: $(EXE)
	cp -r $(PROJECT_ROOT)/drivers $(ARTIFACTS_FOLDER)
	cp -r $(PROJECT_ROOT)/overlay $(ARTIFACTS_FOLDER)
	cp -r $(PROJECT_ROOT)/color_schemes $(ARTIFACTS_FOLDER)
	cp -r $(PROJECT_ROOT)/config $(ARTIFACTS_FOLDER)
	cp -r $(PROJECT_ROOT)/music $(ARTIFACTS_FOLDER)

$(ARTIFACTS_FOLDER):
	mkdir -p $@

clean:
	rm ${OBJ} || true
	rm -rf $(ARTIFACTS_FOLDER) || true

# Compile with the Ubuntu image on Docker

ubuntu:
	docker container rm $(TMP_CONTAINER) || true
	docker build -t $(BUILD_IMAGE_UBUNTU) .
	docker run --name $(TMP_CONTAINER) $(BUILD_IMAGE_UBUNTU)
	docker cp $(TMP_CONTAINER):/home/$(ARTIFACTS_FOLDER) .
	docker container rm $(TMP_CONTAINER)
