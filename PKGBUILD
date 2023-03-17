# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dynarmic
pkgname=$_pkgname-git
pkgver=6.4.5.r7.g4ad2dee6
pkgrel=1
pkgdesc="An ARM dynamic recompiler"
arch=('aarch64' 'x86_64')
url="https://github.com/merryhime/dynarmic"
license=('BSD')
depends=('gcc-libs' 'glibc' 'llvm-libs')
makedepends=(
	'boost>=1.57'
	'cmake>=3.12'
	'fmt>=9'
	'git'
	'llvm'
	'robin-map>=0.6.2'
	'xbyak>=6.68'
	'zydis>=4'
)
checkdepends=('catch2>=3.2.1')
provides=("$_pkgname=$pkgver" 'libdynarmic.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
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
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
