# Maintainer: Joseph Quinn <quinn.josephr@proton.me>
pkgname=linux-fan-utility
pkgver=0.1.0
pkgrel=1
pkgdesc="A Linux fan control daemon and TUI client using hwmon sysfs"
arch=('x86_64')
url="https://github.com/pegasusheavy/linux-fan-utility"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pegasusheavy/linux-fan-utility/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1b2a746ea74bf106e487e29fdcd321368e83e14aafaee3a0c353a389827c98d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # Binaries
  install -Dm755 "target/release/fanctl-daemon" "$pkgdir/usr/bin/fanctl-daemon"
  install -Dm755 "target/release/fanctl-tui" "$pkgdir/usr/bin/fanctl-tui"

  # systemd unit
  install -Dm644 "fanctl-daemon.service" "$pkgdir/usr/lib/systemd/system/fanctl-daemon.service"

  # Default config directory
  install -dm755 "$pkgdir/etc/fanctl"

  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
