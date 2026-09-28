pkgname=waft-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Waft central daemon and plugin ecosystem (prebuilt release binaries)"
arch=('x86_64')
url="https://github.com/readyplayernan/waft"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'gtk4' 'libadwaita' 'gtk4-layer-shell')
optdepends=(
  'brightnessctl: laptop backlight control (brightness plugin)'
  'ddcutil: external monitor brightness control (brightness plugin)'
  'networkmanager: WiFi/Ethernet/VPN management (networkmanager plugin)'
  'bluez: Bluetooth device management (bluez plugin)'
  'bluez-utils: Bluetooth CLI tooling (bluez plugin)'
  'pipewire-pulse: audio device control via pactl (audio plugin)'
  'libpulse: audio device control via pactl (audio plugin)'
  'upower: battery monitoring (power plugin)'
  'power-profiles-daemon: power profile management (power plugin)'
  'evolution-data-server: calendar integration (eds plugin)'
  'gnome-online-accounts: online account integration (gnome-online-accounts plugin)'
  'gsettings-desktop-schemas: GTK appearance configuration (gsettings plugin)'
  'darkman: dark mode toggle (darkman plugin)'
  'sunsetr: night light control (sunsetr plugin)'
  'syncthing: file sync service toggle (syncthing plugin)'
  'niri: niri compositor integration (niri plugin)'
)
provides=('waft')
conflicts=('waft' 'waft-git' 'waft-overview-git' 'waft-settings-git' 'waft-launcher-git')
source_x86_64=("waft-${pkgver}-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/waft/releases/download/v${pkgver}/waft-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('d7ffb579eb3ebbd4d31c15646f797637116e1b07f8448b9d522e6f3a633cef30')

package() {
  local root="$srcdir/waft-${pkgver}-x86_64"
  local binary

  install -Dm755 "$root/bin/waft" "$pkgdir/usr/bin/waft"
  install -Dm755 "$root/bin/waft-overview" "$pkgdir/usr/bin/waft-overview"
  install -Dm755 "$root/bin/waft-settings" "$pkgdir/usr/bin/waft-settings"
  install -Dm755 "$root/bin/waft-launcher" "$pkgdir/usr/bin/waft-launcher"

  for binary in "$root"/bin/waft-*-daemon; do
    install -Dm755 "$binary" "$pkgdir/usr/bin/$(basename "$binary")"
  done

  install -Dm644 "$root/share/dbus-1/services/org.waft.Daemon.service" \
    "$pkgdir/usr/share/dbus-1/services/org.waft.Daemon.service"
  install -Dm644 "$root/lib/systemd/user/waft.service" \
    "$pkgdir/usr/lib/systemd/user/waft.service"
  install -Dm644 "$root/share/applications/waft-settings.desktop" \
    "$pkgdir/usr/share/applications/waft-settings.desktop"
  install -Dm644 "$root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
