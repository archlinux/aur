pkgname=fairy-stockfish
pkgver=13.1
pkgrel=1
pkgdesc="A chess engine derived from Stockfish designed for the support of fairy chess variants and easy extensibility with more games."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ianfab/Fairy-Stockfish"
license=('GPL3')
makedepends=('git')
optdepends=('polyglot: For xboard support')
_tag=fairy_sf_13_1
source=("https://github.com/ianfab/Fairy-Stockfish/archive/refs/tags/$_tag.tar.gz")
sha256sums=("38766773e0bd6888fd65bfb0f78d55e9cb82c0c46d8b4218ac8868febd896bb1")

prepare() {
	cd "$srcdir/Fairy-Stockfish-$_tag/src"
	sed -i 's/^EXE = stockfish$/EXE = fairy-stockfish/' Makefile
}

build() {
	cd "$srcdir/Fairy-Stockfish-$_tag/src"

	case $CARCH in
		"x86_64") arch=x86-64;;
		"i686") arch=x86-32;;
		"aarch64") arch=armv8;;
		*)
			echo "Unmapped architecture"
			exit 1;;
	esac

	make build ARCH=$arch largeboards=yes all=yes
}

package() {
	cd "$srcdir/Fairy-Stockfish-$_tag/src"
	make PREFIX="$pkgdir/usr" install
	install -D -m644 ../Copying.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
