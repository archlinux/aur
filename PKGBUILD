# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit-git
pkgver=5.0.0.1.r1.g16b1c1c
epoch=1
pkgrel=1
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme' 'qt6-svg')
makedepends=('cmake' 'git' 'clang' 'qt6-tools' 'ninja')
optdepends=('qt6-wayland: Wayland support')
conflicts=('vpkedit' 'vpkedit-bin')
replaces=('vpkedit')
source=("$pkgname::git+$url.git"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"argparse::git+https://github.com/p-ranav/argparse.git"
	"indicators::git+https://github.com/p-ranav/indicators.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"miniaudio::git+https://github.com/mackron/miniaudio.git"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
	#sourcepp submodules
	"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git"
	"hat-trie::git+https://github.com/Tessil/hat-trie.git"
	"git+https://github.com/webmproject/libwebp.git"
	"miniz::git+https://github.com/richgel999/miniz.git"
	"minizip-ng::git+https://github.com/craftablescience/minizip-ng.git"
	"git+https://github.com/phoboslab/qoi.git"
	#discord module
	"git+https://github.com/Tencent/rapidjson.git")
sha256sums=('SKIP'
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
            'SKIP'
            'af1dce846264e0ed075d623f36a66de52189b275290321007841c935a95e8b74')


pkgver(){
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {miniaudio,discord};
	do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	for submodule in {argparse,indicators};
	do
		git config submodule.src/cli/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/shared/thirdparty/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/cmake-helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/shared/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,libwebp,miniz,minizip-ng,qoi}; do
		git config submodule.ext/${submodule}.url "$srcdir/${submodule}"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCPACK_GENERATOR=RPM

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
