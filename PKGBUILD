# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=dynarmic
pkgver=6.4.1
pkgrel=1
pkgdesc="An ARM dynamic recompiler"
arch=('aarch64' 'x86_64')
url="https://github.com/merryhime/dynarmic"
license=('BSD')
depends=('gcc-libs')
makedepends=(
	'boost>=1.57'
	'cmake>=3.12'
	'fmt>=9'
	'robin-map>=0.6.2'
	'xbyak>=6.68'
	'zydis>=4'
)
checkdepends=('catch2>=2.13.8' 'catch2<3')
provides=('libdynarmic.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('19529d6e34e7eb23437692d22a9ae8a3b27c89b8cf7ea59e57aa58296536ccf79aac8472e9b6d53d26edde2ba98b62f1867ed770ff7122b90e00b043f475c410')

build() {
	cmake -S $pkgname-$pkgver -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDYNARMIC_IGNORE_ASSERTS=ON \
		-DDYNARMIC_TESTS="$CHECKFUNC" \
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
