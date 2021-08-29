# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=0.9.4
pkgrel=1
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(AGPL3)
depends=(mimalloc openssl zlib)
makedepends=(clang cmake xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ec9b473a0ac36aadd5085bf5b04253fc4c4f1d284aaf9f1009c472556adb4a4ad941b7091ddc375f069801d17372bf41d8ec9287162bd3c4e63823ec6c8adb47')

# TODO: The TBB version from system packages does not currently work.
#       Re-add dep and SYSTEM_TBB=1 when possible to Make commands.

build() {
	make -C "${pkgname}-${pkgver}" LTO=1 SYSTEM_MIMALLOC=1
}

check () {
	# TODO: Currently one of the tests does not pass due to unexpected
	#       behaviour in the current version of Binutils in Arch.
	: make -C "${pkgname}-${pkgver}" LTO=1 SYSTEM_MIMALLOC=1 check
}

package() {
	make -C "${pkgname}-${pkgver}" LTO=1 SYSTEM_MIMALLOC=1 \
		DESTDIR="${pkgdir}" install
	
	# Add a ld.mold symlink, which allows passing -fuse-ld=mold to Clang
	ln -snf mold "${pkgdir}/usr/bin/ld.mold"
}
