MP = makepkg

.PHONY: all

all: clean build srcinfo

build:
	$(MP) -s

srcinfo:
	$(MP) --printsrcinfo > .SRCINFO

clean:
	git clean -Xdf

install:
	$(MP) -si
