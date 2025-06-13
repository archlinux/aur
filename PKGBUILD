# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=garage
pkgver=1.2.0
pkgrel=1
pkgdesc="Garage, an S3-compatible distributed object store for self-hosted deployments"
url="https://garagehq.deuxfleurs.fr"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libsodium' 'zstd' 'lmdb')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v$pkgver.tar.gz"
        liblmdb.pc)
sha256sums=('ebf02859194a88a12f84e78d43c1c2ad5132fae3527e88ad7c86c69e9aadf370'
            'd86900623f582ae61441766e68710c6875fb7cda42ce856fc63b7186be04859a')
b2sums=('72ee3bc24ecfe871fbe58499b3071052492164b7f72ff880d480608304cd4151565873c64ce040787402196d2ff4a0e141dded8cd998a3f2d056b5f49106f561'
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
