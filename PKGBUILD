# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=logitech-g435-battery
pkgver=0.2.0
pkgrel=1
pkgdesc="Tray icon showing the battery level of the Logitech G435 wireless headset"
arch=('x86_64' 'aarch64')
url="https://github.com/deddroid/logitech-g435-battery"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'systemd-libs')
makedepends=('cargo')
provides=('g435-tray')
conflicts=('g435-tray')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8f5b3b6b50032e44b4c365e9eb3b9a74b5bec28baadfb8133e6647cacb757b2')

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

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/g435-tray "$pkgdir/usr/bin/g435-tray"
  install -Dm644 packaging/linux/70-logitech-g435.rules "$pkgdir/usr/lib/udev/rules.d/70-logitech-g435.rules"
  install -Dm644 packaging/linux/g435-tray.desktop "$pkgdir/usr/share/applications/g435-tray.desktop"
  install -Dm644 LICENSE THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
