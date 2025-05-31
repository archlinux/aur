# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils
pkgver=0.8.0
pkgrel=2
pkgdesc="Rust implementation of findutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/findutils/releases/download/$pkgver/source.tar.gz")
sha256sums=('05a8c7d6f3dab9a6261f098b6203e909e1031f79b4a9395d9fe1c2d0a4a966ce')


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

  RUSTONIG_DYNAMIC_LIBONIG=1 \
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
    mv "$dir/$basename" "$dir/uu-$basename"
  done
}
