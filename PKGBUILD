# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=1.0.1
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libsodium' 'zstd' 'lmdb')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz"
        liblmdb.pc)
sha256sums=('b10c609acb94102b2aa40596b767bb5ba104283bf7cdf337e0d9ab56aff328b2'
            'd86900623f582ae61441766e68710c6875fb7cda42ce856fc63b7186be04859a')
b2sums=('799de3e9c62f81a1eb0d54a82a71368efb0aa0f5785df18fc2363205e14685aa4a974ce940c660aca477eddf5e98e5726dcf32672bd2136fa99454c9229a332e'
        '35ff7d3ca6c25c2a45bb86b54621d93c368da91522abec5a90437d64ac7159873137fe9fd7eeff2bd53e831b1fab97f6fcbc3a89270db96c9b23d9749c128f9a')

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
    cargo build --frozen --release --no-default-features --features 'system-libs,metrics,k2v,lmdb'
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/garage

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
