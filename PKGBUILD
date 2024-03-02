# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=dynarmic
pkgver=6.7.0
pkgrel=1
pkgdesc="An ARM dynamic recompiler"
arch=('aarch64' 'x86_64')
url="https://github.com/merryhime/dynarmic"
license=('0BSD')
depends=('gcc-libs' 'glibc' 'llvm-libs')
makedepends=(
	'boost>=1.57'
	'cmake>=3.12'
	'fmt>=10.1.1'
	'llvm'
	'robin-map>=0.6.2'
)
makedepends_aarch64=('oaknut>=2.0.2')
makedepends_x86_64=('xbyak>=7.05' 'zydis>=4')
checkdepends=('catch2>=3.5' 'oaknut>=2.0.2')
provides=('libdynarmic.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('1f8df7386e296f0ba2bce032c629530e9c1afc742c801605b51a42906b39182c7055090a07ad273580671113979834963756d32509e5e2df0a221bf14d385843')

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
	depends+=('libfmt.so')
	depends_x86_64+=('libZydis.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname-$pkgver/LICENSE.txt
}
