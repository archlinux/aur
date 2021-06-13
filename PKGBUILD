# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-elixir-git
pkgver=r198.7402438
pkgrel=1
pkgdesc="Elixir grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/ananthakumaran/tree-sitter-elixir"
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
	c++ $CPPFLAGS -c scanner.cc
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-elixir.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-elixir.so" "$pkgdir/usr/share/nvim/runtime/parser/elixir.so"
	cd "$pkgname"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

