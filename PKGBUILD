# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Duje Mihanović <duje.mihanovic@skole.hr>
pkgname=heimdall-grimler-git
_pkgname=Heimdall
pkgver=2.1.0.r1.1afaefb
pkgrel=2
pkgdesc="Actively maintained fork of Samsung phone firmware flashing tool"
arch=("x86_64" "i686")
url="https://git.sr.ht/~grimler/Heimdall"
license=('MIT')
depends=('libusb')
makedepends=('git' 'cmake' 'zlib' 'qt5-base')
optdepends=(
	'qt5-base: for Heimdall frontend'
	'zlib: for Heimdall frontend'
)
provides=("heimdall=${pkgver}" "heimdall-git=${pkgver}")
conflicts=('heimdall' 'heimdall-git')
source=(
	"$_pkgname::git+https://git.sr.ht/~grimler/Heimdall"
	'heimdall-frontend.desktop'
)
sha512sums=(
	'SKIP'
	'9bb916b7efcf2384afedf8fc7e7c32948b3dc557839f4c49b40dd2a50ece2e32fca98328cfebc87d2a6dc817942cbfdb3f8dcad93598f990944450632f5e3a07'
)

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/^v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/heimdall-frontend.desktop"
}
