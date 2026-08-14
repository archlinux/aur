# Maintainer: Sierra410 <(my nickname)@protonmail.com>
# Contributor: Steven Dwy <me@yoplitein.net>
# Based on trenchbroom-appimage

pkgname=trenchbroom-appimage-latest
pkgver=2026.1
pkgrel=1
pkgdesc="Cross-platform level editor for Quake-engine based games. Latest AppImage from GitHub"
arch=("x86_64")
url="https://trenchbroom.github.io/"
_repo="TrenchBroom/TrenchBroom"
license=("GPL3")
provides=("trenchbroom")
conflicts=("trenchbroom-appimage")
makedepends=(
	"unzip"
	"jq"
)
source=("TrenchBroom-appimage.desktop")
sha256sums=("ffc16fddb9a288dbad411fff296cf630d70d97a2bc655b66dd731318d5dcfdc4")
options=(
	!debug
	!strip # stripping seems to nuke AppImage data
)

pkgver() {
	if [ -z "$_pkgver" ]; then
		_pkgver="$(curl -s \
			-H 'Accept: application/vnd.github+json' \
			"https://api.github.com/repos/$_repo/releases/latest" \
				| jq -r '.tag_name | sub("^v"; "")'
		)"
	fi

	echo "$_pkgver"
}

prepare() {
	pkgver

	local zip="./${pkgname}-${_pkgver}.zip"
	if [ ! -f "$zip" ]; then
		curl -L -o "$zip" \
			"https://github.com/$_repo/releases/download/v$_pkgver/TrenchBroom-Linux-$CARCH-v$_pkgver-Release.zip"
		unzip -o "$zip"
	fi

	local iconPath="usr/share/icons/hicolor/256x256/apps/trenchbroom.png"
	./TrenchBroom.AppImage --appimage-extract "$iconPath"
	mv "squashfs-root/$iconPath" .
}

package() {
	install -Dm755 TrenchBroom.AppImage "$pkgdir/usr/lib/TrenchBroom.AppImage"
	install -Dm644 TrenchBroom-appimage.desktop "$pkgdir/usr/share/applications/TrenchBroom-appimage.desktop"
	install -Dm644 trenchbroom.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/trenchbroom-appimage.png"
}
