# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-python
pkgver=0.21.0
pkgrel=2
pkgdesc="python grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-python"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('720304a603271fa89e4430a14d6a81a023d6d7d1171b1533e49c0ab44f1e1c13')

prepare() {
	cd "$pkgname-$pkgver"
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/src/"
	cc -shared -fno-exceptions -g -fPIC \
		-o "$srcdir/parser.so" scanner.c parser.c
}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-python.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/python"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/python/highlights.scm"
	install -Dvm644 "queries/tags.scm" "$pkgdir/usr/share/tree-sitter/queries/python/tags.scm"
}
