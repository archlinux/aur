# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-json
pkgver=0.24.8
pkgrel=1
pkgdesc="JSON grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-json"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-json')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acf6e8362457e819ed8b613f2ad9a0e1b621a77556c296f3abea58f7880a9213')

prepare() {
	cd "$pkgname-$pkgver"
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/src/"
	cc -shared -fno-exceptions -g -fPIC \
		-o "$srcdir/parser.so" parser.c
}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-json.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/json"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/json/highlights.scm"
}
