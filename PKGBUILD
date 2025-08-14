# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtfpp
pkgver=0.1.0
pkgrel=3
pkgdesc="A Qt6 QImageIO plugin to load VTF textures."
arch=('x86_64')
url="https://github.com/craftablescience/qvtfpp"
license=('LGPL-2.1-only')
depends=('qt6-base' 'glibc' 'gcc-libs')
makedepends=('cmake' 'git' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=("${pkgname::-2}")
conflicts=("${pkgname::-2}")
source=("git+$url.git#tag=v${pkgver}"
	"git+${url::-6}sourcepp.git"
	"git+${url::-6}cmake-helpers.git"
	#sourcepp modules
	"git+${url::-6}bufferstream.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git"
	"git+https://github.com/Tessil/hat-trie.git"
	"git+https://github.com/webmproject/libwebp.git"
	"git+https://github.com/richgel999/miniz.git"
	"git+${url::-6}minizip-ng.git"
	"git+https://github.com/phoboslab/qoi.git")
sha256sums=('4963d8317e7f28d9c09b7604c4554b5c9977223f065362c688576cfac7603894'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/${pkgname}"
	git submodule init
	git config submodule.ext/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/${pkgname}/ext/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,libwebp,miniz,minizip-ng,qoi};
	do
		git config submodule.ext/${submodule}.url "$srcdir/${submodule}"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname} \
	-DCMAKE_BUILD_TYPE=None \
	-DCPACK_GENERATOR=RPM \
	-GNinja

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
