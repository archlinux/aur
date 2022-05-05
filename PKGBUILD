# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.6.2
pkgrel=1
url=https://www.nickg.me.uk/nvc
license=(GPL3)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses)
makedepends=(pkgconfig make flex check llvm tcl automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver%.0}.tar.gz")
b2sums=('d201d927722ed4adea3d0888fb2af794277e7dad8c30bff1d2c42f16b82e3d0287240045b42fd171974f704a813eb610da5e41f1b9fa07ed9575ae78bd2cb32d')

build () {
	cd "${pkgname}-${pkgver%.0}"
	LDFLAGS="${LDFLAGS} -pthread" \
	CFLAGS="${CFLAGS} -pthread" \
	CXXFLAGS="${CXXFLAGS} -pthread" \
	./configure \
		--prefix=/usr \
		--disable-dependency-tracking \
		--enable-vhpi \
		--enable-vital \
		--enable-lto \
		--with-llvm=/usr/bin/llvm-config \
		--with-ncurses
	make && make bootstrap
}

check () {
	cd "${pkgname}-${pkgver%.0}"
	make check
}
 
package () {
	cd "${pkgname}-${pkgver%.0}"
	make DESTDIR="${pkgdir}" install
	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}/tools" tools/*.rb
}
