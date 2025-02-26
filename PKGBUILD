# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-git
pkgver=0.3.5.r0.g64cb27f
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('ninja' 'cmake' 'git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$pkgname::git+$url.git"
	"git+https://github.com/craftablescience/sourcepp.git"
	"git+https://github.com/p-ranav/argparse.git"
	"git+https://github.com/jothepro/doxygen-awesome-css.git"
	"git+https://github.com/craftablescience/bufferstream.git"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake"
	"git+https://github.com/Tessil/hat-trie.git"
	"git+https://github.com/richgel999/miniz.git"
	"git+https://github.com/zlib-ng/minizip-ng.git"
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
	install -Dm755 "$srcdir/build/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
