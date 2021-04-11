# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2021.03.07
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=http://www.mikekohn.net/micro/naken_asm.php
license=(GPL3)
arch=(i686 x86_64)
depends=(readline)
conflicts=(naken_asm-git)
_pkgver=${pkgver//./-}
source=("http://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
sha512sums=('ebbb64335d16ce6b14c753f118e26fe8746a2eda6d32c45858559eb80bfdeb3673a3feedebe1700f59a16fc7d80a8e2ddf0882e1e0c0fdf0281769843c5575b2')

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
