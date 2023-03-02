# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-markdown-git
_pkgname="${pkgname%-git}"
pkgver=r210.g10b9b5a
pkgrel=1
pkgdesc="A markdown grammar for tree-sitter"
arch=('any')
url="https://github.com/MDeiml/tree-sitter-markdown"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter' 'npm')
provides=("$_pkgname" "${_pkgname}-inline")
conflicts=("$_pkgname" "${_pkgname}-inline")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

prepare() {
	cd "$pkgname/tree-sitter-markdown"
	tree-sitter generate
	cd "../tree-sitter-markdown-inline"
	tree-sitter generate
}

build() {
	ls "$pkgname"
	cd "$pkgname/tree-sitter-markdown/src"
	cc $CFLAGS -fPIC -std=c99 -c parser.c
	cc $CFLAGS -fPIC -std=c99 -c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
	cd "../../tree-sitter-markdown-inline/src"
	cc $CFLAGS -fPIC -std=c99 -c parser.c
	cc $CFLAGS -fPIC -std=c99 -c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser-inline.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-markdown.so"
	install -Dvm 644 parser-inline.so "$pkgdir/usr/lib/libtree-sitter-markdown-inline.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-markdown.so" "$pkgdir/usr/share/nvim/runtime/parser/markdown.so"
	ln -s "/usr/lib/libtree-sitter-markdown-inline.so" "$pkgdir/usr/share/nvim/runtime/parser/markdown_inline.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
