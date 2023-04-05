# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typos-git
pkgver=r1330.g66d82e5
pkgrel=1
pkgdesc="Source code spell checker"
arch=('i686' 'x86_64')
url="https://github.com/crate-ci/typos"
license=('apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("typos=$pkgver")
conflicts=('typos')
source=("git+https://github.com/crate-ci/typos.git")
sha256sums=('SKIP')


prepare() {
  cd "typos"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "typos"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "typos"

  #cargo test \
  #  --frozen
}

package() {
  cd "typos"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/typos"
}
