# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

pkgname=deskbrid
pkgver=0.10.0
pkgrel=2
pkgdesc='Linux desktop agent HAL with a JSON-over-Unix-socket protocol'
arch=('x86_64' 'aarch64')
url='https://github.com/coe0718/deskbrid'
license=('MIT')
depends=('brotli' 'gcc-libs' 'glibc' 'openssl' 'zlib' 'zstd')
makedepends=('cargo')
optdepends=(
  'grim: GNOME, Hyprland, Sway, Niri, Wayfire, Labwc, and COSMIC screenshots'
  'wl-clipboard: Wayland clipboard support'
  'ydotool: Wayland keyboard and mouse input injection'
  'python-gobject: GNOME portal screenshot fallback'
  'gstreamer: GNOME Mutter PipeWire capture support'
  'gst-plugin-pipewire: GNOME Mutter PipeWire capture support'
  'xdg-desktop-portal: GNOME portal integration'
  'xdg-desktop-portal-gnome: GNOME portal integration'
  'spectacle: KDE Plasma screenshots'
  'imagemagick: KDE, wlroots, and X11 screenshot processing'
  'wlr-randr: Niri, Wayfire, Labwc, and COSMIC monitor control fallback'
  'wlrctl: Labwc window control'
  'sway: Sway compositor IPC support'
  'niri: Niri compositor IPC support'
  'wayfire: Wayfire compositor IPC support'
  'xdotool: X11 window and input control'
  'wmctrl: X11 window listing and maximize support'
  'xclip: X11 clipboard support'
  'libnotify: desktop notification support'
  'networkmanager: WiFi scanning and connection support'
  'bluez-utils: Bluetooth device management support'
  'pipewire-pulse: audio sink listing and volume control'
  'tesseract: screenshot OCR support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "deskbrid-mcp-log-stderr.patch"
)
b2sums=(
  '81f58a20166c3302e36fa81d5ae2a5785a06f4294599f1b2ac49bee6e6aa462347d8dd14c666c2958bf543af4e4109c46d5a2e090265787444a18815e8b28a8a'
  'SKIP'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 < "${srcdir}/deskbrid-mcp-log-stderr.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --locked --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/deskbrid" "${pkgdir}/usr/bin/deskbrid"
  install -Dm755 "target/release/cosmic-helper" "${pkgdir}/usr/bin/cosmic-helper"
  install -Dm755 "target/release/labwc-helper" "${pkgdir}/usr/bin/labwc-helper"

  install -Dm644 "deploy/org.deskbrid.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/org.deskbrid.policy"

  install -Dm644 "deploy/deskbrid.service" \
    "${pkgdir}/usr/lib/systemd/user/deskbrid.service"
  sed -i 's|/usr/local/bin/deskbrid|/usr/bin/deskbrid|' \
    "${pkgdir}/usr/lib/systemd/user/deskbrid.service"

  install -Dm644 "extensions/deskbrid@deskbrid/metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/deskbrid@deskbrid/metadata.json"
  install -Dm644 "extensions/deskbrid@deskbrid/extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/deskbrid@deskbrid/extension.js"
}
