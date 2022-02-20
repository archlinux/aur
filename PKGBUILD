_pkgname=UHDM
pkgname=${_pkgname,,}-git
pkgver=r1270.ad9a41e
pkgrel=2
pkgdesc="A complete modeling of the IEEE SystemVerilog Object Model"
arch=(x86_64)
url="https://github.com/chipsalliance/UHDM"
license=('Apache')
depends=('capnproto')
makedepends=('git' 'cmake' 'python' 'python-orderedmultidict' 'gtest')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=(
	"git+$url"
	"0001-Remove-unnecessary-submodules.patch"
	"0002-Install-libuhdm.so-to-usr-lib.patch"
	"0003-Install-capnp-file-to-usr-share.patch"
)
sha256sums=('SKIP'
            'e58d2c3ec4b156f647b2ff8c025ef3c69da3c11bbc0cf9ed5e3469f00b036cdc'
            '299f80979c633f2219435f5a69063489b80ece349cf69f92c2ea66e3eee0ace0'
            '99a3ec356b42bf537099dcae1d938634380e793f22c7e6b8c73d0d5165b7b953')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 < "$srcdir/0001-Remove-unnecessary-submodules.patch"
	patch -p1 < "$srcdir/0002-Install-libuhdm.so-to-usr-lib.patch"
	patch -p1 < "$srcdir/0003-Install-capnp-file-to-usr-share.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=on \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

check() {
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
