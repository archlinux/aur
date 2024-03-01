# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=0.9.2
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libsodium' 'zstd' 'lmdb')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz"
        liblmdb.pc)
sha256sums=('b624bc7ca946f3d5c00e2485b8ac220eb300e82740155c2628405f1faa0bd932'
            'e7f16dd36b51b3c6f16aece988428952c01aca1fefb3687942dfccc03ef62a10')
b2sums=('2d5ca295fdf589d33ab4b0dd76ac5a297791709cf5870677ba917ca5fcaafa7e70f2fba8feca67f10eb487b908b48a39e5a07f9d987a1a612fd835e52c3c16f9'
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
