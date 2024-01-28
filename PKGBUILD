# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=diffsitter-git
pkgver=0.8.2.r4.g2484861
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
arch=('i686' 'x86_64')
url="https://github.com/afnanenayet/diffsitter"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("diffsitter=$pkgver")
conflicts=('diffsitter')
source=("git+https://github.com/afnanenayet/diffsitter.git")
sha256sums=('SKIP')


prepare() {
  cd "diffsitter"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "diffsitter"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "diffsitter"

  #cargo test \
  #  --frozen \
  #  --no-default-features \
  #  --features dynamic-grammar-libs
}

package() {
  cd "diffsitter"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --no-default-features \
    --features dynamic-grammar-libs \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/diffsitter"
}
