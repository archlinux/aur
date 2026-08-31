# Maintainer: Gareth Hubball <ridecar2@gmail.com>
pkgname=broadcast-gui-git
pkgver=0.5.1.r0.g0000000
pkgrel=1
pkgdesc="GTK4 GUI for AI-powered per-application noise suppression on PipeWire (git version)"
arch=('x86_64')
url="https://github.com/londospark/broadcast"
license=('GPL-3.0-or-later')
depends=('pipewire' 'pipewire-pulse' 'gtk4' 'libadwaita' 'gtk4-layer-shell')
makedepends=('cargo' 'git')
provides=('broadcast-gui')
conflicts=('broadcast-gui' 'broadcast-gui-bin')
source=("$pkgname::git+https://github.com/londospark/broadcast.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p broadcast-gui
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/broadcast-gui "$pkgdir/usr/bin/broadcast-gui"
  install -Dm644 broadcast-gui.desktop "$pkgdir/usr/share/applications/broadcast-gui.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
