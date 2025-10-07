# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Luís Ferreira <contact@lsferreira.net>
_pkgname=vulkan-headers
pkgname=$_pkgname-git
pkgver=1.4.328.r7.g4eebce1
pkgrel=1
pkgdesc="Vulkan header files and API registry"
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Headers"
license=('Apache-2.0 AND MIT')
groups=('vulkan-devel')
makedepends=('cmake' 'git' 'ninja')
optdepends=('python: for registry tools')
provides=("$_pkgname=1:$pkgver" "vulkan-hpp=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 --match 'v[!u]*' | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	# fix for gcc 15
	sed -i 's/-Werror//' tests/integration/CMakeLists.txt
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D VULKAN_HEADERS_ENABLE_TESTS="$CHECKFUNC"
		-G Ninja
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
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSES/MIT.txt
}
