# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zycore-c
pkgname=$_pkgname-git
pkgver=1.4.1.r0.g1401fb8
pkgrel=1
pkgdesc="Zyan core library for C"
arch=('x86_64')
url="https://github.com/zyantific/zycore-c"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'doxygen' 'git')
checkdepends=('gtest')
provides=("$_pkgname=$pkgver" 'libZycore.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZYCORE_BUILD_SHARED_LIB=ON \
		-DZYCORE_BUILD_TESTS="$CHECKFUNC" \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
