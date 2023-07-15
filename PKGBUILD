# Maintainer: éclairevoyant
# Contributor: éclairevoyant
# Contributor: Håvard Pettersson <mail at haavard dot me>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: T dot J dot  Townsend <blakkheim at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin dot s+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
# Contributor: Thorsten Töpper <atsutane-tu at freethoughts dot de>
# Contributor: Thayer Williams <thayer at archlinux dot org>
# Contributor: Jeff 'codemac' Mickey <jeff at archlinux dot org>

_pkgname=dmenu
pkgname="$_pkgname-git"
pkgver=5.2.r7.7ab0cb5
pkgrel=1
pkgdesc="Generic menu for X"
arch=(i686 x86_64)
url="https://tools.suckless.org/dmenu/"
license=(MIT)
depends=(
	coreutils
	fontconfig
	freetype2
	glibc
	libfontconfig.so
	libx11
	libxft
	libxinerama
	sh
)
makedepends=(git)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+https://git.suckless.org/$_pkgname")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	# to use a custom config.h, place it in the package directory
	if [[ -f ${SRCDEST}/config.h ]]; then
		cp "${SRCDEST}/config.h" .
	fi

	cat >> config.mk <<eof
CPPFLAGS+=${CPPFLAGS}
CFLAGS+=${CFLAGS}
LDFLAGS+=${LDFLAGS}
eof
}

build(){
	make -C $_pkgname \
		11INC=/usr/include/X11 \
		X11LIB=/usr/lib/X11 \
		FREETYPEINC=/usr/include/freetype2
}

package() {
	cd $_pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
