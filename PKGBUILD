# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-php-git
pkgver=0.24.2.r4.g7d07b41
pkgrel=1
pkgdesc="PHP grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-php=$pkgver" 'libtree-sitter-php.so')
conflicts=('tree-sitter-php')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-php.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-php"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-php"

  make generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-php"

  #tree-sitter test
}

package() {
  cd "tree-sitter-php"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-php"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-php"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-php.so" "$pkgdir/usr/lib/tree_sitter/php.so"
  ln -s "/usr/lib/libtree-sitter-php_only.so" "$pkgdir/usr/lib/tree_sitter/php_only.so"
}
