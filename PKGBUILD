# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
pkgname=heimdall-grimler
_pkgname=Heimdall
pkgver=2.1.0
pkgrel=1
pkgdesc="Actively maintained fork of Samsung phone firmware flashing tool"
arch=("x86_64" "i686")
url="https://git.sr.ht/~grimler/Heimdall"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libusb')
makedepends=('cmake' 'zlib' 'qt5-base')
optdepends=(
	'qt5-base: for Heimdall frontend'
	'zlib: for Heimdall frontend'
)
provides=("heimdall=${pkgver}" 'heimdall-git' 'heimdall-grimler-git')
conflicts=('heimdall' 'heimdall-git' 'heimdall-grimler-git')
source=(
	"$pkgname-$pkgver.tar.gz::https://git.sr.ht/~grimler/$_pkgname/archive/v$pkgver.tar.gz"
	'heimdall-frontend.desktop'
)
sha512sums=(
	'75c58cdfaa183e1a8a73127875f716cf168da3a109eefafc7bf1fe9573b9d716da23ff15d0df93474568a678a1b38e71611c745b688c3bc024e70672d921fdd6'
	'b9830d3f8d08132ecb2083b1cde875b500358a24dbae0b9217401d542beb5e121534949686a8fb58c8d6294b86cf81b806ca7c94327026017275cc4fbe8cf2a1'
)

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
