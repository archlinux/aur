# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=yosys-symbiflow-plugins
pkgname="$_pkgname-git"
pkgver=1.0.0_7_g59ff1e6_23_g3a95697_17_g00b887b.r405.g041f93b
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
)
sha256sums=('SKIP'
            '5c2da350d8326fb4cc7d255aa2dbcdab296648f0ef96c267d0c48e00f1a114f1'
            'bc876f94e81121c79b871f747f86ad231d1f627ee7e51e40f7001fd8d0bd21ec')

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
