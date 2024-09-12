# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-daemon-git
pkgver=0.1.2r1.7d4820
pkgrel=1
pkgdesc="The core daemon for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url="https://github.com/thealexdev23/power-options"
license=('MIT')

depends=('acpid' 'zsh' 'pciutils' 'usbutils')
optdepends=('xorg-xrandr: needed for screen settings' 'brightnessctl: needed for brightness settings' 'net-tools: needed to disable ethernet cards')
makedepends=('cargo' 'git')

provides=('power-options-daemon')
conflicts=('power-options-daemon')

source=("git+https://github.com/thealexdev23/power-options.git")
sha256sums=('SKIP')

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

post_install() {
  systemctl daemon-reload
  systemctl enable power-options.service
  systemctl start power-options.service
  systemctl restart acpid.service
}

post_upgrade() {
  systemctl daemon-reload
  systemctl restart power-options.service
  systemctl restart acpid.service
}

post_remove() {
  systemctl daemon-reload
}
