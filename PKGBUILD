# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=0.7.3
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz")
sha256sums=('85200daed3ee6b501be2a36306c90aa02d0d7f600547da4fef627b57c21429df')
b2sums=('af5b8ed712ed15780c9658b32cba4604a66738ec6ebc018aab4b0bd66dc2081f9b5f578dc610abf1a55ad1534c6fa4ed60e56bc25638bfe6cf61fde1b8153bc8')

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
