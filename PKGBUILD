# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx-gui
pkgver=0.2.0
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
sha256sums=(''0fe51fa04f1991da3b7a8cd31377e9d698f1362457ae00a7c0d2422556994e38'')

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
