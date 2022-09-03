# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: perlawk <perlawk@yahoo.com.hk>
# Contributor: xantares <xantares09@hotmail.com>
_pkgname=asmjit
pkgname=$_pkgname-git
pkgver=r417.5c469e3
pkgrel=1
pkgdesc="Machine code generation for C++"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://asmjit.com/"
license=('zlib')
depends=('gcc-libs')
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
	cmake -S $_pkgname -B build \
		-DASMJIT_TEST="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.md
}
