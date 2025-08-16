SRCINFO:
	makepkg --printsrcinfo > .SRCINFO

updateVersion:
	HASH=$(shell wget -O - https://github.com/anyproto/anytype-ts/releases/download/v$(VERSION)/Anytype-$(VERSION).AppImage | sha256sum | cut -d " " -f 1); \
	sed -i "s/pkgver=.*$//pkgver=$(VERSION)/" PKGBUILD; \
	sed -i "s/sha256sums=(.*$//sha256sums=('$$HASH'/" PKGBUILD;
