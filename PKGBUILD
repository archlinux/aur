# Maintainer: yiming564 <yiming564@proton.me>
pkgname=croaring-git
pkgver=4.5.1.6.g41100ea6
pkgrel=1
pkgdesc="Roaring bitmaps in C (and C++), with SIMD (AVX2, AVX-512 and NEON) optimizations: used by Apache Doris, ClickHouse, Alibaba Tair, Redpanda, YDB and StarRocks"
arch=('x86_64')
url="https://github.com/RoaringBitmap/CRoaring"
license=('Apache-2.0' 'MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/RoaringBitmap/CRoaring.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/CRoaring"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/-/./g')"
}

build() {
	cd "$srcdir/CRoaring"
	mkdir -p build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_ROARING_TESTS=OFF
	cmake --build . --parallel
}

package() {
	cd "$srcdir/CRoaring/build"
	DESTDIR="$pkgdir" cmake --install .
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	# Installing CRoaring's LICENSE by hand.
}
