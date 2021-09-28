# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=0.9.6
pkgrel=1
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(AGPL3)
depends=(mimalloc openssl zlib)
makedepends=(clang cmake xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d3de30b371413e974728fba03958d6043026f59aead8371058a0b1dc672e2675e169a1def3afd3751058f529d6ec80ff78c773d2718c1d9f0bdea74d9f13bc2e')

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
