# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=0.8.2
pkgrel=2
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libsodium' 'zstd')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz")
sha256sums=('f39ea1a8bd64ff3b4cf6ab9ab09b2bc71aa0a374d0f11039d08f8e13672a256a')
b2sums=('e82a3d32e6f2eb56319c866e82281b7538b384c5f2fa91109729f26e1bda344b0207262d4c36f61daf2c1ed6c3d0cb6f6788dc3110ec657526702f05adc3d259')

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
    cargo build --frozen --release --no-default-features --features 'system-libs,metrics,k2v'
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/garage

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
