# Maintainer: h0lylag <h0lylag@gravemind.sh>

pkgname=eve-preview-manager
pkgver=1.6.0
pkgrel=1
pkgdesc="EVE Online window preview manager"
arch=('x86_64')
url="https://github.com/h0lylag/EVE-Preview-Manager"
license=('MIT')
options=('!debug')
depends=('fontconfig' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme' 'libxcursor' 'libxrandr' 'libxi')
makedepends=('rust' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/h0lylag/EVE-Preview-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92621e15b71e65f6d953a6cdcd8761163e922e4c1f80043492981d2dae9319cf')

prepare() {
  cd "EVE-Preview-Manager-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  sed -i "s/^Icon=.*/Icon=$pkgname/" assets/com.evepreview.manager.desktop
}

build() {
  cd "EVE-Preview-Manager-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "EVE-Preview-Manager-${pkgver}"
  install -Dm755 "target/release/eve-preview-manager" "$pkgdir/usr/bin/eve-preview-manager"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/com.evepreview.manager.desktop "$pkgdir/usr/share/applications/eve-preview-manager.desktop"
  install -Dm644 assets/com.evepreview.manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/eve-preview-manager.svg"
}
