# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dynarmic
pkgname=$_pkgname-git
pkgver=5.r128.g4dcebc18
pkgrel=1
pkgdesc='An ARM dynamic recompiler'
arch=('x86_64')
url="https://github.com/merryhime/$_pkgname"
license=('BSD')
makedepends=(
	'boost>=1.57'
	'cmake>=3.8'
	'fmt>=8'
	'git'
	'ninja'
	'robin-map>=0.6.2'
	'xbyak>=5.995.r3'
	'zydis>=3.2.0.r2'
)
checkdepends=('catch2>=2.13.1')
provides=("$_pkgname=$pkgver" 'libdynarmic.so')
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# fix building with zydis>=4
	sed -i 's/ZYDIS_ADDRESS_WIDTH_64/ZYDIS_STACK_WIDTH_64/' $_pkgname/src/dynarmic/common/x64_disassemble.cpp
}

build() {
	cmake -S $_pkgname -B build -G Ninja \
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
	cmake --build build --target test
}

package() {
	depends+=('libfmt.so' 'libZydis.so>=4')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
