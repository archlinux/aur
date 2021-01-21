# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Harry Beadle <harrybeadle@protonmail.com>

_pkgname=vtr-verilog-to-routing
pkgname=vtr-git
pkgver=8.0.0.r3288.g991b11422
pkgrel=1
pkgdesc='Open Source CAD Flow for FPGA Research'
arch=(x86_64)
url='https://verilogtorouting.org'
license=(custom)
makedepends=('git' 'cmake')
depends=('gcc-libs')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=('git+https://github.com/verilog-to-routing/vtr-verilog-to-routing'
        'build.patch')
sha256sums=('SKIP'
            '558088f88221325e331062e7351d2b9e26a50169f74ece3ecc3e468180ff05b1')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/build.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DWITH_ABC=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

check() {
	make -C build test
}

package() {
	make -C build DESTDIR="$pkgdir" install

	install -Dm 644 "$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

