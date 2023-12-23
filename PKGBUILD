# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-python
pkgver=0.20.4
pkgrel=2
pkgdesc="python grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-python"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-python.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e38c991832f461c0da8ca222fbe5be3b82b868fe34025f0295206b5e5789d7a')

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
