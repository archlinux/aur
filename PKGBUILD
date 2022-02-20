# Maintainer: xiretza <aur@xiretza.xyz>

_pkgname=Surelog
pkgname=${_pkgname,,}-git
pkgver=r4293.9605843b0
pkgrel=1
pkgdesc="SystemVerilog 2017 Pre-processor, Parser, Elaborator, UHDM Compiler."
arch=(x86_64)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('antlr4-runtime' 'uhdm' 'flatbuffers')
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
            'a5ccdcb228860b1c20a87a6143a1d4ed32afe3ee246f7585adf1d9854d748aca'
            'c0e6fbdff015e076621f8657d7ec4978b3c346c8ae8a17479497d92d8d8d5dd2'
            'be218b888bec744b7cd490997908eef32d5efeca02bca986d9dd83c8ca3b24b4'
            'c079f04d70faa09ec7dc691549d9d55e924f26649cfab74fa1cdc27792f39420'
            '8dc742b181bc9f7886b8eee2579e3ae50b96d4bebb819c4f27b03db33de538e8')

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
