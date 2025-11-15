# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.9.2
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'qt6-base')
makedepends=('ninja' 'cmake' 'git' 'vulkan-headers')
source=("$pkgname::git+$url.git#commit=ede259dfc2a7eaf18a79f444c34de3077ce2ab6d"
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
sha256sums=('e83ffda006c359b701e4eb200b5f2881a9c63c16c79956decfbb8d261020eead'
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
