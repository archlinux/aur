# Maintainer: mia <mia@mia.jetzt>

pkgname=tree-sitter-toml
pkgver=0.5.1
pkgrel=2
pkgdesc='Toml grammar for tree-sitter with queries'
arch=('x86_64')
_reponame=tree-sitter-toml
url=https://github.com/ikatyang/$_reponame
license=('MIT')
makedepends=('git' 'tree-sitter-cli' 'npm')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('23be3c5d7e65b60460f2a31994c808cfc154aab2ac93c4f51041525986bee337')

prepare() {
  cd $_reponame-$pkgver
  tree-sitter generate src/grammar.json
}

build() {
  cd $_reponame-$pkgver/src
  cc $CFLAGS -I. -std=c99 -c parser.c scanner.c
  cc $LDFLAGS -shared parser.o scanner.o -o "$srcdir/parser.so"
}

package() {
  install -Dvm 644 parser.so "$pkgdir/usr/lib/lib$_reponame.so.0.0"
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib$_reponame.so.0.0 "$pkgdir"/usr/lib/tree_sitter/${_reponame#tree-sitter-}.so
  ln -s lib$_reponame.so.0.0 "$pkgdir/usr/lib/lib$_reponame.so.0"
  ln -s lib$_reponame.so.0.0 "$pkgdir/usr/lib/lib$_reponame.so"

  cd $_reponame-$pkgver
  install -Dm644 -t "$pkgdir"/usr/share/doc/$_reponame README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_reponame LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/tree-sitter/queries/toml queries/*
}
