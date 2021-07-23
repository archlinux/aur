# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=0.9.3
pkgrel=1
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(AGPL3)
depends=(mimalloc openssl zlib)
makedepends=(clang cmake xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5b4850a00a5b2cb63c1aff13ef8d2cfdd79088187e1d82c6c0abad81d0c81866253533c67164db03a5d663fc48f5246f930a286ed6ca5b47ef658587be930fd0')

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
