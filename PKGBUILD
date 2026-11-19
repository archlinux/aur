# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx-gui
pkgver=0.1.0.r72
pkgrel=1
pkgdesc="Convert GoodNotes notebooks to SVG, PDF, PNG, and Notability .ntb (GUI)"
arch=('x86_64')
url="https://github.com/Coobyk/oblyx"
license=('MIT')
depends=('fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'libx11' 'wayland' 'vulkan-icd-loader')
makedepends=('cargo' 'pkgconf')
optdepends=('poppler: rasterize PDF page backgrounds for SVG/PNG output'
            'oblyx: command-line converter')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Coobyk/oblyx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(''3cf3212fb56254a256e84f0722cedb298ff78def68a12c57f3af14a7d86969fc'')

prepare() {
  cd "oblyx-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "oblyx-$pkgver"
  cargo build --frozen --release --features gui --bin oblyx-gui
}

package() {
  cd "oblyx-$pkgver"
  install -Dm755 "target/release/oblyx-gui" "$pkgdir/usr/bin/oblyx-gui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "assets/oblyx-gui.desktop" \
      "$pkgdir/usr/share/applications/oblyx-gui.desktop"
  install -Dm644 "assets/oblyx.svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/oblyx.svg"
}
