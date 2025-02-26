# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.3.5
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('ninja' 'cmake' 'git')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/sourcepp.git"
	"git+https://github.com/p-ranav/argparse.git"
	"git+https://github.com/jothepro/doxygen-awesome-css.git"
	"git+https://github.com/craftablescience/bufferstream.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake"
	"git+https://github.com/Tessil/hat-trie.git"
	"git+https://github.com/richgel999/miniz.git"
	"git+https://github.com/zlib-ng/minizip-ng.git"
	)
sha256sums=('9a70881eb576ed57647c893f1b2a74fb5b1d3c3722f030830d4e3094ee9ae59e'
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
	for submodule in {sourcepp,argparse};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,miniz,minizip-ng};
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
	-DZLIBNG_ENABLE_TESTS=OFF

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
