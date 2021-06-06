# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-c-git
pkgver=0.19.0.r3.g008008e
pkgrel=1
pkgdesc="C grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-c"
license=('Apache')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter')
optdepends=('neovim-tree-sitter')
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
	cc $LDFLAGS -shared parser.o -o "$srcdir/c-parser.so"
}

package() {
	install -Dvm 644 c-parser.so "$pkgdir/usr/lib/libtree-sitter-c.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-c.so" "$pkgdir/usr/share/nvim/runtime/parser/c.so"
	cd "$pkgname"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
