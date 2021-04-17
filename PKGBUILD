# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=yosys-symbiflow-plugins
pkgname="$_pkgname-git"
pkgver=1.0.0_7_g59ff1e6_23_g3a95697_17_g00b887b.r305.g9e969e2
pkgrel=1
pkgdesc="Plugins for Yosys developed as part of the SymbiFlow project."
arch=(x86_64)
url="https://github.com/SymbiFlow/yosys-symbiflow-plugins"
license=('ISC')
depends=('yosys>0.9' 'gcc-libs' 'tcl')
makedepends=('git')
checkdepends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git"
        "0001-Makefile-respect-DESTDIR.patch"
        "0002-Makefile-prepend-to-build-flags.patch")
sha256sums=('SKIP'
            '489561c4913b24c5a3d9b759f8b5b4c818767208d1c381c142798dda44afaba1'
            'c94d506b6f50976716833fb3237570a579285cd0ab667c7b90e730de7fae7a55')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Makefile-respect-DESTDIR.patch"
	patch -p1 < "$srcdir/0002-Makefile-prepend-to-build-flags.patch"

	# conflicts with quicklogic synth flow in upstream yosys
	sed -i 's/ql-qlf//' Makefile
}

build() {
	cd "$_pkgname"

	make
}

check() {
	cd "$_pkgname"

	# blocked by https://github.com/YosysHQ/yosys/issues/2545
	#make test
}

package() {
	cd "$_pkgname"

	make DESTDIR="$pkgdir" install

	install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
