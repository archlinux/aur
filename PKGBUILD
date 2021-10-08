# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libchdr
pkgname=$_pkgname-git
pkgver=r140.1d43110
pkgrel=2
pkgdesc="Standalone library for reading MAME's CHDv1-v5 formats"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/rtissera/$_pkgname"
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" "$_pkgname.so")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# prefer user makepkg.conf
	sed -i '/CMAKE_C_FLAGS/d;/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' $_pkgname/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
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
