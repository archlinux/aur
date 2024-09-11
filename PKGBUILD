# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-daemon
pkgver=0.1.2
pkgrel=1
pkgdesc="The core daemon for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url="https://github.com/thealexdev23/power-options"
license=('MIT')

depends=('acpid' 'zsh' 'pciutils' 'usbutils')
optdepends=('xorg-xrandr: needed for screen settings' 'brightnessctl: needed for brightness settings' 'net-tools: needed to disable ethernet cards')
makedepends=('cargo')

provides=('power-options-daemon')
conflicts=('power-options-daemon-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thealexdev23/power-options/archive/v$pkgver.tar.gz")
sha256sums=('66eeeb9bc9b46288418ac403d775bdba273c4c9b8ba96d857ddd4871b0b9611f')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/power-daemon-mgr"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/power-daemon-mgr"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options-$pkgver"

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
