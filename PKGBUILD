pkgname=hiresti
pkgver=1.9.7
pkgrel=1
pkgdesc="High-Res TIDAL player for Linux with bit-perfect playback support"
arch=('x86_64')
url="https://github.com/yelanxin/hiresTI"
license=('GPL-3.0-or-later')
# Disable makepkg's LTO option: ring 0.17 ships C code via cc-rs; when
# CachyOS-style makepkg.conf appends -flto=auto to CFLAGS, ring's bitcode
# objects fail to merge into the cdylib, leaving ring_core_* symbols
# undefined at runtime ("undefined symbol: ring_core_0_17_14__LIMBS_*").
options=('!lto')
_tag="v${pkgver}"
_srcdir="hiresTI-${pkgver}"
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
  'python-opengl'
  'python-pyaes'
  'python-ratelimit'
  'python-requests'
  'python-six'
  'python-tidalapi'
  'python-typing_extensions'
  'python-setproctitle'
  'libusb'
  'mesa'
  'libglvnd'
  'webkitgtk-6.0'
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
  "${pkgname}-${pkgver}.tar.gz::https://github.com/yelanxin/hiresTI/archive/refs/tags/${_tag}.tar.gz"
)
sha256sums=(
  '586e5853ec1b5597aace3d2dd22a37872573b7697048f0abb1da482e5f98f50a'
)

build() {
  cd "${srcdir}/${_srcdir}"

  cargo build --manifest-path src_rust/rust_audio_core/Cargo.toml --release
  cargo build --manifest-path src_rust/rust_viz_core/Cargo.toml --release
  cargo build --manifest-path src_rust/rust_launcher/Cargo.toml --release
}

package() {
  cd "${srcdir}/${_srcdir}"

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
