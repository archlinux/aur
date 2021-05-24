# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=lua-md5
pkgver=1.3
pkgrel=1
pkgdesc="Basic cryptographic facilities for Lua."
arch=('i686' 'x86_64')
url="https://github.com/keplerproject/md5"
license=('MIT')
depends=('lua')
source=(https://github.com/keplerproject/md5/archive/refs/tags/${pkgver}.tar.gz
	Makefile.patch
	LICENSE)

prepare() {
	cd ${srcdir}/md5-${pkgver}
	./configure
	sed -i "s|5.2|$(lua -v | grep -oP '\d\.\d')|" config
	patch < ../Makefile.patch
}

build() {
	cd ${srcdir}/md5-${pkgver}
	make || return 1
}

package() {
	cd ${srcdir}/md5-${pkgver}
	sed -i "s|\(PREFIX = \)|\1${pkgdir}|" config
	make install || return 1
	install -Dm644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('17b773591141091a4104d5183aad134b'
         '6de2eb1764732e2337be3e163e72b0bd'
         '9ac505254abc686b34763c2118dc2e1b')
