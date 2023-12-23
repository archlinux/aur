# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-bash
pkgver=0.20.2
pkgrel=2
pkgdesc="Bash grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-bash"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-bash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0b485dac6a3f8b018c34e62218cc3167b7a5f939fc69023c21fae8c9302e6b7')

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
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-bash.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/bash"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" \
		"$pkgdir/usr/share/tree-sitter/queries/bash/highlights.scm"
}
