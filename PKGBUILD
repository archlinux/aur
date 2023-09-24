# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=yosys-f4pga-plugins
pkgname="$_pkgname-git"
pkgver=1.20230906.r3.g7c89a55
pkgrel=1
pkgdesc="Plugins for Yosys developed as part of the F4PGA project."
arch=(x86_64)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('yosys>0.12' 'gcc-libs' 'tcl' 'uhdm' 'surelog' 'flatbuffers' 'boost-libs')
makedepends=('git' 'boost')
checkdepends=()
provides=("$_pkgname=$pkgver" "yosys-symbiflow-plugins=$pkgver")
conflicts=("$_pkgname" yosys-symbiflow-plugins)
replaces=(yosys-symbiflow-plugins-git)
source=(
	"git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	# conflicts with quicklogic synth flow in upstream yosys
	sed -i 's/ql-qlf//' Makefile
}

build() {
	cd "$_pkgname"

	make BUILD_UPSTREAM=1 UHDM_INSTALL_DIR=/usr
}

check() {
	cd "$_pkgname"

	# blocked by https://github.com/YosysHQ/yosys/issues/2545
	#make test
}

package() {
	cd "$_pkgname"

	make DESTDIR="$pkgdir" install

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
