# Maintainer: xiliuya
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-cpp
pkgver=0.22.0
pkgrel=1
pkgdesc="C++ grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-cpp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
       "tree-sitter-c-0.21.0.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/refs/tags/v0.21.0.tar.gz")
sha256sums=('f04d2f8cf2a5d22e5f819dbd49cdb6fc25b531debff464abfe0cab742c1148a5'
           '6f0f5d1b71cf8ffd8a37fb638c6022fa1245bd630150b538547d52128ce0ea7e')

prepare() {
	mkdir -p "$pkgname-$pkgver"/node_modules
        mv tree-sitter-c-0.21.0 tree-sitter-c
        mv tree-sitter-c "$pkgname-$pkgver"/node_modules/
	cd "$pkgname-$pkgver"
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
