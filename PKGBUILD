# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=nasc-tui
pkgdesc='Terminal calculator with mathematical expression evaluation'
pkgver=1.0.4
pkgrel=1
url=https://github.com/parnoldx/nascTUI
arch=(x86_64)
depends=(libqalculate)
makedepends=(go)
license=(GPL-2.0-only)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55e20b26f48dbc75d500a65abb6566ca5a35a7eb6d73495d4931527af4c5fa47')

prepare () {
	cd "nascTUI-$pkgver/src"
	export GOPATH="$srcdir"
	go mod download -modcacherw
}

build () {
	cd "nascTUI-$pkgver/src"
	"${CXX:-g++}" $CPPFLAGS $CXXFLAGS $(pkg-config --cflags libqalculate) \
		-c -fPIE -o calc_wrapper.o calc_wrapper.cpp

	CGO_CPPFLAGS="$CPPFLAGS" \
	CGO_CFLAGS="$CFLAGS" \
	CGO_CXXFLAGS="$CXXFLAGS" \
	CGO_LDFLAGS="$LDFLAGS" \
	GOPATH="$srcdir" \
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		.
}

package () {
	cd "nascTUI-$pkgver"
	install -Dm755 src/nasc "$pkgdir/usr/bin/nasc"
}
