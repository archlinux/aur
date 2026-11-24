# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/shell>

pkgname=hornero-shell
pkgver=1.3.8
pkgrel=2
pkgdesc="Hornero OS desktop shell, built with Quickshell, QML and Qt for Wayland"
arch=('x86_64')
url="https://github.com/HorneroOS/shell"
license=('GPL-3.0-or-later')
# Official [extra]/quickshell (>= 0.3.2): the shell only uses stable
# Quickshell QML modules (core, Hyprland, Io, Bluetooth,
# Services.Mpris/Notifications/UPower, Wayland, Widgets) and links no
# Quickshell C++ API, so no git-HEAD feature is required. The 0.3.2 minimum
# includes upstream's failed-session-lock acquisition guard (afb2c27), which
# avoids a fatal path on failed/reentrant acquisition; it does not resolve
# every orphaned-lock lifecycle issue tracked upstream in #1054.
depends=(
  'aubio'
  'hornero-config>=0.4.3'
  'horneroctl-bin>=0.2.0_preview51'
  'libqalculate'
  'pipewire'
  'python'
  'qt6-base'
  'qt6-declarative'
  # Hornero Signal typography, RFC 0001 section 3.3; glyphs ship in-tree.
  'ttf-ibm-plex'
  'quickshell>=0.3.2'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'pkgconf'
  'qt6-tools'
)
optdepends=(
  'app2unit: launch apps as systemd user units'
  'libcava: audio spectrum visualiser (resolved at runtime; a missing or ABI-broken libcava only silences the spectrum)'
  'brightnessctl: laptop backlight control'
  'ddcutil: external monitor brightness control'
  'ffmpeg: Hornero Chromatic colours from video wallpapers (one frame)'
  'fish: shell used by helper scripts'
  'hyprland: compositor integration via hyprctl'
  'lm_sensors: temperature sensor readings'
  'networkmanager: network status via nmcli'
  'qt6-imageformats: Hornero Chromatic colours from WebP, AVIF, TIFF and more wallpaper formats'
  'swappy: screenshot annotation'
  'wl-clipboard: clipboard integration via wl-copy'
)
source=("$pkgname::git+https://github.com/HorneroOS/shell.git#commit=8fbc5fcf877f70d202a8104da4c15f6cfb5d4444")
sha256sums=('SKIP')

build() {
  cmake -S "$pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_LIBDIR=/usr/lib/hornero \
    -DINSTALL_QMLDIR=/usr/lib/qt6/qml \
    -DINSTALL_QSCONFDIR=/etc/xdg/quickshell/hornero \
    -DDISTRIBUTOR="arch" \
    -DVERSION="$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Keep the installed helper script executable.
  chmod 755 "$pkgdir/etc/xdg/quickshell/hornero/assets/wrap_term_launch.sh"

  install -Dm644 "$pkgname/LICENSE.GPL-3.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
