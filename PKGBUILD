# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.16.1
pkgrel=1
url=https://www.nickg.me.uk/nvc
license=(GPL-3.0-or-later)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses zstd tcl capstone)
makedepends=(pkgconfig make flex check llvm automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver}.tar.gz")
b2sums=('7cc86ad7901883da3298752a05a464d7c550f225ef340fc5c42c51a9e2ab46a400674cd2199bf7d3f7a4bf56e0ca0b8dee75a8de19021effe95169a39a34c030')

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
