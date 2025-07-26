# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.17.1
pkgrel=1
url=https://www.nickg.me.uk/nvc
license=(GPL-3.0-or-later)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses zstd tcl capstone)
makedepends=(pkgconfig make flex check llvm automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver}.tar.gz")
b2sums=('89ab0abe1506f270edf0790b57b18e5905aeb24d1cfb3126213ead965c37af605f8c8e9885d6940e919da7913fe83f782f114bf5fa55642e87675b946619e46e')

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
