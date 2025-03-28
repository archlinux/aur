# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=yosys-slang-git
pkgver=8.0.0
pkgrel=1
epoch=

pkgdesc="SystemVerilog frontend for Yosys"
arch=('x86_64')
url="https://github.com/povik/yosys-slang"
license=('custom')

depends=('yosys')
makedepends=('cmake' 'git' 'gcc')

conflicts=('slang-verilog' 'slang-verilog-git')

source=(
	"git+https://github.com/povik/yosys-slang.git"
	"Makefile.patch"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

prepare() {
	cd "$srcdir/yosys-slang"
	git submodule init
	git submodule update third_party/slang
	patch -p1 < ../Makefile.patch
}

pkgver() {
	cd "$srcdir/yosys-slang/third_party/slang"

	local ver_maj=`cat CMakeLists.txt | sed -nE 's/set\(SLANG_VERSION_MAJOR +([^ ]+)\)/\1/p'`
	local ver_min=`cat CMakeLists.txt | sed -nE 's/set\(SLANG_VERSION_MINOR +([^ ]+)\)/\1/p'`
	# FIXME More complicated stuff would be needed to extract the real SLANG_VERSION_PATCH using cmake
	local ver_pat=0

	echo "$ver_maj.$ver_min.$ver_pat"
}

build() {
	cd "$srcdir/yosys-slang"
	make configure-slang
	make VERBOSE=1
}

package() {
	cd "$srcdir/yosys-slang"
	make DESTDIR="$pkgdir/" install
	# With slang 8.0.0 a lot of undesired stuff get installed, remove it
	rm -rf "$pkgdir/"home
}

