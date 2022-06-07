.PHONY: build
build:
	@makepkg
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	@rm -f manjaro-zsh-config*
	@rm -rf pkg src
