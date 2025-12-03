# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-daemon-git
pkgver=1.2.3r1.e96e78
pkgrel=1
pkgdesc="The core daemon for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url="https://github.com/thealexdev23/power-options"
license=('MIT')

depends=('acpid' 'pciutils' 'usbutils' 'yad')
optdepends=(
'brightnessctl: needed for brightness settings' 
'net-tools: needed to disable ethernet cards' 'net-tools: needed to disable ethernet cards'
'xorg-xrandr: needed for screen settings' 
'xorg-xset: needed to configure screen turn off timeout'
'xautolock: needed to configure system suspend timeout'
)
makedepends=('cargo' 'git')

provides=('power-options-daemon')
conflicts=('power-options-daemon')

source=("git+https://github.com/thealexdev23/power-options.git")
sha256sums=('SKIP')

install="daemon.install"

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/power-daemon-mgr"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/power-daemon-mgr"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options"

  install -Dm755 "target/release/power-daemon-mgr" "$pkgdir/usr/bin/power-daemon-mgr"

  # Generate files
  "$pkgdir/usr/bin/power-daemon-mgr" -v generate-base-files --path "$pkgdir" --program-path "/usr/bin/power-daemon-mgr"
}
