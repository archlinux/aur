# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=mdrv-db
pkgver=0.4.0
pkgrel=1
pkgdesc="Fjall durability envelope around a SQL data port and content-addressed blob store (fleet CLI)"
arch=('x86_64' 'aarch64')
url="https://crates.io/crates/mdrv-db"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
source=("mdrv-db-$pkgver.crate::https://static.crates.io/crates/mdrv-db/mdrv-db-$pkgver.crate")
sha256sums=('374955a81ce8bca13028cc7b4ee138fb25eb6709d80f76eafbeaea772cf5c833')
options=('!debug' '!lto')

build() {
  cd "mdrv-db-$pkgver"
  cargo build --release --locked
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
