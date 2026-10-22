MP = makepkg

.PHONY: all

all: clean build srcinfo

build:
	$(MP) -s

srcinfo:
	$(MP) --printsrcinfo > .SRCINFO

clean:
	git clean -Xdff

install:
	$(MP) -si
