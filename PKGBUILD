# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-lua-git
pkgver=0.0.14.r0.gfb30e8c
pkgrel=2
epoch=1
pkgdesc="Lua grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/muniftanjim/tree-sitter-lua"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter-cli' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c scanner.c
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-lua.so"
	install -dv "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -sv "/usr/lib/libtree-sitter-lua.so" "$pkgdir/usr/share/nvim/runtime/parser/lua.so"
	cd "$pkgname"
	install -Dvm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
