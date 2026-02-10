# Maintainer: John Downey <jdowney at gmail.com>

pkgname=tree-sitter-gleam
pkgver=1.1.0
pkgrel=1
pkgdesc="Gleam grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/gleam-lang/tree-sitter-gleam"
license=('Apache-2.0')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-gleam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e6f07141a154caf62dc344ede958f70d4f84cae516bb9274ffb53983d0146e0')

prepare() {
    cd "$pkgname-$pkgver"
    tree-sitter generate
}

build() {
    cd "$pkgname-$pkgver/src/"
    cc -shared -fno-exceptions -g -fPIC -I. -o "$srcdir/parser.so" parser.c scanner.c
}

package() {
    install -Dvm755 parser.so "$pkgdir/usr/lib/libtree-sitter-gleam.so"
    install -dv "$pkgdir/usr/share/tree-sitter/queries/gleam"
    cd "$pkgname-$pkgver"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/gleam/highlights.scm"
    install -Dvm644 "queries/injections.scm" "$pkgdir/usr/share/tree-sitter/queries/gleam/injections.scm"
    install -Dvm644 "queries/locals.scm" "$pkgdir/usr/share/tree-sitter/queries/gleam/locals.scm"
    install -Dvm644 "queries/tags.scm" "$pkgdir/usr/share/tree-sitter/queries/gleam/tags.scm"
}
