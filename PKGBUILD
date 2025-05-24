# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
pkgname=heimdall-grimler
_pkgname=Heimdall
pkgver=2.2.1
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
sha512sums=('48566f8064c9b187e4ba179840d824439ed27aaf9a66572223b02ac228054bd78561ad263333aa4ee6c53375939f64ec53c67a7286d3f75cb271e7a0017886a9'
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
