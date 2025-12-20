# Maintainer: h0lylag <h0lylag@gravemind.sh>

pkgname=eve-preview-manager
pkgver=1.4.0
pkgrel=1
pkgdesc="EVE Online window preview manager"
arch=('x86_64')
url="https://github.com/h0lylag/EVE-Preview-Manager"
license=('MIT')
options=('!debug')
depends=('fontconfig' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme' 'libxcursor' 'libxrandr' 'libxi')
makedepends=('rust' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/h0lylag/EVE-Preview-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ebd97dc7d579d3ea8a95504670d28b5cf5c21ea4272395974fa5fb10ab715b51')

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
