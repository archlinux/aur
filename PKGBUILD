# Maintainer: UnicornDarkness
# Contributor: eloaders <eloaders at linux dot pl>

_pkgname=libcpuid
pkgname=$_pkgname-git
epoch=2
pkgver=0.8.0.r0.g5bb7c32
pkgrel=1
pkgdesc="A small C library for x86 CPU detection and feature extraction"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://libcpuid.sourceforge.net"
license=('BSD')
depends=('glibc')
depends_armv7h=('dkms')
depends_aarch64=('dkms')
makedepends=('git' 'cmake' 'ninja' 'doxygen')
provides=("libcpuid=${pkgver}")
conflicts=('libcpuid')
source=("git+https://github.com/anrieff/libcpuid.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "$srcdir/$_pkgname" -B build -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dvm644 "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
