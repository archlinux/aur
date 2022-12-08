# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-c
pkgver=0.20.2
pkgrel=1
pkgdesc="C grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-c"
license=('Apache')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'npm')
provides=('libtree-sitter-c.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('af66fde03feb0df4faf03750102a0d265b007e5d957057b6b293c13116a70af2')

prepare() {
	cd "$pkgname-$pkgver"
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $LDFLAGS -shared parser.o -o "$srcdir/c-parser.so"
}

package() {
	install -Dvm644 c-parser.so "$pkgdir/usr/lib/libtree-sitter-c.so"
	install -dv "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -sv "/usr/lib/libtree-sitter-c.so" "$pkgdir/usr/share/nvim/runtime/parser/c.so"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
