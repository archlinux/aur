pkgname=aercast
pkgver=0.1.4
pkgrel=1
pkgdesc='Native Linux/Wayland screen sharing over HTTP'
arch=('x86_64')
url='https://github.com/Xarth-Mai/Aercast'
license=('MPL-2.0')
depends=(
  'gst-libav'
  'gst-plugin-pipewire'
  'gst-plugin-va'
  'gst-plugins-bad-libs'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'libpipewire'
  'libxkbcommon'
  'vulkan-icd-loader'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=('cargo' 'clang' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('16673fc2cd905ee1578686c80f79d31fd718793af329715b877b1724cd002839')

prepare() {
  cd "Aercast-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Aercast-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "Aercast-$pkgver"
  cargo test --frozen
}

package() {
  cd "Aercast-$pkgver"
  install -Dm755 target/release/aercast "$pkgdir/usr/bin/aercast"
  install -Dm644 assets/aercast-icon.png "$pkgdir/usr/share/pixmaps/aercast.png"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/aercast.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Aercast
Comment=Share your screen directly from Linux
Exec=aercast
Icon=aercast
Terminal=false
Categories=AudioVideo;Network;
Keywords=Wayland;Screen;Sharing;Streaming;
EOF
}
