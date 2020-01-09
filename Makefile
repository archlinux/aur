.PHONY: all
all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -f stoplight-studio-*.AppImage
	rm -f stoplight-studio-appimage-*.tar.xz
	rm -rf pkg src
