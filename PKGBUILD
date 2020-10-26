# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.5.0
pkgrel=1
url=https://github.com/nickg/nvc
license=(GPL3)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses)
makedepends=(pkgconfig make flex check llvm tcl automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url}/releases/download/r${pkgver}/${pkgname}-${pkgver%.0}.tar.gz")
sha512sums=('b27afd32b86bf6242fae0bb06051eab818936ec457891b43d0a397781851670e8d0e16e17eaa285cf1af0c32c7915b89458e39aa1bbbc305c280bbcb963bd647')

build () {
	cd "${pkgname}-${pkgver%.0}"
	LDFLAGS="${LDFLAGS} -pthread" \
	CFLAGS="${CFLAGS} -pthread" \
	CXXFLAGS="${CXXFLAGS} -pthread" \
	./configure \
		--prefix=/usr \
		--with-llvm \
		--with-ncurses \
		--enable-vhpi \
		--enable-fst-pthread
	make && make bootstrap
}

# The source distribution is missing VHDL source files which are
# needed to run the test suite.
#
# check () {
# 	cd "${pkgname}-${pkgver%.0}"
# 	make check
# }
 
package () {
	cd "${pkgname}-${pkgver%.0}"
	make DESTDIR="${pkgdir}" install
	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}/tools" tools/*.rb
}
