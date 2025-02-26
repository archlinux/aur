# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils
pkgver=0.7.0
pkgrel=1
pkgdesc="Rust implementation of findutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/findutils/releases/download/$pkgver/source.tar.gz")
sha256sums=('08427e0589fb938c7fb342e49e1afd87fc87cb0d6691aed13830148188b813fe')


prepare() {
  cd "findutils-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "findutils-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "findutils-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-findutils"

  rm "$pkgdir/usr/bin/testing-commandline"

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname $path)
    basename=$(basename $path)
    mv "$dir/$basename" "$dir/uutils-$basename"
  done
}
