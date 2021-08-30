# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mcfly-git
pkgver=0.5.9.r1.g032190a
pkgrel=1
pkgdesc="Fly through your shell history"
arch=('i686' 'x86_64')
url="https://github.com/cantino/mcfly"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('mcfly')
conflicts=('mcfly')
source=("git+https://github.com/cantino/mcfly.git")
sha256sums=('SKIP')


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
    --locked \
    --release
}

package() {
  cd "mcfly"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/mcfly"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mcfly"
}
