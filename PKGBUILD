# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=libplist-git
epoch=1
pkgver=2.4.0.r7.g5461eda
pkgrel=1
pkgdesc="A library to handle Apple Property List format whereas it's binary or XML"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('LGPL-2.1-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('python' 'cython' 'git' 'python-setuptools')
optdepends=('python: Python bindings')
provides=(libplist-2.0.so libplist++-2.0.so "libplist=$pkgver")
conflicts=('libplist')
source=("git+https://github.com/libimobiledevice/libplist")
sha256sums=('SKIP')

pkgver() {
	cd libplist
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd libplist
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libplist
	./configure --prefix=/usr
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
	cd libplist
	make check
}

package() {
	cd libplist
	make DESTDIR="$pkgdir" install
}
