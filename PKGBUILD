# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-bash-git
pkgver=0.19.0.r33.g1b0321e
pkgrel=1
pkgdesc="Bash shell grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-bash"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
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
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c
	cc $CFLAGS -std=c99 -c scanner.c
	c++ $LDFLAGS -shared parser.o scanner.o -o "$srcdir/bash-parser.so"
}

package() {
	install -Dvm 644 bash-parser.so "$pkgdir/usr/lib/libtree-sitter-bash.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-bash.so" "$pkgdir/usr/share/nvim/runtime/parser/bash.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
