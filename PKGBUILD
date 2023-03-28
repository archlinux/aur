# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=capsimage
pkgname=$_pkgname-git
pkgver=5.1.r8.g502015b
pkgrel=1
pkgdesc="SPS Decoder Library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.kryoflux.com/"
license=('custom')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libcapsimage.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/simonowen/capsimage.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENCE.txt
}
