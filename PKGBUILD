# Maintainer: Anthony Danilov <grinderz@protonmail.com>

_libname=libevbuffsock

pkgname=${_libname}-git
pkgver=r19.cfc3b95

pkgrel=1
pkgdesc="A minimal port of the evbuffer suite of functions from libevent to libev"
arch=('x86_64')
url="https://github.com/mreiferson/libevbuffsock"
license=('unknown')
checkdepends=('libev')
provides=(libevbuffsock)
source=(git+https://github.com/mreiferson/libevbuffsock.git)
sha1sums=('SKIP')
pkgver() {
	cd "${_libname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_libname}"
	sed -i '/^PREFIX=.*$/c\PREFIX=/usr' Makefile
	make libevbuffsock.a
}

check() {
	cd "${srcdir}/${_libname}"
	make test
	./test
}

package() {
	cd "${srcdir}/${_libname}"
	install -Dm 644 ${_libname}.a ${pkgdir}/usr/lib/${_libname}.a
	install -Dm 644 evbuffsock.h ${pkgdir}/usr/include/evbuffsock.h
}
