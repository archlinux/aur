# Maintainer: xiretza <aur@xiretza.xyz>

_pkgname=Surelog
pkgname=${_pkgname,,}-git
pkgver=1.75.r1.ge83d01f
pkgrel=1
pkgdesc="SystemVerilog 2017 Pre-processor, Parser, Elaborator, UHDM Compiler."
arch=(x86_64)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('antlr4-runtime' 'uhdm' 'flatbuffers>2.0.6')
makedepends=('git' 'cmake' 'tcl' 'antlr4' 'python' 'nlohmann-json')
checkdepends=('gtest')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=(
	"git+$url"
	"0001-Always-precompile-OVM-UVM.patch"
)
sha256sums=('SKIP'
            '845be86b6d9c9678cb5f8237ac8c6924f6d5a6e153d673debe5589d4c2981b3f')

pkgver() {
	cd "$srcdir/$_pkgname"

	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 < "$srcdir/0001-Always-precompile-OVM-UVM.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DSURELOG_USE_HOST_ALL=on \
		-DQUICK_COMP=on \
		-DANTLR_JAR_LOCATION=/usr/share/java/antlr-complete.jar \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

check() {
	make -C build UnitTests
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
