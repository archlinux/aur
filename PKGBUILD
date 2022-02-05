# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=tree-sitter-hcl
pkgver=0.6.0
pkgrel=1
pkgdesc="Tree-sitter grammar for the HCL language"
arch=('x86_64')
url="https://github.com/MichaHoffmann/tree-sitter-hcl"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'tree-sitter' 'npm')
provides=("${pkgname}")
source=("https://github.com/MichaHoffmann/tree-sitter-hcl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("77a9f76849dd749bf5c1b752173bfdde1ebf202376875e0790c9037c13a89981")

# pkgver() {
#     cd "$pkgname"
#     ( set -o pipefail
#       git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
#       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#     )
# }

prepare() {
    cd "$pkgname-$pkgver"
	tree-sitter generate
}

check() {
    cd "$pkgname-$pkgver"
    tree-sitter test
}

build() {
    cd "$pkgname-$pkgver/src/"
    cc $CFLAGS -c parser.c scanner.cc
    cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
	install -Dvm 644 parser.so "$pkgdir/usr/lib/libtree-sitter-hcl.so"
	install -d "$pkgdir/usr/share/nvim/runtime/parser/"
	ln -s "/usr/lib/libtree-sitter-hcl.so" "$pkgdir/usr/share/nvim/runtime/parser/hcl.so"
    cd "$pkgname-$pkgver"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

