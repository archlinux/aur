# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-kotlin-git
pkgver=0.2.6.r6.g48bfb38
pkgrel=1
pkgdesc="Kotlin grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tormodatt/tree-sitter-kotlin"
license=('MIT')
groups=('tree-sitter-grammars')
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
	cc $CFLAGS -std=c99 -c parser.c
	cc $LDFLAGS -shared parser.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-kotlin.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-kotlin.so" "$pkgdir/usr/share/nvim/runtime/parser/kotlin.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
