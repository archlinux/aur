# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-clojure-git
pkgver=0.0.8.r2.gf7d100c
pkgrel=1
pkgdesc="Clojure grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/sogaiu/tree-sitter-clojure"
license=('custom:CC0')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter' 'npm')
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
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-clojure.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-clojure.so" "$pkgdir/usr/share/nvim/runtime/parser/clojure.so"
	cd "$pkgname"
	install -Dvm 644 COPYING.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

