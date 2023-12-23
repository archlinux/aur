# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-ocaml
pkgver=0.20.4
pkgrel=2
pkgdesc="ocaml grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-ocaml"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-ocaml.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('834dc225b6a00871bd4ba98efcec7f3882f3ec7043c6203fdc12396e77bcde6c')

prepare() {
	cd "$pkgname-$pkgver/ocaml"
	tree-sitter generate
	cd ../interface
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/ocaml/src"
	cc -shared -fno-exceptions -g -fPIC \
		-o "$srcdir/parser.so" scanner.c parser.c
	cd ../../interface/src
	cc -shared -fno-exceptions -g -fPIC \
		-o "$srcdir/parser-interface.so" scanner.c parser.c

}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-ocaml.so"
	# NOTE: some applications may not be aware of this distinction
	install -Dvm644 parser-interface.so "$pkgdir/usr/lib/libtree-sitter-ocaml_interface.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/ocaml"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/ocaml/highlights.scm"
	install -Dvm644 "queries/locals.scm" "$pkgdir/usr/share/tree-sitter/queries/ocaml/locals.scm"
	install -Dvm644 "queries/tags.scm" "$pkgdir/usr/share/tree-sitter/queries/ocaml/tags.scm"
}
