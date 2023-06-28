# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=oha-git
pkgver=0.6.0.r2.g0dd7056
pkgrel=1
pkgdesc="Ohayou(おはよう), HTTP load generator, inspired by rakyll/hey with tui animation"
arch=('i686' 'x86_64')
url="https://github.com/hatoo/oha"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
provides=("oha=$pkgver")
conflicts=('oha')
source=("git+https://github.com/hatoo/oha.git")
sha256sums=('SKIP')


prepare() {
  cd "oha"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "oha"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "oha"

  #cargo test \
  #  --frozen
}

package() {
  cd "oha"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/oha"
}
