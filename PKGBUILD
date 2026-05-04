pkgname=batman-rs
pkgver=1.0.2
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
sha256sums=('4e98ee61a9e71474adec85dddc6c722049b5e34ccf60f330fbfb595f25186116')

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
  install -Dm644 "config.toml.sample" "$pkgdir/etc/batman/config.toml"
  install -Dm644 "config.toml.sample" "$pkgdir/usr/share/doc/$pkgname/config.toml.sample"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
