# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2022.04.16
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=http://www.mikekohn.net/micro/naken_asm.php
license=(GPL3)
arch=(i686 x86_64)
depends=(readline)
conflicts=(naken_asm-git)
_pkgver=${pkgver//./-}
source=("http://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
b2sums=('cbd6170c8acf63ce79d24d3dd4630d1236a8b1abc1166b22fa412f15be87c02e5f7599c1102390a8834aa6cd86eff1b012969b069f19bb73aae56d317320e405')

build () {
	cd "${pkgname}-${_pkgver}"
	local -a args=()
	for flag in ${CFLAGS} ; do
		[[ ${flag} != -flto ]] || continue
		args+=("--cflags=${flag}")
	done
	for flag in ${LDFLAGS} ; do
		[[ ${flag} != -flto ]] || continue
		args+=("--ldflags=${flag}")
	done
	./configure --install-prefix="${pkgdir}/usr" \
		--include-path="/usr/share/${pkgname}/includes" \
		"${args[@]}"
	make
}

package () {
	cd "${pkgname}-${_pkgver}"
	make install
}
