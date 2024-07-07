# Maintainer: xiliuya
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-cpp
pkgver=0.22.2
pkgrel=0
dep_c_ver=0.21.4
pkgdesc="C++ grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-cpp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('tree-sitter' 'tree-sitter-cli')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
       "tree-sitter-c-$dep_c_ver.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/refs/tags/v$dep_c_ver.tar.gz")
sha256sums=('9f8bdf286358ee513553bb97eae0234a85e4e1fc08eb6c0427d0db46631fd91a'
           '19194c47a6faf81509aea338b96dd9b59ffd8a7f26bce6487cf4275065433870')

prepare() {
	mkdir -p "$pkgname-$pkgver"/node_modules
        mv tree-sitter-c-$dep_c_ver tree-sitter-c
        mv tree-sitter-c "$pkgname-$pkgver"/node_modules/
	cd "$pkgname-$pkgver"
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/src/"
	cc $CFLAGS -I. -std=c11 -fPIC  -c parser.c
	cc $CPPFLAGS -I. -std=c11 -fPIC  -c scanner.c
	cc $LDFLAGS -shared -Wl,-soname,libtree-sitter-cpp.so.0 parser.o scanner.o -o "$srcdir/cpp-parser.so"
}

package() {
	install -Dm 644 cpp-parser.so "$pkgdir/usr/lib/libtree-sitter-cpp.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-cpp.so" "$pkgdir/usr/share/nvim/runtime/parser/cpp.so"
	cd "$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
