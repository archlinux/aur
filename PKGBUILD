# Maintainer Ally Sawada:  <Ally Sawada>

pkgname=tree-sitter-fish-git
pkgver=v3.7.0.b0ca570
pkgrel=1
pkgdesc="Fish shell grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/allysawada/tree-sitter-fish-aur"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'tree-sitter' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("https://github.com/allysawada/tree-sitter-fish-aur/archive/refs/heads/master.zip")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	(set -o pipefail
	printf "v3.7.0.%s" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$pkgname"
	npm install
	npm run build
}

build() {
	cd "$pkgname/src/"
	cc $CFLAGS -std=c99 -c parser.c scanner.c
	cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-fish.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-fish.so" "$pkgdir/usr/share/nvim/runtime/parser/fish.so"
	cd "$pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
