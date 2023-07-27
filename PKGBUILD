# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-ocaml-git
pkgver=0.20.4.r0.g694c577
pkgrel=1
pkgdesc="OCaml grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-ocaml"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter-cli' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$srcdir/$pkgname/ocaml/"
	tree-sitter generate
	cd "$srcdir/$pkgname/interface/"
	tree-sitter generate
}

build() {
	cd "$srcdir/$pkgname/ocaml/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $CFLAGS -fPIC -std=c99 -c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser-ocaml.so"
	cd "$srcdir/$pkgname/interface/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $CFLAGS -fPIC -std=c99 -c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser-interface.so"
}

package() {
	install -Dvm 644 parser-ocaml.so "$pkgdir/usr/lib/libtree-sitter-ocaml.so"
	install -Dvm 644 parser-interface.so "$pkgdir/usr/lib/libtree-sitter-ocaml-interface.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-ocaml.so" "$pkgdir/usr/share/nvim/runtime/parser/ocaml.so"
	ln -s "/usr/lib/libtree-sitter-ocaml-interface.so" "$pkgdir/usr/share/nvim/runtime/parser/interface.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
