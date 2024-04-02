# Maintainer: mia <mia@mia.jetzt>

pkgname=tree-sitter-bash-highlight
pkgver=0.21.0
pkgrel=1
pkgdesc='Bash grammar for tree-sitter with queries'
arch=('x86_64')
_reponame=tree-sitter-bash
url=https://github.com/tree-sitter/$_reponame
license=('MIT')
makedepends=('git' 'tree-sitter-cli')
source=("source.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
conflicts=('tree-sitter-bash')
sha256sums=('f0515efda839cfede851adb24ac154227fbc0dfb60c6c11595ecfa9087d43ceb')

prepare() {
  cd $_reponame-$pkgver
  tree-sitter generate --no-bindings src/grammar.json
}

build() {
  cd $_reponame-$pkgver
  make PREFIX=/usr PARSER_URL="$url"
}

package() {
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib$_reponame.so \
    "$pkgdir"/usr/lib/tree_sitter/${_reponame#tree-sitter-}.so

  cd $_reponame-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir"/usr/share/doc/$_reponame README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_reponame LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/tree-sitter/queries/bash queries/*
}
