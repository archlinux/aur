.PHONY: check
check: clean build srcinfo
	namcap PKGBUILD
	namcap uamp-ffmpeg-*-x86_64.pkg.tar.zst

.PHONY: build
build:
	makepkg --check

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src uamp-ffmpeg-*.pkg.tar.zst *.tar.gz