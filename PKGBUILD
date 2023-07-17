# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-cpp-git
pkgver=0.20.0.r58.g0e7b7a0
pkgrel=1
pkgdesc="C++ grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-cpp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git'  'tree-sitter' 'tree-sitter-cli' 'npm')
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
    npm install --cache "$srcdir/npm-cache" tree-sitter-c
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $CPPFLAGS -c scanner.c
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/cpp-parser.so"
}

package() {
	install -Dvm 644 cpp-parser.so "$pkgdir/usr/lib/libtree-sitter-cpp.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-cpp.so" "$pkgdir/usr/share/nvim/runtime/parser/cpp.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
