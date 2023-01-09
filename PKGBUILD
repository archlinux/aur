# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-elixir-git
pkgver=r50.b20eaa7
pkgrel=1
epoch=1
pkgdesc="Elixir grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/elixir-lang/tree-sitter-elixir"
license=('Apache')
groups=('tree-sitter-grammars')
makedepends=('git' 'libc++' 'libtree-sitter.so' 'npm')
provides=("${pkgname%-git}" 'libtree-sitter-elixir.so')
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
	export PARSER_NAME=elixir
	export PREFIX=/usr
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" make install
}
