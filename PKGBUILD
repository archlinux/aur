# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=0.9.5
pkgrel=1
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(AGPL3)
depends=(mimalloc openssl zlib)
makedepends=(clang cmake xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b05d399eecaca37d98745382ba201f62e6042613290b1dec6f08bfc133172ccb91603898acb3f54e2985fe3d7334c954c389da498a1ccef6b65053815b8aeb46')

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
