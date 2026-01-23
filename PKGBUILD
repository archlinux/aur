# Maintainer: James Liu <contact at no-bull dot sh>

pkgname=reflector-rs
pkgver=1.1.0
pkgrel=1
pkgdesc='Retrieve and filter the latest Arch Linux mirror list (Rust implementation)'
arch=('x86_64')
url='https://github.com/james7132/reflector-rs'
license=('GPL-2.0-or-later')
provides=('reflector')
conflicts=('reflector')
depends=('openssl')
makedepends=('cargo' 'git' 'rust' 'gzip')
backup=('etc/xdg/reflector/reflector.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7071e7c2de7c7b441d919e738c6cd977f1b11c065fb497b99c4f480a0809fc7a')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --offline --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
  gzip man/reflector.1
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/reflector" \
    "$pkgdir/usr/bin/reflector"

  # Install systemd service and timer
  install -Dm644 "dist/reflector.service" \
    "$pkgdir/usr/lib/systemd/system/reflector.service"
  install -Dm644 "dist/reflector.timer" \
    "$pkgdir/usr/lib/systemd/system/reflector.timer"

  # Install default configuration
  install -Dm644 "dist/reflector.conf" \
    "$pkgdir/etc/xdg/reflector/reflector.conf"

  # Install man page
  install -Dm644 "man/reflector.1.gz" "$pkgdir/usr/share/man/man1/reflector.1.gz"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
