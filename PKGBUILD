# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=0.5.0
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz")
sha256sums=('bcb5817b3725877d8d7ef100ce544c4a4d70824412840a148893a02493097bed')
b2sums=('acd602e6abd71f84d351c8d0159e6518a09c4ffc43629701c872cc31d6d01a184e6bab64fa06508360cd1d4b7e6b40e8d1a16d906a5702e73541fd476c4e80a7')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/garage

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
