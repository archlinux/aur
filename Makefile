.PHONY: all

all:
	@rm -f *.tar.* .SRCINFO
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO
