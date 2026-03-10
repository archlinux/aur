# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.19.3
pkgrel=1
url=https://www.nickg.me.uk/nvc
license=(GPL-3.0-or-later)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses zstd tcl capstone tcllib)
makedepends=(pkgconfig make flex check llvm automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver}.tar.gz")
b2sums=('7d274bd447614ccce158123cb9e3d65db4a4310f82fa3ac99e716605e6db23bca980c05066ca5f3823bcf38e4208d9fabb896184dcddfc6be57fc6c00a999032')

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
	make -C "${pkgname}-${pkgver}/_build" check
}
 
package () {
	cd "${pkgname}-${pkgver}"
	make -C_build DESTDIR="${pkgdir}" install

	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
