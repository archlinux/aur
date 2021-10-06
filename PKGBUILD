# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tree-sitter-typescript-git
pkgver=0.20.0.r0.gef6ee5b
pkgrel=1
pkgdesc="TypeScript and TSX grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-typescript"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'tree-sitter')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^rust-//;s/-/.r/;s/-/./'
}

# prepare() {
# 	mkdir -p "$srcdir/$pkgname/tree-sitter-javascript/"
# 	mv "$srcdir/grammar.js" "$srcdir/$pkgname/tree-sitter-javascript/"
# 	cd "$srcdir/$pkgname/typescript/"
# 	tree-sitter generate
# 	cd "$srcdir/$pkgname/tsx/"
# 	tree-sitter generate
# }

build() {
	cd "$srcdir/$pkgname/typescript/src/"
	cc $CFLAGS -std=c99 -c parser.c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser-ts.so"

	cd "$srcdir/$pkgname/tsx/src/"
	cc $CFLAGS -std=c99 -c parser.c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser-tsx.so"
}

package() {
	install -Dm 644 parser-ts.so "$pkgdir/usr/lib/libtree-sitter-typescript.so"
	install -Dm 644 parser-tsx.so "$pkgdir/usr/lib/libtree-sitter-tsx.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-typescript.so" "$pkgdir/usr/share/nvim/runtime/parser/typescript.so"
	ln -s "/usr/lib/libtree-sitter-tsx.so" "$pkgdir/usr/share/nvim/runtime/parser/tsx.so"

	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
