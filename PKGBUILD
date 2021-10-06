# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-javascript-git
pkgver=0.20.0.r0.gfdeb68a
pkgrel=1
pkgdesc="Javascript and JSX grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-javascript"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
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
	cc $CFLAGS -std=c99 -c parser.c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-javascript.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-javascript.so" "$pkgdir/usr/share/nvim/runtime/parser/javascript.so"
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
