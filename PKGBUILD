# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils
pkgver=0.9.1
pkgrel=2
pkgdesc="Rust implementation of findutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('glibc' 'libgcc' 'oniguruma')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/findutils/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d6dc466b7953f170cc7a4332c1576c5171b7d497b64e08cc63b3fcf54085e0ac')


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
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uu-$basename"
  done
}
