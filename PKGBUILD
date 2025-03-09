# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-hostname-git
pkgver=r252.ge9be376
pkgrel=1
pkgdesc="Rust implementation of hostname"
arch=('i686' 'x86_64')
url="https://github.com/uutils/hostname"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("uutils-hostname=$pkgver")
conflicts=('uutils-hostname')
source=("git+https://github.com/uutils/hostname.git")
sha256sums=('SKIP')


prepare() {
  cd "hostname"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "hostname"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "hostname"

  #cargo test \
  #  --frozen
}

package() {
  cd "hostname"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname $path)
    basename=$(basename $path)
    mv "$dir/$basename" "$dir/uutils-$basename"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-hostname"
}
