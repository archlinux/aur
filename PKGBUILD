# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.20.1
pkgrel=1
url=https://www.nickg.me.uk/nvc
license=(GPL-3.0-or-later)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses zstd tcl capstone tcllib)
makedepends=(pkgconfig make flex check llvm automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver}.tar.gz")
b2sums=('dc6c19bf79a5838573a5bad7b3ad5cad2d492f8fd8d34fd8cb41031038358e64711a1829e26ec2ea66c3e2d6a694ec2945ee61bc1348f57c512a1901edc3b636')

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
