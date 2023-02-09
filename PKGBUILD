# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-r-git
pkgver=r95.80efda5
pkgrel=1
pkgdesc="R grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/r-lib/tree-sitter-r"
license=('MIT')
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
	c++ $CXXFLAGS -c scanner.cc
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-r.so"
	install -dv "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -sv "/usr/lib/libtree-sitter-r.so" "$pkgdir/usr/share/nvim/runtime/parser/r.so"
	cd "$pkgname"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

