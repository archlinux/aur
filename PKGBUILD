pkgname=waft-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Waft central daemon and plugin ecosystem (entity-based Wayland desktop services)"
arch=('x86_64' 'aarch64')
url="https://github.com/readyplayernan/waft"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus')
makedepends=('cargo' 'git' 'rust')
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
provides=('waft')
conflicts=('waft')
source=("$pkgname::git+https://github.com/readyplayernan/waft.git")
sha256sums=('SKIP')

# Plugin daemons bundled with the waft package.
# Keep in sync with the 18-plugin set documented in AGENTS.md.
_plugin_bins=(
  waft-audio-daemon
  waft-battery-daemon
  waft-bluez-daemon
  waft-brightness-daemon
  waft-caffeine-daemon
  waft-clock-daemon
  waft-darkman-daemon
  waft-eds-daemon
  waft-gnome-online-accounts-daemon
  waft-gsettings-daemon
  waft-keyboard-layout-daemon
  waft-networkmanager-daemon
  waft-niri-daemon
  waft-notifications-daemon
  waft-sunsetr-daemon
  waft-syncthing-daemon
  waft-systemd-daemon
  waft-weather-daemon
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  local bin_args=(--bin waft)
  local b
  for b in "${_plugin_bins[@]}"; do
    bin_args+=(--bin "$b")
  done

  cargo build --frozen --release "${bin_args[@]}"
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p waft -p waft-protocol -p waft-plugin
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/waft" "$pkgdir/usr/bin/waft"

  local b
  for b in "${_plugin_bins[@]}"; do
    install -Dm755 "target/release/$b" "$pkgdir/usr/bin/$b"
  done

  install -Dm644 "data/org.waft.Daemon.service" \
    "$pkgdir/usr/share/dbus-1/services/org.waft.Daemon.service"
  install -Dm644 "data/waft.service" \
    "$pkgdir/usr/lib/systemd/user/waft.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
