# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=0.9.3
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libsodium' 'zstd' 'lmdb')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz"
        liblmdb.pc)
sha256sums=('c1b7cbe0b68e7fb8e02012b9b05b51066a5e35db52fcd8547552810b5529d54d'
            'e7f16dd36b51b3c6f16aece988428952c01aca1fefb3687942dfccc03ef62a10')
b2sums=('0814779ebfad90e8fe377f43031ed3897f62eb2b4991b2ae770a95ae947f0c9f9e674c16a7ad567650d15417bad1c139cba9076803cab695a7ab99378213e3db'
        '70d030159429fba38f766164a2a6317feb60a7ce0ea7995a54691c5acedd2492f44cd26509d7c268cc58211bcb13d0d6dd861f2722cb04c4a76374393e67f1f4')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname"

  rm .cargo/config.toml
  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR='target' \
  PKG_CONFIG_PATH="$srcdir" \
    cargo build --frozen --release --no-default-features --features 'system-libs,metrics,k2v,lmdb,sled'
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/garage

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
