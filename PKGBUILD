# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/shell>

pkgname=hornero-shell
pkgver=1.0.0
pkgrel=1
pkgdesc="Hornero OS desktop shell, built with Quickshell, QML and Qt for Wayland"
arch=('x86_64')
url="https://github.com/HorneroOS/shell"
license=('GPL-3.0-or-later')
depends=(
  'aubio'
  'libcava'
  'libqalculate'
  'pipewire'
  'qt6-base'
  'qt6-declarative'
  'quickshell-git'
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
source=("$pkgname::git+https://github.com/HorneroOS/shell.git")
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
