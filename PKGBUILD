# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-elixir
pkgver=0.3.5
pkgrel=1
pkgdesc="Elixir grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/elixir-lang/tree-sitter-elixir"
license=('Apache-2.0')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-elixir.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/elixir-lang/tree-sitter-elixir/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d8bf37949e2bea75a19d38491d7680ed1c9f0f5a41a5235832d718ec174c7c4')


build() {
  cd "$pkgname-$pkgver"

  export PARSER_NAME="elixir"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "$pkgname-$pkgver"

  #tree-sitter test
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-elixir"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-elixir.so" "$pkgdir/usr/lib/tree_sitter/elixir.so"
}
