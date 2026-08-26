pkgname=waft-git
pkgver=r0.0000000
pkgrel=2
pkgdesc="Waft central daemon and plugin ecosystem (entity-based Wayland desktop services)"
arch=('x86_64' 'aarch64')
url="https://github.com/readyplayernan/waft"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'gtk4' 'libadwaita' 'gtk4-layer-shell')
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
conflicts=('waft' 'waft-overview-git' 'waft-settings-git' 'waft-launcher-git')
replaces=('waft-overview-git' 'waft-settings-git' 'waft-launcher-git')
options=('!lto')
source=("$pkgname::git+https://github.com/readyplayernan/waft.git")
sha256sums=('SKIP')

# Discover plugin daemon binaries from plugins/*/Cargo.toml at build time.
# Any [[bin]] target declared under plugins/<name>/ is bundled with waft.
_discover_plugin_bins() {
  awk '
    /^\[\[bin\]\]/ { in_bin = 1; next }
    /^\[/          { in_bin = 0 }
    in_bin && /^name[[:space:]]*=/ {
      sub(/^[^"]*"/, "")
      sub(/".*$/,   "")
      print
    }
  ' "$srcdir/$pkgname"/plugins/*/Cargo.toml
}

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

  mapfile -t _plugin_bins < <(_discover_plugin_bins)

  local bin_args=(--bin waft --bin waft-overview --bin waft-settings --bin waft-launcher)
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
  cargo test --frozen -p waft -p waft-protocol -p waft-plugin -p waft-overview -p waft-settings -p waft-launcher
}

package() {
  cd "$srcdir/$pkgname"

  mapfile -t _plugin_bins < <(_discover_plugin_bins)

  install -Dm755 "target/release/waft" "$pkgdir/usr/bin/waft"
  install -Dm755 "target/release/waft-overview" "$pkgdir/usr/bin/waft-overview"
  install -Dm755 "target/release/waft-settings" "$pkgdir/usr/bin/waft-settings"
  install -Dm755 "target/release/waft-launcher" "$pkgdir/usr/bin/waft-launcher"

  local b
  for b in "${_plugin_bins[@]}"; do
    install -Dm755 "target/release/$b" "$pkgdir/usr/bin/$b"
  done

  install -Dm644 "data/org.waft.Daemon.service" \
    "$pkgdir/usr/share/dbus-1/services/org.waft.Daemon.service"
  install -Dm644 "data/waft.service" \
    "$pkgdir/usr/lib/systemd/user/waft.service"
  install -Dm644 "data/waft-settings.desktop" \
    "$pkgdir/usr/share/applications/waft-settings.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
