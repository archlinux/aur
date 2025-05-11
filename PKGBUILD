# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=cloog
pkgver=0.21.1
pkgrel=1
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bastoul.net/cloog/"
license=('LGPL-2.1-or-later')
depends=('osl' 'libisl' 'gmp')
makedepends=('texlive-core' 'texlive-bin' 'texlive-plaingeneric')
source=("https://github.com/periscop/cloog/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bfb76bc69941ba0ddd81f1d52d807c02cd24e5baf3d8b774148712494e256709531e4ceb0402309ed2596a2a3ee951dc6bcc4e21502199942e2bd9dab705c9f2')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	cd "${_srcdir}"
	sed -i 's/OSL_CPPFLAGS+="/OSL_CPPFLAGS="$OSL_CPPFLAGS/' 'configure'
}

build() {
	cd "${_srcdir}"
	./configure --prefix=/usr --with-cloog-int=gmp --with-isl=system --with-osl=system --with-osl-prefix=/usr
	make
}

check() {
	cd "${_srcdir}"
	# There are certain race conditions on running the tests, so we restrict
	# it to one job (one CPU core).

	make -j1 check
}

package() {
	cd "${_srcdir}"
	DESTDIR="$pkgdir" make -j1 install
}
