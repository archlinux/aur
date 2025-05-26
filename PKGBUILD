# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
pkgname=heimdall-grimler
_pkgname=Heimdall
pkgver=2.2.2
pkgrel=1
pkgdesc="Actively maintained fork of Samsung phone firmware flashing tool"
arch=("x86_64" "i686")
url="https://git.sr.ht/~grimler/Heimdall"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libusb')
makedepends=('cmake' 'zlib' 'qt6-base')
optdepends=(
	'qt6-base: for Heimdall frontend'
	'zlib: for Heimdall frontend'
)
provides=("heimdall=${pkgver}" 'heimdall-git' 'heimdall-grimler-git')
conflicts=('heimdall' 'heimdall-git' 'heimdall-grimler-git')
source=(
	"$pkgname-$pkgver.tar.gz::https://git.sr.ht/~grimler/$_pkgname/archive/v$pkgver.tar.gz"
	'heimdall-frontend.desktop'
)
sha512sums=('75c3614b1c7dcbcd5537a308ddd3e2adb97024c7d9572ad2a9187ff50f516209995cf9ab65efa9dd282b925687af70a61298cf0e07b5dca333b589e37b2a14e3'
            'b9830d3f8d08132ecb2083b1cde875b500358a24dbae0b9217401d542beb5e121534949686a8fb58c8d6294b86cf81b806ca7c94327026017275cc4fbe8cf2a1')

build() {
	cd "$srcdir/$_pkgname-v$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$_pkgname-v$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/$_pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/heimdall-frontend.desktop"
}
