# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=2.0.0
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libsodium' 'zstd' 'lmdb')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz"
        liblmdb.pc)
sha256sums=('10c50925c57ca9bd84e4b1395555f21fec7ab5acc74f1fa8ac785a30d62f80b6'
            'd86900623f582ae61441766e68710c6875fb7cda42ce856fc63b7186be04859a')
b2sums=('4dbf9bedf3b26455f9ef3cab65a8578b37788b89a0d4236a8e73c4df333f0114717018fa5c8068e5407faf8fd1a303d01c33185f09ad13a9d27237e28f9f2afd'
        '35ff7d3ca6c25c2a45bb86b54621d93c368da91522abec5a90437d64ac7159873137fe9fd7eeff2bd53e831b1fab97f6fcbc3a89270db96c9b23d9749c128f9a')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR='target' PKG_CONFIG_PATH="$srcdir" \
    cargo build --frozen --release --no-default-features --features 'system-libs,metrics,k2v,lmdb'
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/garage

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
