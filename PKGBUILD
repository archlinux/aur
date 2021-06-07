# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-lua-git
pkgver=1.6.0.r10.gb6d4e9e
pkgrel=1
pkgdesc="Lua grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/nvim-treesitter/tree-sitter-lua"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c
	c++ $CPPFLAGS -c scanner.cc
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-lua.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-lua.so" "$pkgdir/usr/share/nvim/runtime/parser/lua.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
