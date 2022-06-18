# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=0.7.2
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz")
sha256sums=('d25ebd2ec2e43e257e776515b5c8eb1a325f6ebcf3c7035aea3052361d7060b4')
b2sums=('7a23b5803fca4e45e98732c77474ee09f1b0f89733f25ebf38382d51123296e1386317182985c81468313973f0cb23d74cfde795316b4982a145998081627961')

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
