.PHONY: pkg all update install

pkg:
	@makepkg -f
update:
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

install: pkg
	@makepkg -i

all: update pkg
