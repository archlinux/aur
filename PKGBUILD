# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit-git
pkgver=4.3.0.r5.g1662846
epoch=1
pkgrel=1
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme' 'qt6-svg')
makedepends=('cmake' 'git' 'clang' 'qt6-tools')
optdepends=('qt6-wayland: Wayland support')
conflicts=('vpkedit' 'vpkedit-bin')
replaces=('vpkedit')
source=("$pkgname::git+$url.git"
	"argparse::git+https://github.com/p-ranav/argparse.git"
	"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
	"miniaudio::git+https://github.com/mackron/miniaudio.git"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
	"indicators::git+https://github.com/p-ranav/indicators.git"
	#Submodule for submodules
	"doxygen-awesome-css::git+https://github.com/jothepro/doxygen-awesome-css.git"
	"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git"
	"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
	"miniz::git+https://github.com/richgel999/miniz.git"
	"hat-trie::git+https://github.com/Tessil/hat-trie.git")
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
            'SKIP')


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
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/cli/thirdparty/indicators.url "$srcdir/indicators"
	git config submodule.src/shared/thirdparty/sourcepp.url "$srcdir/sourcepp"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/shared/thirdparty/sourcepp"
	git submodule init
	for submodule in {bufferstream,miniz,minizip-ng,cryptopp,hat-trie}; do
		git config submodule.ext/${submodule}.url "$srcdir/${submodule}"
	done
	git config submodule.docs/layout/doxygen-awesome-css.url "$srcdir/doxygen-awesome-css"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system
	cd "$pkgdir/usr/lib/$pkgname"
	rm -rf libQt*
	ln -sf "/usr/lib/$pkgname/vpkedit" "$pkgdir/usr/bin/vpkedit"
	ln -sf "/usr/lib/$pkgname/vpkeditcli" "$pkgdir/usr/bin/vpkeditcli"

	# Change desktop file to point towards /usr/lib/vpkedit
	cd "$pkgdir/usr/share/applications"
	sed -i 's/Exec=\/opt\/vpkedit\//Exec=/g' vpkedit.desktop

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
