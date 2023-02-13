# Maintainer: Michael Dilger <mike@mikedilger.com>
# Maintainer: soloturn@gmail.com

pkgname=gossip
pkgver=0.3.91
pkgrel=1
pkgdesc="gossip nostr client, rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
makedepends=(cargo)
provides=($pkgname)
conflicts=($pkgname)
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mikedilger/gossip/archive/refs/tags/v${pkgver}.tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '69e9858e90a32c9b439b2840b58c7e3d77a4b3b2c6c223c7ac984371c0391ec6'
  'd63b5a204cde01e74c9d1feeef393e30d8aa9ca48715951387e647340f444f55'
)

build() {
  cd $pkgname
  RUSTFLAGS="-C link-arg=--ld-path=/usr/bin/mold -C target-cpu=native --cfg tokio_unstable"
  nice cargo build --release
  strip ./target/release/gossip
}

package() {
  cd $pkgname
  install -Dm755 "./target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./gossip.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  mkdir -p "$pkgdir"/usr/share/applications/
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/"
}
