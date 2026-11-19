# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx-gui
pkgver=0.1.0.r73
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
sha256sums=(''2d9b98f60ab3c010bd3558a2ae68c4ebc9e1082b5f9c27ebe3dd6dde918fa153'')

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
