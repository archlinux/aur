# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-tray-git
pkgver=1.2.2r17.b62549
pkgrel=1
pkgdesc="A system tray item for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon-git' 'yad')
makedepends=('cargo')

provides=('power-options-tray')
conflicts=('power-options-tray')

source=("git+https://github.com/thealexdev23/power-options.git")
sha256sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/power-applet"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/power-applet"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options"

  install -Dm755 "target/release/power-applet" "$pkgdir/usr/bin/power-options-tray"
  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options-tray.png"
  install -Dm755 "install/power-options-tray.desktop" "$pkgdir/etc/xdg/autostart/power-options-tray.desktop"
}
