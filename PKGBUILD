# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-dockerfile-git
pkgver=0.2.0.r2.g971acdd
pkgrel=1
pkgdesc="Dockerfile grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/camdencheek/tree-sitter-dockerfile"
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

build() {
    cd "$pkgname"
    make
}

package() {
        cd "$pkgname"
	install -Dvm 644 libtree-sitter-dockerfile.so "$pkgdir/usr/lib/libtree-sitter-dockerfile.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-dockerfile.so" "$pkgdir/usr/share/nvim/runtime/parser/dockerfile.so"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
