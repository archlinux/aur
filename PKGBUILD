pkgname=fairy-stockfish
pkgver=14.0.1
pkgrel=1
pkgdesc="A chess engine derived from Stockfish designed for the support of fairy chess variants and easy extensibility with more games."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ianfab/Fairy-Stockfish"
license=('GPL3')
makedepends=('git')
optdepends=('polyglot: For xboard support')
_tag=fairy_sf_14_0_1_xq
source=("https://github.com/ianfab/Fairy-Stockfish/archive/refs/tags/$_tag.tar.gz")
sha256sums=('53914fc89d89afca7cfcfd20660ccdda125f1751f59a68b1f3ed1d4eb6cfe805')

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
