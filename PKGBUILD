# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libchdr
pkgname=$_pkgname-git
pkgver=r283.8bba774
pkgrel=1
pkgdesc="Standalone library for reading MAME's CHDv1-v5 formats"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/rtissera/libchdr"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git' 'zlib' 'zstd')
provides=("$_pkgname=$pkgver" 'libchdr.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	# only build shared library
	sed -i '/(chdr-static/d;/tests/d' $_pkgname/CMakeLists.txt
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D WITH_SYSTEM_ZLIB=ON
		-D WITH_SYSTEM_ZSTD=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=('libz.so' 'libzstd.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
