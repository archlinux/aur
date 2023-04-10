# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typst-lsp-git
pkgver=0.3.2.r0.g387e3f3
pkgrel=1
pkgdesc="Language server for Typst"
arch=('i686' 'x86_64')
url="https://github.com/nvarner/typst-lsp"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("typst-lsp=$pkgver")
conflicts=('typst-lsp')
source=("git+https://github.com/nvarner/typst-lsp.git")
sha256sums=('SKIP')


prepare() {
  cd "typst-lsp"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "typst-lsp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "typst-lsp"

  #cargo test \
  #  --frozen
}

package() {
  cd "typst-lsp"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT.txt" -t "$pkgdir/usr/share/licenses/typst-lsp"
}
