SRCINFO:
	makepkg --printsrcinfo > .SRCINFO

updateVersion:
	HASH=$(shell wget -O - https://github.com/story-apps/starc/releases/download/v$(VERSION)/starc-setup.AppImage | sha256sum | cut -d " " -f 1); \
	sed -i "s/pkgver=.*$//pkgver=$(VERSION)/" PKGBUILD; \
	sed -i "s/sha256sums=(.*$//sha256sums=('$$HASH'/" PKGBUILD;
