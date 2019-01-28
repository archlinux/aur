# Maintainer: Anthony Danilov <grinderz@protonmail.com>

_libname=libnsq

pkgname=${_libname}-git
pkgver=r36.9b2685d

pkgrel=1
pkgdesc="Async C client library for NSQ"
arch=('x86_64')
url="https://github.com/mreiferson/libnsq"
license=('MIT')
depends=('libevbuffsock')
provides=('libnsq')
source=(git+https://github.com/mreiferson/libnsq.git)
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
	make libnsq.a
}

#check() {
#	cd "${srcdir}/${_libname}"
#	make test
#	./test-nsqd
#	./test-lookupd
#}

package() {
	cd "${srcdir}/${_libname}"
	install -Dm 644 ${_libname}.a ${pkgdir}/usr/lib/${_libname}.a
	install -Dm 644 nsq.h ${pkgdir}/usr/include/nsq.h

	install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
