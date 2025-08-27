# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: perlawk <perlawk@yahoo.com.hk>
# Contributor: xantares <xantares09@hotmail.com>
_pkgname=asmjit
pkgname=$_pkgname-git
pkgver=r562.a3199e8
pkgrel=1
pkgdesc="Machine code generation for C++"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://asmjit.com/"
license=('Zlib')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libasmjit.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/asmjit/asmjit.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O2//' $_pkgname/CMakeLists.txt
}

build() {
	local options=(
		-D ASMJIT_TEST="$CHECKFUNC"
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

check() {
	ctest --output-on-failure --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.md
}
