# Maintainer: xiliuya
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: aperez

pkgname=tree-sitter-cpp
pkgver=0.23.1
pkgrel=1
dep_c_ver=0.23.1
pkgdesc="C++ grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-cpp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('tree-sitter' 'tree-sitter-cli' nodejs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
       "tree-sitter-c-$dep_c_ver.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/refs/tags/v$dep_c_ver.tar.gz")
sha256sums=('3a7b51370ca7116fdc7e2d5ab8753e472072087fcf436210e6089ef7669220cd'
           '8f90f481c28a45c7dcba84d05fc07853df043ff813868cdfa074a3835e89467a')

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
	install -d "$pkgdir/usr/lib/tree_sitter"
	ln -s "/usr/lib/libtree-sitter-cpp.so" "$pkgdir/usr/lib/tree_sitter/cpp.so"
	cd "$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
