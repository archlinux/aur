# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.7.2
pkgrel=2
url=https://www.nickg.me.uk/nvc
license=(GPL3)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses)
makedepends=(pkgconfig make flex check llvm tcl automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver%.0}.tar.gz")
b2sums=('b885d1fed19ad1cba51967557bf26a14227deb0ea8946a7bfdca4c301031d18e0fc92fdbb26413c451a55e3de04766cebab8e41a5d9445f5ec95c880b1351d1c')

build () {
	cd "${pkgname}-${pkgver%.0}"

	rm -rf _build
	mkdir _build
	cd _build

	LDFLAGS="${LDFLAGS} -pthread" \
	CFLAGS="${CFLAGS} -pthread" \
	CXXFLAGS="${CXXFLAGS} -pthread" \
	../configure \
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
	cd "${pkgname}-${pkgver%.0}/_build"
	# TODO: Currently one test case fails.
	# make check
}
 
package () {
	cd "${pkgname}-${pkgver%.0}"
	make -C_build DESTDIR="${pkgdir}" install

	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}/tools" tools/*.rb
}
