# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-cpp
pkgver=0.20.3
pkgrel=2
pkgdesc="C++ grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-cpp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c2c32c8875229e264bf86afd04537e2470bb1d259865e2694bf05d8d107c65f')

prepare() {
	cd "$pkgname-$pkgver"
	## TODO: add necessary files to tree-sitter-c and add as makedepends instead
	## of using npm
	npm install --cache "$srcdir/npm-cache" tree-sitter-c
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $CPPFLAGS -std=c99 -c scanner.c
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/cpp-parser.so"
}

package() {
	install -Dm 644 cpp-parser.so "$pkgdir/usr/lib/libtree-sitter-cpp.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-cpp.so" "$pkgdir/usr/share/nvim/runtime/parser/cpp.so"
	cd "$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
