# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libchdr
pkgname=$_pkgname-git
pkgver=r151.cdcb714
pkgrel=1
pkgdesc="Standalone library for reading MAME's CHDv1-v5 formats"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/rtissera/$_pkgname"
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'git' 'ninja')
provides=("$_pkgname=$pkgver" "$_pkgname.so")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	# prefer makepkg.conf lto option
	sed -i '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt
	# only build shared library
	sed -i '/(chdr-static/d' CMakeLists.txt
	sed -i 's/chdr-static/chdr/' tests/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build -G Ninja \
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
