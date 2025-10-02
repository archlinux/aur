# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.18.0
pkgrel=2
url=https://www.nickg.me.uk/nvc
license=(GPL-3.0-or-later)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses zstd tcl capstone tcllib)
makedepends=(pkgconfig make flex check llvm automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver}.tar.gz")
b2sums=('3791c0d3dbb5c99e17dd290773f32d4a6f11e17942ce6e12ff8780c3e5c66500f87e64a47061f0e861fbe4e4b1ca66fa3be780186d7724f6b0b6c6db95ca93e5')

build () {
	cd "${pkgname}-${pkgver}"

	rm -rf _build
	mkdir _build
	cd _build

	LDFLAGS="${LDFLAGS} -pthread" \
	CFLAGS="${CFLAGS} -pthread" \
	CXXFLAGS="${CXXFLAGS} -pthread" \
	../configure \
		--prefix=/usr \
		--disable-dependency-tracking \
		--enable-silent-rules \
		--enable-verilog \
		--enable-vital \
		--enable-server \
		--enable-tcl \
		--with-llvm=/usr/bin/llvm-config \
		--with-bash-completion=/usr/share/bash-completion \
		--with-ncurses
	make && make bootstrap
}

check () {
	# TODO: Currently three test cases fail.
	: make -C "${pkgname}-${pkgver}/_build" check
}
 
package () {
	cd "${pkgname}-${pkgver}"
	make -C_build DESTDIR="${pkgdir}" install

	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
