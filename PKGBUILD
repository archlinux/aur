# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cfnts-git
pkgver=r205.g3d9c673
pkgrel=2
pkgdesc="NTS protocol implementation written in Rust"
arch=('i686' 'x86_64')
url="https://blog.cloudflare.com/announcing-cfnts/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("cfnts=$pkgver")
conflicts=('cfnts')
source=("git+https://github.com/cloudflare/cfnts.git")
sha256sums=('SKIP')


prepare() {
  cd "cfnts"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "cfnts"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "cfnts"

  #RUSTFLAGS="-C target-feature=+aes,+ssse3" cargo test \
  #  --frozen
}

package() {
  cd "cfnts"

  RUSTFLAGS="-C target-feature=+aes,+ssse3" cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/cfnts"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cfnts"
}
