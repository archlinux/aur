# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=mdrv-db
pkgver=0.6.5
pkgrel=1
pkgdesc="Fjall durability envelope around a SQL data port and content-addressed blob store (fleet CLI)"
arch=('x86_64' 'aarch64')
url="https://crates.io/crates/mdrv-db"
license=('MIT')
depends=('libgcc')
# rustup instead of the distro rust: turso_core 0.8.x does not compile on
# rustc >= 1.100 (E0308 in index_method/fts/directory.rs), and Arch ships the
# latest stable. 1.99.1 is substituted from rust-toolchain.toml by CI.
makedepends=('rustup')
source=("mdrv-db-$pkgver.crate::https://static.crates.io/crates/mdrv-db/mdrv-db-$pkgver.crate")
sha256sums=('ae4a0b57708db974ba8e9b097a4f53795966f4d900d24d036780df858291ed40')
options=('!debug' '!lto')

build() {
  cd "mdrv-db-$pkgver"
  export RUSTUP_TOOLCHAIN=1.99.1
  # the CLI bin requires the `turso` feature; without it only the lib is built
  # and package() below finds no binary
  cargo build --release --locked --features turso
}

package() {
  cd "mdrv-db-$pkgver"
  install -Dm755 target/release/mdrv-db "$pkgdir/usr/bin/mdrv-db"
  ./target/release/mdrv-db completion > mdrv-db.yaml
  install -Dm644 mdrv-db.yaml "$pkgdir/usr/share/carapace/specs/mdrv-db.yaml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  echo "==> carapace-bin loads user specs ONLY from ~/.config/carapace/specs"
  echo "==> (the /usr/share copy is not read as of carapace-bin 1.7.3)."
  echo "==> Enable completions:  mdrv-db completion install"
}
