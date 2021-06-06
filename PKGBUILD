# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-go-git
pkgver=0.19.1.r6.geb306e6
pkgrel=1
pkgdesc="Golang grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-go"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $LDFLAGS -shared parser.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-go.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-go.so" "$pkgdir/usr/share/nvim/runtime/parser/go.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
