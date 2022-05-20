# Maintainer: xiretza <aur@xiretza.xyz>

_pkgname=Surelog
pkgname=${_pkgname,,}-git
pkgver=r4745.f96768e1f
pkgrel=1
pkgdesc="SystemVerilog 2017 Pre-processor, Parser, Elaborator, UHDM Compiler."
arch=(x86_64)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('antlr4-runtime' 'uhdm' 'flatbuffers>2.0.6')
makedepends=('git' 'cmake' 'tcl' 'antlr4' 'python')
checkdepends=('gtest')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=(
	"git+$url"
	"0001-Unvendor-dependencies.patch"
	"0002-Don-t-build-hello-worlds.patch"
	"0003-Fix-installation-directories.patch"
	"0004-Fix-install-location-of-cmake-config-files.patch"
	"0005-Build-shared-instead-of-static-library.patch"
)
sha256sums=('SKIP'
            '8d1646ced6b012be4aba7bd33dd9aa31aa2a76874eea450dac9707e0ac751fc3'
            '7d7b916dfad22ca0faaa6328f5bb49e8ab5f90d812e405d0df6be0d0727b5853'
            '6ab489941b309eae5e576de8329a0ec04b5721918613ae6502912201f1f94c12'
            '597f77aa413ea23db8281ab92e3cdb7727021cb7ab4d0f340120bea0faac6026'
            'bec4704a1217922fa22e18e5b4060e64bdcd4f5384fe22b4f80fa8f9012f4e3c')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	for f in "${source[@]}"; do
		if [[ "$f" == *.patch ]]; then
			patch -p1 < "$srcdir/$f"
		fi
	done
}

build() {
	cmake -B build -S "$_pkgname" \
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
