# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=yosys-f4pga-plugins
pkgname="$_pkgname-git"
pkgver=1.0.0_7_g59ff1e6_23_g3a95697_17_g00b887b.r515.g3b9e83b
pkgrel=1
pkgdesc="Plugins for Yosys developed as part of the F4PGA project."
arch=(x86_64)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('yosys>0.9' 'gcc-libs' 'tcl' 'uhdm' 'surelog' 'flatbuffers')
makedepends=('git')
checkdepends=()
provides=("$_pkgname=$pkgver" "yosys-symbiflow-plugins=$pkgver")
conflicts=("$_pkgname" yosys-symbiflow-plugins)
replaces=(yosys-symbiflow-plugins-git)
source=("git+$url.git"
        "0001-Makefile-respect-DESTDIR.patch"
        "0002-Makefile-prepend-to-build-flags.patch"
)
sha256sums=('SKIP'
            '74d186214d52126776019098f0bc9f03ab42b0ac0e15a3958312731beb8cdfea'
            '1d7db82077c79fc078ba4c02700a05fcbf28a13dd16ae04c8ddffa4db11f0598')

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
