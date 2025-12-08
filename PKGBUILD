# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-gtk
pkgver=1.2.3
pkgrel=1
pkgdesc="A gtk frontend for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon' 'libadwaita' 'yad')
makedepends=('cargo')

provides=('power-options-gtk')
conflicts=('power-options-gtk-git' 'tlp' 'auto-cpufreq' 'power-profiles-daemon' 'cpupower-gui')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thealexdev23/power-options/archive/v$pkgver.tar.gz")
sha256sums=('e604cc0ef8b786697cda0ff67d5abdff334d2449bf83efba7c2ee0112b6b9f12')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/frontend-gtk"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/frontend-gtk"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options-$pkgver"

  install -Dm755 "target/release/frontend-gtk" "$pkgdir/usr/bin/power-options-gtk"
  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options-gtk.png"
  install -Dm755 "install/power-options-gtk.desktop" "$pkgdir/usr/share/applications/power-options-gtk.desktop"
}
