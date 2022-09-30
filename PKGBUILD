# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libchdr
pkgname=$_pkgname-git
pkgver=r180.e02b3d6
pkgrel=1
pkgdesc="Standalone library for reading MAME's CHDv1-v5 formats"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/rtissera/libchdr"
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libchdr.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# only build shared library
	sed -i '/(chdr-static/d;/tests/d' $_pkgname/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWITH_SYSTEM_ZLIB=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
