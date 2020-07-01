# Maintainer: Kian Kasad <kian at kasad.com>

pkgname=abook-configdir
_pkgname=abook
pkgver=0.6.1
pkgrel=6
pkgdesc='abook patched to store configuration in ~/.config'
url='https://abook.sourceforge.net/'
arch=('x86_64')
license=('GPL2')
makedepends=('git')
depends=('readline')
validpgpkeys=('3552E46F58F5FEC69A2CD85A5B4E2D0DD7F62B21')
source=(
	"http://abook.sourceforge.net/devel/${_pkgname}-${pkgver}.tar.gz"{,.asc}
	'gcc5.patch'
	'configdir.patch'
)
sha256sums=('f0a90df8694fb34685ecdd45d97db28b88046c15c95e7b0700596028bd8bc0f9'
            'SKIP'
            '1eb89bc9ec6d4baed8a44d1ac9a8fb57742423e0699f26f354e810dfc63052cb'
            'e3db5b78140628d1b4213efaed45019032b57c8ecae748001ec105360b69e10b')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	aclocal && automake --add-missing && autoconf
	sed 's/0.18/0.20/g' -i po/Makefile.in.in
	patch -p1 -i ../gcc5.patch
	patch -p1 -i ../configdir.patch
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
	cd po && make update-po
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
