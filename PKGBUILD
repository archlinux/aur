# Maintainer: bouanto <bouanto at zoho dot com>
pkgname=fairy-stockfish-default-git
pkgver=r6520.8549ed1d
pkgrel=1
pkgdesc="A chess engine derived from Stockfish designed for the support of fairy chess variants and easy extensibility with more games (compiled without largeboards=yes all=yes and with armv8 support)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ianfab/Fairy-Stockfish"
license=('GPL3')
makedepends=('git')
optdepends=('polyglot-winboard: For xboard support')
conflicts=('fairy-stockfish-git' 'fairy-stockfish')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname/src"
	sed -i 's/^EXE = stockfish$/EXE = fairy-stockfish/' Makefile
}

build() {
	[[ $CARCH = 'aarch64' ]] && build_arch="armv8" || build_arch="x86-64"
	cd "$srcdir/$pkgname/src"
	make build ARCH=$build_arch
}

package() {
	cd "$srcdir/$pkgname/src"
	make PREFIX="$pkgdir/usr" install
	install -D -m644 ../Copying.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
