.PHONY: build
build:
	@makepkg
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	@rm -f procs*
	@rm -rf pkg src
