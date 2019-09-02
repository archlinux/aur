# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=bloaty
pkgver=1.0
pkgrel=2
pkgdesc="a size profiler for binaries"
arch=(x86_64)
url="https://github.com/google/bloaty"
license=('Apache')
depends=(gcc-libs)
makedepends=(cmake)
options=(!emptydirs)
source=("https://github.com/google/bloaty/releases/download/v$pkgver/bloaty-$pkgver.tar.bz2")
sha256sums=('e1cf9830ba6c455218fdb50e7a8554ff256da749878acfaf77c032140d7ddde0')

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

	# Prevent package conflicts
	rm -r "$pkgdir/usr/"{include,bin/protoc*,lib64,lib/*.a,lib/pkgconfig/protobuf*,lib/cmake/protobuf}
}
