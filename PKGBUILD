# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-c
pkgver=0.20.1
pkgrel=1
pkgdesc="C grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-c"
license=('Apache')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'npm')
provides=('libtree-sitter-c.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ffcc2ef0eded59ad1acec9aec4f9b0c7dd209fc1a85d85f8b0e81298e3dddcc2')

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
	install -Dm 644 c-parser.so "$pkgdir/usr/lib/libtree-sitter-c.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-c.so" "$pkgdir/usr/share/nvim/runtime/parser/c.so"
	cd "$pkgname-$pkgver"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
