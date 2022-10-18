# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Duje Mihanović <duje.mihanovic@skole.hr>
pkgname=heimdall-grimler-git
_pkgname=Heimdall
pkgver=2.0.2.r0.02b577e
pkgrel=1
pkgdesc="Actively maintained fork of Samsung phone firmware flashing tool"
arch=("x86_64" "i686")
url="https://git.sr.ht/~grimler/Heimdall"
license=('MIT')
depends=('libusb')
makedepends=('git' 'cmake' 'zlib' 'qt5-base' 'mesa')
optdepends=(
	'qt5-base: for Heimdall frontend'
)
provides=('heimdall=${pkgver}' 'heimdall-git=${pkgver}')
conflicts=('heimdall' 'heimdall-git')
source=("$_pkgname::git+https://git.sr.ht/~grimler/Heimdall")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/^v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make DESTDIR="$pkgdir/" install
	install -m644 -D "$srcdir/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
