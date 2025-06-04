# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.6.0
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('ninja' 'cmake' 'git')
_commit=44255c97ed76e1e4f793ddc15baa10f8fd83e00e
source=("$pkgname::git+$url.git#commit=$_commit"
	"git+https://github.com/craftablescience/cmake-helpers.git"
	"git+https://github.com/craftablescience/sourcepp.git"
	"git+https://github.com/p-ranav/argparse.git"
	"git+https://github.com/SpartanJ/efsw.git"
	"git+https://github.com/jothepro/doxygen-awesome-css.git"
	"git+https://github.com/craftablescience/bufferstream.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake"
	"git+https://github.com/Tessil/hat-trie.git"
	"git+https://github.com/richgel999/miniz.git"
	"git+https://github.com/craftablescience/minizip-ng.git"
	"git+https://github.com/phoboslab/qoi.git"
	)
sha256sums=('c8815e1fff28638228ccd9b047dd64abf5371f03d71b1bf7aa653bcc76c85709'
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
	for submodule in {sourcepp,argparse,efsw};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,miniz,minizip-ng,qoi};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.docs/layout/doxygen-awesome-css.url "$srcdir/doxygen-awesome-css"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DZLIBNG_ENABLE_TESTS=OFF \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
