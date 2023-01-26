# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=luabridge
pkgname=$_pkgname-git
pkgver=2.8.r6.g6580b18
pkgrel=1
pkgdesc="A lightweight, dependency-free library for binding Lua to C++"
arch=('any')
url="https://github.com/vinniefalco/LuaBridge"
license=('MIT')
makedepends=('cmake' 'git')
checkdepends=('gtest')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLUABRIDGE_TESTING="$CHECKFUNC" \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/README.md
}
