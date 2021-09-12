# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=yosys-symbiflow-plugins
pkgname="$_pkgname-git"
pkgver=1.0.0_7_g59ff1e6_23_g3a95697_17_g00b887b.r399.g9fad20e
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
        "0002-Makefile-prepend-to-build-flags.patch"
        "0003-Revert-ci-use-yosys-from-conda.patch")
sha256sums=('SKIP'
            '965862ca2f8a2c45b55cca9be35865a2a45eaa68cc3a2c22f4357bf8a34a2870'
            '0b1948b0f708879beab04e75af88d0cc8d16e8241b7cc6153501baa1fa32e5ef'
            '63f761ca071556bf28f13a04370d8c5bc6775d10f7200f2f8b6af71eb262f978')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Makefile-respect-DESTDIR.patch"
	patch -p1 < "$srcdir/0002-Makefile-prepend-to-build-flags.patch"
	patch -p1 < "$srcdir/0003-Revert-ci-use-yosys-from-conda.patch"

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
