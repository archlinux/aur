pkgname=batman-rs
pkgver=1.0.0
pkgrel=1
pkgdesc='Battery manager daemon that monitors hardware power events and executes user-defined rules'
arch=('x86_64')
url='https://github.com/DavidMANZI-093/batman-rs'
license=('GPL-3.0-only')
depends=('systemd')
optdepends=(
  'libnotify: desktop notifications via notify-send'
  'power-profiles-daemon: power profile switching via powerprofilesctl'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9b6bbee5d7a0fcb201732cc7e53dc990445022afd1248b5291711c463a52081')

prepare() {
  cd "batman-rs-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "batman-rs-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "batman-rs-$pkgver"

  install -Dm755 "target/release/batman-rs" "$pkgdir/usr/bin/batman"
  install -Dm644 "batman.service" "$pkgdir/usr/lib/systemd/user/batman.service"
  install -Dm644 "config.toml.sample" "$pkgdir/usr/share/doc/$pkgname/config.toml.sample"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
