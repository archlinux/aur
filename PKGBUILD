# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Harry Beadle <harrybeadle@protonmail.com>

_pkgname=vtr-verilog-to-routing
pkgname=vtr-git
pkgver=8.0.0.r3658.g448b8e124
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
        '0001-aligned_allocator-add-operator.patch'
)
sha256sums=('SKIP'
            '6d360513c8b10738c77dfe8a91421ba47f5fcdfba9d083ef42caf0802215fdb9')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-aligned_allocator-add-operator.patch"
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

