# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-sql
pkgver=0.2.0
pkgrel=2
pkgdesc="SQL grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/DerekStride/tree-sitter-sql"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-sql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d56d0c307c1e64b88bd4da78a23597744093627d93ef0b0c78e7442b139877e')

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
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-sql.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/sql"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/sql/highlights.scm"
	install -Dvm644 "queries/indents.scm" "$pkgdir/usr/share/tree-sitter/queries/sql/indents.scm"
}
