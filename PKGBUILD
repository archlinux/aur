# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-php
pkgver=0.25.1
pkgrel=1
pkgdesc="PHP grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-php.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-php/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1377ac7d40474e002af12fe098287e065fac6d818d43376dc6617dbc94836ad8')


build() {
  cd "$pkgname-$pkgver"

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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-php"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-php"

  chmod 644 "$pkgdir"/usr/lib/libtree-sitter-php{,_only}.a

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-php.so" "$pkgdir/usr/lib/tree_sitter/php.so"
  ln -s "/usr/lib/libtree-sitter-php_only.so" "$pkgdir/usr/lib/tree_sitter/php_only.so"
}
