# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-tray
pkgver=1.2.3
pkgrel=1
pkgdesc="A system tray item for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon' 'yad')
makedepends=('cargo')

provides=('power-options-tray')
conflicts=('power-options-tray-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thealexdev23/power-options/archive/v$pkgver.tar.gz")
sha256sums=('b2cba289feea0414c172cdfef3e7a9b7cf4f07a810668b1b560fcda1eda52888')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/power-applet"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/power-applet"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options-$pkgver"

  install -Dm755 "target/release/power-applet" "$pkgdir/usr/bin/power-options-tray"
  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options-tray.png"
  install -Dm755 "install/power-options-tray.desktop" "$pkgdir/etc/xdg/autostart/power-options-tray.desktop"
}
