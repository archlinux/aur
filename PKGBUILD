# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-lua-git
pkgver=1.6.0.r12.g6f5d401
pkgrel=1
pkgdesc="Lua grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/nvim-treesitter/tree-sitter-lua"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter' 'npm')
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
	cc $CFLAGS -std=c99 -c parser.c
	c++ $CPPFLAGS -c scanner.cc
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-lua.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-lua.so" "$pkgdir/usr/share/nvim/runtime/parser/lua.so"
	cd "$pkgname"
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
