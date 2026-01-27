.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	git clean -Xdf

.PHONY: build
build:
	makepkg -si
