# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=dynarmic
pkgver=6.4.0
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
	'zydis>=4'
)
checkdepends=('catch2>=2.13.8' 'catch2<3')
provides=('libdynarmic.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('6634e3ef2e7989d510381695bfc8d0041ce19dd1aa7791709b19f31dea90771065722764a716efa8ef8c19dd8b665cb0298c75cd50fd75e10432b0b4e5a07043')

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
