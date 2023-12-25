# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Luís Ferreira <contact@lsferreira.net>
_pkgname=vulkan-headers
pkgname=$_pkgname-git
pkgver=1.3.274.r0.g80207f9
pkgrel=1
pkgdesc="Vulkan header files"
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Headers"
license=('Apache-2.0')
groups=('vulkan-devel')
makedepends=('cmake' 'git')
provides=("$_pkgname=1:$pkgver" "vulkan-hpp=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_TESTS="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
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
}
