# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=dynarmic
pkgver=6.3.0
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
	'xbyak>=6.61'
	'zydis>=3.1'
	'zydis<4'
)
checkdepends=('catch2>=2.13.8')
provides=('libdynarmic.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('93034366ec0f89bcf1c98e02518e7051e7a1b8469e8a84924f85b32382b8e4faac06d09f8817451ba899c406888c3057f53e67dd146e3e4d2c1604bab328b5c4')

build() {
	cmake -S $pkgname-$pkgver -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDYNARMIC_IGNORE_ASSERTS=ON \
		-DDYNARMIC_NO_BUNDLED_CATCH=ON \
		-DDYNARMIC_NO_BUNDLED_FMT=ON \
		-DDYNARMIC_NO_BUNDLED_ROBIN_MAP=ON \
		-DDYNARMIC_NO_BUNDLED_XBYAK=ON \
		-DDYNARMIC_NO_BUNDLED_ZYDIS=ON \
		-DDYNARMIC_TESTS="$CHECKFUNC" \
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
