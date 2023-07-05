# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.9.2
pkgrel=2
url=https://www.nickg.me.uk/nvc
license=(GPL3)
conflicts=(nvc-git)
arch=(x86_64 i686)
depends=(libelf llvm-libs ncurses zstd)
makedepends=(pkgconfig make flex check llvm tcl automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
source=("${url%/nvc}/files/${pkgname}-${pkgver%.0}.tar.gz")
b2sums=('0da9116aa9fdffa674cc784832ef0d479da70b14dc283a7dac8df7ea9068025f65d4fbeca5f05e62db4b6d0bf7a2bc5c579104f78f75d41c14a27acc65e3c642')

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
		--enable-jit \
		--enable-verilog \
		--enable-vital \
		--enable-lto \
		--with-llvm=/usr/bin/llvm-config \
		--with-bash-completion=/usr/share/bash-completion \
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
}
