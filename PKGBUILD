# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-bash-git
pkgver=0.23.3.r4.g0c46d79
pkgrel=3
pkgdesc="Bash grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-bash"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-bash=$pkgver" 'libtree-sitter-bash.so')
conflicts=('tree-sitter-bash')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-bash.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-bash"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-bash"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-bash"

  #tree-sitter test
}

package() {
  cd "tree-sitter-bash"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-bash"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-bash"
}
