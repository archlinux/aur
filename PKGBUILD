# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=dynarmic
pkgver=6.6.1
pkgrel=1
pkgdesc="An ARM dynamic recompiler"
arch=('aarch64' 'x86_64')
url="https://github.com/merryhime/dynarmic"
license=('0BSD')
depends=('gcc-libs' 'glibc' 'llvm-libs')
makedepends=(
	'boost>=1.57'
	'cmake>=3.12'
	'fmt>=9'
	'llvm'
	'robin-map>=0.6.2'
	'xbyak>=6.68'
	'zydis>=4'
)
checkdepends=('catch2>=3.2.1')
provides=('libdynarmic.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8a0931dd35d352bb4d5d12f33144a041eae9f61f213df177e4d04083887b982c84824c7ea31edd6b5471ad4ab65c3df89be9a67402b60877155776fb796f5e60')

build() {
	cmake -S $pkgname-$pkgver -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTING="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDYNARMIC_IGNORE_ASSERTS=ON \
		-DDYNARMIC_USE_LLVM=ON \
		-DDYNARMIC_USE_PRECOMPILED_HEADERS=OFF \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	depends+=('libfmt.so' 'libZydis.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname-$pkgver/LICENSE.txt
}
