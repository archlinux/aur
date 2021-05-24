.PHONY: all update build clean

all: update build clean

update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg

clean:
	rm -rf *.tar.* *.gz src pkg
