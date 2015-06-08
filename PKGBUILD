# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Grigorios Bouzakis <grbzks@gmail.com>

pkgname=fdm-git
_pkgname=fdm
pkgver=20150605.808be67
pkgrel=1
pkgdesc='Program to fetch mail and deliver it in various ways'
url='https://github.com/nicm/fdm'
license=('BSD')
arch=('i686' 'x86_64' 'armv7h')
depends=('openssl' 'tdb')
makedepends=('git')
source=('git+https://github.com/nicm/fdm.git')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	bison parse.y
	bison -d parse.y
	mv parse.tab.h parse.h
	mv parse.tab.c parse.c
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}"/usr/share/{doc,licenses}/"${pkgname}"
	cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/examples/"
	sed -n '3,17p' fdm.c > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
