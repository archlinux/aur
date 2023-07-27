# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-toml-git
pkgver=0.5.1.r2.g8bd2056
pkgrel=2
pkgdesc="TOML grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/ikatyang/tree-sitter-toml"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli' 'npm')
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
	npm install --cache "$srcdir/npm-cache" regexp-util
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-toml.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-toml.so" "$pkgdir/usr/share/nvim/runtime/parser/toml.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
