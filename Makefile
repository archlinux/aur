MP = makepkg
RM = rm -rf

.PHONY: all

all: clean build srcinfo

build:
	$(MP) -s

srcinfo:
	$(MP) --printsrcinfo > .SRCINFO

clean:
	$(RM) pkg/ src/ dsr.zip dsr*.tar.*

install:
	$(MP) -si
