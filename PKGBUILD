# Maintainer: dringsim <dringsim@qq.com>
# Contributor: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-latex-git
pkgver=0.4.0.r40.g7b06f6e
pkgrel=1
pkgdesc="LaTex grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/latex-lsp/tree-sitter-latex"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli' 'npm')
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
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-latex.so"
	install -d "$pkgdir/usr/lib/tree_sitter/"
	ln -s "/usr/lib/libtree-sitter-latex.so" "$pkgdir/usr/lib/tree_sitter/latex.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
