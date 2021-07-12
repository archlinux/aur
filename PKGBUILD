# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=0.9.2
pkgrel=1
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(AGPL3)
depends=(mimalloc openssl tbb zlib)
makedepends=(clang cmake xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('56a6ee09c86d6895467861d5628f449017128662812d8d7e35c4a98ea3ebf51f1ca7b6b3db50db72d54b88570ee1c10a6041360ce9e06f33dceffdf41ea135e9')

build() {
	make -C "${pkgname}-${pkgver}" LTO=1 SYSTEM_MIMALLOC=1 SYSTEM_TBB=1
}

package() {
	make -C "${pkgname}-${pkgver}" LTO=1 SYSTEM_MIMALLOC=1 SYSTEM_TBB=1 \
		DESTDIR="${pkgdir}" install
	
	# Add a ld.mold symlink, which allows passing -fuse-ld=mold to Clang
	ln -snf mold "${pkgdir}/usr/bin/ld.mold"
}
