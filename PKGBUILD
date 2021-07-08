# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2021.04.18
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=http://www.mikekohn.net/micro/naken_asm.php
license=(GPL3)
arch=(i686 x86_64)
depends=(readline)
conflicts=(naken_asm-git)
_pkgver=${pkgver//./-}
source=("http://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
sha512sums=('ca5181031ee06fa54738c7c11baa526324d07f534e666b0da842e6c09559320d5bef66fef97ee6cb3d020a9d9afa86c1956c45c6439a4d4d2f4a69aa66db44bc')

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
