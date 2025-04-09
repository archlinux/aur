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

conflicts=()

source=(
	"git+https://github.com/povik/yosys-slang.git"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd "$srcdir/yosys-slang"
	git submodule init
	git submodule update third_party/fmt
	git submodule update third_party/slang
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
	#cd "$srcdir/"

	cmake -S yosys-slang -B build \
		-DCMAKE_INSTALL_PREFIX=/usr

	make -C build VERBOSE=1

}

package() {
	cd "$srcdir/build"

	make DESTDIR="$pkgdir/" install

}

