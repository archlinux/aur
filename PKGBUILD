pkgname=hiresti
pkgver=1.4.9
pkgrel=1
pkgdesc="High-Res TIDAL player for Linux with bit-perfect playback support"
arch=('x86_64')
url="https://github.com/yelanxin/hiresTI"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gst-plugin-pipewire'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gst-python'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'libpulse'
  'pipewire'
  'python'
  'python-cairo'
  'python-dateutil'
  'python-gobject'
  'python-isodate'
  'python-mpegdash'
  'python-pyaes'
  'python-requests'
  'python-six'
  'python-tidalapi'
  'python-typing_extensions'
)
makedepends=(
  'cargo'
  'clang'
  'pkgconf'
  'rust'
)
optdepends=(
  'python-pillow: tray icon image loading'
  'python-pystray: system tray integration'
  'python-qrcode: QR-code login flow'
)
conflicts=(
  'hiresti-bin'
  'hiresti-git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/yelanxin/hiresTI/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  'a2568f28b4ae918be77cd7933d9404bd77eae4b432874742d65531d3c29bd466'
)

build() {
  cd "${srcdir}/hiresTI-${pkgver}"

  cargo build --manifest-path src_rust/rust_audio_core/Cargo.toml --release
  cargo build --manifest-path src_rust/rust_viz_core/Cargo.toml --release
  cargo build --manifest-path src_rust/rust_launcher/Cargo.toml --release
}

package() {
  cd "${srcdir}/hiresTI-${pkgver}"

  local app_dir="${pkgdir}/usr/share/${pkgname}"

  install -d "${app_dir}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons/hicolor"
  install -d "${pkgdir}/usr/share/metainfo"

  cp -a src/. "${app_dir}/"
  cp -a icons "${app_dir}/"

  install -Dm644 version.txt "${app_dir}/version.txt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 src_rust/rust_audio_core/target/release/librust_audio_core.so \
    "${app_dir}/src_rust/rust_audio_core/target/release/librust_audio_core.so"
  install -Dm755 src_rust/rust_viz_core/target/release/libviz_core.so \
    "${app_dir}/src_rust/rust_viz_core/target/release/libviz_core.so"
  install -Dm755 src_rust/rust_launcher/target/release/hiresti \
    "${pkgdir}/usr/bin/hiresti"

  cp -a icons/hicolor/. "${pkgdir}/usr/share/icons/hicolor/"
  install -Dm644 icons/hicolor/128x128/apps/hiresti.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.hiresti.player.png"
  install -Dm644 icons/hicolor/scalable/apps/hiresti.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hiresti.player.svg"

  cat > "${pkgdir}/usr/share/applications/com.hiresti.player.desktop" <<'EOF'
[Desktop Entry]
Name=HiresTI
Comment=High-Res TIDAL player for Linux
Exec=hiresti
Icon=hiresti
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Player;Music;
StartupWMClass=HiresTI
EOF

  install -Dm644 flatpak/com.hiresti.player.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.hiresti.player.metainfo.xml"
}
