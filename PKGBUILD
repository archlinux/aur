# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-rust
pkgver=0.20.4
pkgrel=2
pkgdesc="Rust grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-rust"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c75fd52f9ba4abe7a6ed20fc956cb0a67f9b38227c90dc4b71f75fb0a062cde4')

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
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-rust.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/rust"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/rust/highlights.scm"
	install -Dvm644 "queries/injections.scm" "$pkgdir/usr/share/tree-sitter/queries/rust/injections.scm"
	install -Dvm644 "queries/tags.scm" "$pkgdir/usr/share/tree-sitter/queries/rust/tags.scm"
}
