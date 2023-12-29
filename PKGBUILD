# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=simpleini
pkgname=$_pkgname-git
pkgver=4.22.r0.g09c21bd
pkgrel=1
pkgdesc="Cross-platform C++ library providing a simple API to read and write INI-style configuration files"
arch=('any')
url="https://github.com/brofield/simpleini"
license=('MIT')
makedepends=('cmake' 'git')
checkdepends=('gtest')
optdepends=('icu: for ICU conversion')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i 's/(IS_TOPLEVEL_PROJECT)/(BUILD_TESTING)/' $_pkgname/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_TESTING="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSIMPLEINI_USE_SYSTEM_GTEST=ON \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENCE.txt
}
