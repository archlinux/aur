# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/shell>

pkgname=hornero-shell
pkgver=1.2.39
pkgrel=1
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
  'hornero-config>=0.3.0'
  'horneroctl-bin>=0.2.0_preview17'
  'libcava'
  'libqalculate'
  'pipewire'
  'python'
  'qt6-base'
  'qt6-declarative'
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
  'brightnessctl: laptop backlight control'
  'ddcutil: external monitor brightness control'
  'fish: shell used by helper scripts'
  'hyprland: compositor integration via hyprctl'
  'lm_sensors: temperature sensor readings'
  'networkmanager: network status via nmcli'
  'swappy: screenshot annotation'
  'wl-clipboard: clipboard integration via wl-copy'
)
source=("$pkgname::git+https://github.com/HorneroOS/shell.git#commit=5b25b6e598699f7f99b34211f5f863f17e364db6")
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
