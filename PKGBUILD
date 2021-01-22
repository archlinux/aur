# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=yosys-symbiflow-plugins
pkgname="$_pkgname-git"
pkgver=1.0.0_7_g59ff1e6_23_g3a95697_17_g00b887b.r235.g2894db2
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
            '679178fe4d27b97b53eabdf5309473eef8002bc8901f1985d92d1f4d8d294be5'
            '5e24155e7a91c1e205ad7adf9637f2d2f73c77e3ff9a2769b75d3f5992866222')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Makefile-respect-DESTDIR.patch"
	patch -p1 < "$srcdir/0002-Makefile-prepend-to-build-flags.patch"
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
