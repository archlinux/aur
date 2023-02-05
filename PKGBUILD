# Maintainer: Jim Powers <jim at corruptmemory dot com>

pkgname=tree-sitter-gomod-git
pkgver=4a65743
pkgrel=1
pkgdesc="Golang modfile grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/camdencheek/tree-sitter-go-mod"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git rev-parse --short HEAD
}

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $LDFLAGS -shared parser.o -o "$srcdir/parser.so"
}

package() {
	install -Dm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-gomod.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-gomod.so" "$pkgdir/usr/share/nvim/runtime/parser/gomod.so"
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
