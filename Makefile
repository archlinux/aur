MP = makepkg
RM = rm -rf

.PHONY: all

all: clean build srcinfo

build:
	$(MP) -s

srcinfo:
	$(MP) --printsrcinfo > .SRCINFO

clean:
	$(RM) pkg/ src/ clownfish*

install:
	$(MP) -si
