# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Luís Ferreira <contact@lsferreira.net>
_pkgname=vulkan-headers
pkgname=$_pkgname-git
pkgver=1.3.288.r6.ge3c37e6
pkgrel=1
pkgdesc="Vulkan header files"
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Headers"
license=('Apache-2.0 AND MIT')
groups=('vulkan-devel')
makedepends=('cmake' 'git' 'ninja')
provides=("$_pkgname=1:$pkgver" "vulkan-hpp=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -G Ninja -B build -S $_pkgname \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DVULKAN_HEADERS_ENABLE_TESTS="$CHECKFUNC" \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSES/MIT.txt
}
