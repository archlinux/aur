# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-gtk-git
pkgver=1.2.3r1.e96e78
pkgrel=1
pkgdesc="A gtk frontend for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon-git' 'libadwaita' 'yad')
makedepends=('cargo' 'git')

provides=('power-options-gtk')
conflicts=('power-options-gtk' 'tlp' 'auto-cpufreq' 'power-profiles-daemon' 'cpupower-gui')

source=("git+https://github.com/thealexdev23/power-options.git")
sha256sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/frontend-gtk"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/frontend-gtk"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options"

  install -Dm755 "target/release/frontend-gtk" "$pkgdir/usr/bin/power-options-gtk"
  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options-gtk.png"
  install -Dm755 "install/power-options-gtk.desktop" "$pkgdir/usr/share/applications/power-options-gtk.desktop"
}
