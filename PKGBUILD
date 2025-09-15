# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.8.0
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'qt6-base')
makedepends=('ninja' 'cmake' 'git' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"git+https://github.com/craftablescience/sourcepp.git"
	"git+https://github.com/p-ranav/argparse.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"git+https://github.com/SpartanJ/efsw.git"
	"git+https://github.com/p-ranav/indicators.git"
	"git+https://github.com/Tencent/rapidjson.git"
	"git+https://github.com/craftablescience/bufferstream.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git"
	"git+https://github.com/Tessil/hat-trie.git"
	"git+https://github.com/webmproject/libwebp.git"
	"git+https://github.com/richgel999/miniz.git"
	"git+https://github.com/craftablescience/minizip-ng.git"
	"git+https://github.com/phoboslab/qoi.git"
	)
sha256sums=('a994af5d6526650364df386da3cfd74b99d49718623cf7a7e258b95388825b19'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {sourcepp,argparse,efsw,indicators,discord};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,libwebp,miniz,minizip-ng,qoi};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/discord"
	git submodule init
	git config submodule.thirdparty/rapidjson.url "$srcdir/rapidjson"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DZLIBNG_ENABLE_TESTS=OFF \
	-DMARETF_BUILD_INSTALLER=ON \
	-DCPACK_GENERATOR=RPM \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
