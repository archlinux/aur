# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-haskell-git
pkgver=0.13.0.r80.g237f4eb
pkgrel=1
pkgdesc="Haskell grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-haskell"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter>=0.19.4' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -fPIC -c parser.c
	c++ $CPPFLAGS -c -fPIC scanner.cc
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-haskell.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-haskell.so" "$pkgdir/usr/share/nvim/runtime/parser/haskell.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
