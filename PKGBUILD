# Maintainer: dringsim <dringsim@qq.com>
# Contributor: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-make-git
pkgver=r45.a4b9187
pkgrel=1
pkgdesc="GNU Makefile grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/alemuller/tree-sitter-make"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
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
	install -Dm644 parser.so "$pkgdir/usr/lib/libtree-sitter-make.so"
	install -d "$pkgdir/usr/lib/tree_sitter"
	ln -s "/usr/lib/libtree-sitter-make.so" "$pkgdir/usr/lib/tree_sitter/make.so"
	install -d "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/parser/"
	ln -s "/usr/lib/libtree-sitter-make.so" "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/parser/make.so"
	cd "$pkgname"
	install -Dm644 queries/highlights.scm -t "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/queries/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
