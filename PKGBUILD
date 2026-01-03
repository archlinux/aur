# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-jsdoc-git
pkgver=0.25.0.r0.g658d18d
pkgrel=1
pkgdesc="JSDoc grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-jsdoc"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-jsdoc=$pkgver" 'libtree-sitter-jsdoc.so')
conflicts=('tree-sitter-jsdoc')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-jsdoc.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-jsdoc"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-jsdoc"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-jsdoc"

  #tree-sitter test
}

package() {
  cd "tree-sitter-jsdoc"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-jsdoc"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-jsdoc"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-jsdoc.so" "$pkgdir/usr/lib/tree_sitter/jsdoc.so"
}
