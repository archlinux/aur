# Maintainer: Jonas Gunz <arch@jonasgunz.de>
pkgname=xcsoar
pkgver=7.43
pkgrel=1
pkgdesc="... the open-source glide computer"
arch=( x86_64 )
url="https://github.com/XCSoar/XCSoar"
license=('GPL-2')
depends=(
	libxslt sox zip quilt dbus
	zlib c-ares curl lua libinput sdl sdl_ttf
	libpng libjpeg-turbo mesa glm fmt libsodium freetype2
	libtiff libgeotiff openssl alsa-lib librsvg
	ttf-dejavu ttf-roboto
)
makedepends=(
	git gcc make gettext automake imagemagick
	perl perl-xml-parser python
)
options=( !lto !buildflags )
source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"libboost.mk.patch"
	"PathFormatter.patch"
)
_srcname="XCSoar-$pkgver"
b2sums=(
	"96b30560681672aaa3605dc8c02de3a0a08b4225ec99ae3535214f1bba836cf5e87c5813d8121627db9d044064ca9eec04342a962095c15c86f4d3fb4fd5904e"
	"67ba1dd93a377f65dcf201e0e5bbeab20ca7361d66830f4848040d0159e2bf045134dc1b23fb129d9a5921585fea4219b96962c4b1ac38b4a33d84a211b09982"
	"add62c977bdc8ad4d6732f74cb1a6940a5f8835626f7357ac906cc656278bdda1acbd215c0949560199a39e31afbcefb142c91b2738272c1c84c490d20d90fe9"
)

prepare() {
	patch "$srcdir/$_srcname/build/libboost.mk" "$srcdir/libboost.mk.patch"
	patch "$srcdir/$_srcname/src/lib/fmt/PathFormatter.hpp" "$srcdir/PathFormatter.patch"
}

build() {
	cd "$srcdir/$_srcname"
	make DEBUG=n -j$(nproc)
}

package() {
	local BINBASE="$srcdir/$_srcname/output/UNIX/bin"
	local DEST="$pkgdir/usr/bin"

	mkdir -p "$DEST"

	install "$BINBASE/vali-xcs" "$DEST/vali-xcs"
	install "$BINBASE/xcsoar" "$DEST/xcsoar"
}
