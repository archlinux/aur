# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Duje Mihanović <duje.mihanovic@skole.hr>
pkgname=heimdall-grimler-git
_pkgname=Heimdall
pkgver=2.2.1.r0.f0c09e9
pkgrel=1
pkgdesc="Actively maintained fork of Samsung phone firmware flashing tool"
arch=("x86_64" "i686")
url="https://git.sr.ht/~grimler/Heimdall"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libusb')
makedepends=('git' 'cmake' 'zlib' 'qt6-base')
optdepends=(
	'qt6-base: for Heimdall frontend'
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
	'b9830d3f8d08132ecb2083b1cde875b500358a24dbae0b9217401d542beb5e121534949686a8fb58c8d6294b86cf81b806ca7c94327026017275cc4fbe8cf2a1'
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
