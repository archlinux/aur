# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2024.02.10
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=https://www.mikekohn.net/micro/naken_asm.php
license=(GPL-3.0-or-later)
arch=(i686 x86_64)
depends=(readline glibc gcc-libs)
optdepends=('python: used by some of the included scripts')
conflicts=(naken_asm-git)
_pkgver=${pkgver//./-}
source=("https://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
b2sums=('82d7e67d077677069ee5eb1fc187769578ee02894695eaa439e3d46680ec822d41f7434c65877cedbe8142da680e760ca06f286f58c02e4736976d7c50b98048')

build () {
	cd "${pkgname}-${_pkgver}"
	./configure --install-prefix="${pkgdir}/usr" \
		--include-path="/usr/share/${pkgname}/includes"

	# Fixup compiler flags. This is easier to do by appending to the
	# config.mak file created by the configure script than trying to
	# bend the script behaviour to our wishes.
	cat >> config.mak <<-EOF
	CFLAGS := \$(filter-out -O2 -O3,\$(CFLAGS)) $CFLAGS
	CXXFLAGS := \$(filter-out -O2 -O3,\$(CXXFLAGS)) $CXXFLAGS
	LDFLAGS := \$(LDFLAGS) $LDFLAGS
	EOF

	make
}

package () {
	cd "${pkgname}-${_pkgver}"
	make install
}
