# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-bibtex-git
pkgver=r8.ccfd77d
pkgrel=3
pkgdesc="BibTeX grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/latex-lsp/tree-sitter-bibtex"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter' 'npm')
optdepends=('texlab' 'tree-sitter-latex')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $LDFLAGS -shared parser.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-bibtex.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-bibtex.so" "$pkgdir/usr/share/nvim/runtime/parser/bibtex.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

