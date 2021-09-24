.PHONY: build
build:
	@makepkg
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	@rm -f azcopy*
	@rm -rf pkg src
