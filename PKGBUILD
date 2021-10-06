# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-go-git
pkgver=0.19.1.r0.g7f6bfd0
pkgrel=1
pkgdesc="Golang grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-go"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^rust-//;s/-/.r/;s/-/./'
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
	install -Dm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-go.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-go.so" "$pkgdir/usr/share/nvim/runtime/parser/go.so"
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
