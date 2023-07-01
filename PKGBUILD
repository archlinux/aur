# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-python-git
pkgver=0.20.0.r56.g36f9e33
pkgrel=1
pkgdesc="Python grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-python"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -c parser.c
	cc $CFLAGS -c scanner.c
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/python-parser.so"
}

package() {
	install -Dvm 644 python-parser.so "$pkgdir/usr/lib/libtree-sitter-python.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-python.so" "$pkgdir/usr/share/nvim/runtime/parser/python.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
