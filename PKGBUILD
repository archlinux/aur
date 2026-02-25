# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xbyak
pkgname=$_pkgname-git
pkgver=7.33.3.r0.g3fe4856
pkgrel=2
pkgdesc="C++ header-only JIT assembler library for x86/x86-64"
arch=('any')
url="https://github.com/herumi/xbyak"
license=('BSD-3-Clause')
makedepends=('cmake' 'git')
checkdepends=('lib32-gcc-libs' 'nasm' 'yasm')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	# skip a failing test with nasm v3
	sed -i '/test_avx512/d' $_pkgname/test/Makefile
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

check() {
	make -C $_pkgname test
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/COPYRIGHT
}
