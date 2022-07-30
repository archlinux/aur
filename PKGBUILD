# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xbyak
pkgname=$_pkgname-git
pkgver=6.61.r0.g88f2f77
pkgrel=1
pkgdesc="C++ header-only JIT assembler library for x86/x86-64"
arch=('any')
url="https://github.com/herumi/xbyak"
license=('BSD')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# https://github.com/herumi/xbyak/issues/137
	echo 'target_compile_options(xbyak INTERFACE $<$<OR:$<COMPILE_LANG_AND_ID:C,GNU>,$<COMPILE_LANG_AND_ID:CXX,GNU>>:-Wno-array-bounds>)' >> $_pkgname/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/COPYRIGHT
}
