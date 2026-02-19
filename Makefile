.PHONY: pkg all update install

pkg:
	@makepkg -f

update:
	@makepkg --printsrcinfo > .SRCINFO

install: pkg
	@makepkg -i

all: pkg
