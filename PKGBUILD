# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-json
pkgver=0.20.1
pkgrel=2
pkgdesc="json grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-json"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-json.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('982f994fe9cad9cc5c874d472e11f963b927266f8353a7137da8c62eb1fd1e0e')

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
