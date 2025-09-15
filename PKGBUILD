# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-go
pkgver=0.25.0
pkgrel=1
pkgdesc="Go grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-go"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2dc241b97872c53195e01b86542b411a3c1a6201d9c946c78d5c60c063bba1ef')

prepare() {
    cd "$pkgname-$pkgver"
    tree-sitter generate
}

build() {
    cd "$pkgname-$pkgver/src/"
    cc -shared -fno-exceptions -g -fPIC -o "$srcdir/parser.so" parser.c
}

package() {
    install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-go.so"
    install -dv "$pkgdir/usr/share/tree-sitter/queries/go"
    cd "$pkgname-$pkgver"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/go/highlights.scm"
    # install -Dvm644 "queries/structure.scm" "$pkgdir/usr/share/tree-sitter/queries/go/structure.scm"
    install -Dvm644 "queries/tags.scm" "$pkgdir/usr/share/tree-sitter/queries/go/tags.scm"
}
