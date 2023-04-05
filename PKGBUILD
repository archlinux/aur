# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mcfly-git
pkgver=0.8.0.r5.g2e22bab
pkgrel=1
pkgdesc="Fly through your shell history"
arch=('i686' 'x86_64')
url="https://github.com/cantino/mcfly"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("mcfly=$pkgver")
conflicts=('mcfly')
source=("git+https://github.com/cantino/mcfly.git")
sha256sums=('SKIP')


prepare() {
  cd "mcfly"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "mcfly"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "mcfly"

  cargo test \
    --frozen
}

package() {
  cd "mcfly"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mcfly"
}
