# Maintainer: aksr <aksr at t-com dot me>
pkgname=arasan-chess-git
pkgver=22.1.0.r19.g7982ba9
pkgrel=1
pkgdesc="A chess engine, has no graphical interface, but can be used together with interface programs such as Winboard and xboard."
arch=('i686' 'x86_64')
url="https://github.com/jdart1/arasan-chess"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
	sed -i 's/$(GCCNEW)" "1"/$(GCCNEW)" "0"/' src/Makefile
	sed -i '/^	ln -s/d' src/Makefile
}

build() {
	cd "$srcdir/$pkgname/src"
	make
}

package() {
	cd "$srcdir/$pkgname/src"
	make INSTALL="$pkgdir/usr/lib" install
	mkdir -p $pkgdir/usr/bin
	ln -s -r $pkgdir/usr/lib/arasan-$(grep '^VERSION =.*' Makefile | awk '{print $3}')/arasanx-64 $pkgdir/usr/bin/arasanx
	install -D -m644 ../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 ../doc/license.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
