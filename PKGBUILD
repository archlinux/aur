pkgname=keydous-linux
pkgver=0.1.1
pkgrel=1
pkgdesc='Linux bridge for configuring Keydous keyboards with the official web driver'
arch=('x86_64')
url='https://github.com/Arrelin/keydous-linux'
license=('MIT')
depends=('gcc-libs' 'hidapi' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a9c2be406d5d02eff183af3ff82893284089d409d2b419de4e3992137f97410')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  CARGO_TARGET_DIR=target cargo build --release --locked --offline -p keydous-bridge
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/keydous-bridge "$pkgdir/usr/bin/keydous-bridge"
  install -Dm644 packaging/udev/70-keydous-nj98-cp-v4.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-keydous-nj98-cp-v4.rules"
  install -Dm644 packaging/systemd/keydous-bridge.service \
    "$pkgdir/usr/lib/systemd/user/keydous-bridge.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
