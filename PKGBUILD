# Maintainer: xiretza <aur@xiretza.xyz>

_pkgname=UHDM
pkgname=${_pkgname,,}-git
pkgver=r2067.496bb31
pkgrel=1
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
)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

}

build() {
	cmake -B build -S "$_pkgname" \
		-DUHDM_USE_HOST_GTEST=on \
		-DUHDM_USE_HOST_CAPNP=on \
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
