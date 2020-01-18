.PHONY: build
build:
	@makepkg
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	@rm -f kfilt*
	@rm -rf pkg src
