# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dynarmic
pkgname=$_pkgname-git
pkgver=6.2.1.r12.ga2b3199a
pkgrel=1
pkgdesc="An ARM dynamic recompiler"
arch=('aarch64' 'x86_64')
url="https://github.com/merryhime/dynarmic"
license=('BSD')
makedepends=(
	'boost>=1.57'
	'cmake>=3.12'
	'fmt>=8.1.1'
	'git'
	'robin-map>=0.6.2'
	'xbyak>=6.60.1'
	'zydis>=3.1'
	'zydis<4'
)
checkdepends=('catch2>=2.13.8')
provides=("$_pkgname=$pkgver" 'libdynarmic.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	if [[ $CXX != clang* ]]; then
		CXXFLAGS+=" -Wno-array-bounds"
	fi
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
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
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
