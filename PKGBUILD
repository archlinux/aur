# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=abook
pkgver=0.6.1
pkgrel=7
pkgdesc='Text-based addressbook designed for use with Mutt'
url='http://abook.sourceforge.net/'
arch=('x86_64')
license=('GPL2')
makedepends=('git')
depends=('readline')
source=("http://abook.sourceforge.net/devel/${pkgname}-${pkgver}.tar.gz"
        'gcc5.patch')
sha256sums=('f0a90df8694fb34685ecdd45d97db28b88046c15c95e7b0700596028bd8bc0f9'
            '1eb89bc9ec6d4baed8a44d1ac9a8fb57742423e0699f26f354e810dfc63052cb')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	aclocal && automake --add-missing && autoconf
	sed 's/0.18/0.20/g' -i po/Makefile.in.in
	patch -p1 -i ../gcc5.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
	cd po && make update-po
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
