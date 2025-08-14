# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtfpp-git
pkgver=0.1.0.r1.gfe835eb
pkgrel=2
pkgdesc="A Qt6 QImageIO plugin to load VTF textures."
arch=('x86_64')
url="https://github.com/craftablescience/qvtfpp"
license=('LGPL-2.1-only')
depends=('qt6-base' 'glibc' 'gcc-libs')
makedepends=('cmake' 'git' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=("${pkgname::-4}" "${pkgname::-6}")
conflicts=("${pkgname::-4}" "${pkgname::-6}")
source=("git+$url.git"
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
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver(){
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	git submodule init
	git config submodule.ext/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/${pkgname::-4}/ext/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,libwebp,miniz,minizip-ng,qoi};
	do
		git config submodule.ext/${submodule}.url "$srcdir/${submodule}"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname::-4} \
	-DCMAKE_BUILD_TYPE=None \
	-DCPACK_GENERATOR=RPM \
	-GNinja

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
