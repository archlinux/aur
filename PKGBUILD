pkgname=waft-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Waft release bundle with daemon, plugins, overview, settings, and launcher"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/waft"
license=('MIT')
depends=(
  'dbus'
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'libadwaita'
)
optdepends=(
  'brightnessctl: laptop backlight control (brightness plugin)'
  'ddcutil: external monitor brightness control (brightness plugin)'
  'networkmanager: WiFi/Ethernet/VPN management (networkmanager plugin)'
  'bluez: Bluetooth device management (bluez plugin)'
  'bluez-utils: Bluetooth CLI tooling (bluez plugin)'
  'pipewire-pulse: audio device control via pactl (audio plugin)'
  'libpulse: audio device control via pactl (audio plugin)'
  'upower: battery monitoring (battery plugin)'
  'evolution-data-server: calendar integration (eds plugin)'
  'gnome-online-accounts: online account integration (gnome-online-accounts plugin)'
  'gsettings-desktop-schemas: GTK appearance configuration (gsettings plugin)'
  'darkman: dark mode toggle (darkman plugin)'
  'sunsetr: night light control (sunsetr plugin)'
  'syncthing: file sync service toggle (syncthing plugin)'
  'niri: niri compositor integration (niri plugin)'
)
provides=('waft' 'waft-overview' 'waft-settings' 'waft-launcher')
conflicts=('waft' 'waft-git' 'waft-overview' 'waft-overview-git' 'waft-settings' 'waft-settings-git' 'waft-launcher' 'waft-launcher-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ReadyPlayerNaN/waft/releases/download/v$pkgver/waft-$pkgver-x86_64.tar.gz")
sha256sums=('3b47c05fd2a09a06c73ca0798efc33738daf58e161f1e0dfd97781f801852346')

package() {
  cd "$srcdir/waft-$pkgver-x86_64"

  install -Dm755 bin/waft "$pkgdir/usr/bin/waft"
  install -Dm755 bin/waft-overview "$pkgdir/usr/bin/waft-overview"
  install -Dm755 bin/waft-settings "$pkgdir/usr/bin/waft-settings"
  install -Dm755 bin/waft-launcher "$pkgdir/usr/bin/waft-launcher"

  local binary
  for binary in bin/waft-*-daemon; do
    install -Dm755 "$binary" "$pkgdir/usr/bin/$(basename "$binary")"
  done

  install -Dm644 share/dbus-1/services/org.waft.Daemon.service \
    "$pkgdir/usr/share/dbus-1/services/org.waft.Daemon.service"
  install -Dm644 lib/systemd/user/waft.service \
    "$pkgdir/usr/lib/systemd/user/waft.service"
  install -Dm644 share/applications/waft-settings.desktop \
    "$pkgdir/usr/share/applications/waft-settings.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
