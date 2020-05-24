# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=bloaty
pkgver=1.1
pkgrel=1
pkgdesc="a size profiler for binaries"
arch=(x86_64)
url="https://github.com/google/bloaty"
license=('Apache')
depends=(gcc-libs re2 protobuf capstone)
makedepends=(cmake)
options=(!emptydirs)
source=("https://github.com/google/bloaty/releases/download/v$pkgver/bloaty-$pkgver.tar.bz2")
sha256sums=('a308d8369d5812aba45982e55e7c3db2ea4780b7496a5455792fb3dcba9abd6f')

build() {
	cd "$pkgname-$pkgver"
	# Bloaty doesn't allow using an empty build type.
	# Unfortunately, this breaks RELRO, so we need to fix that
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_EXE_LINKER_FLAGS_RELEASE="$LDFLAGS" -Wno-dev .
	make
}

# Not included in the source tarbal, use the git release instead
# check() {
# 	cd "$pkgname-$pkgver"
# 	make test
# }

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
