.PHONY: check
check: clean build srcinfo

.PHONY: build
build:
	makepkg

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src uamp-*.pkg.tar.zst *.tar.gz
