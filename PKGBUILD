# Maintainer: asafelobotomy
# Builds from the tagged GitHub Release's source tarball (the AUR package). To build this
# checkout instead, run scripts/build-local-pkg.sh (it swaps the source for `git archive HEAD`).
# pkgver is the Cargo.toml version with '-rc.N' written 'rcN' (pacman forbids '-');
# scripts/bump-version.sh keeps them in step.
pkgname=uq
pkgver=0.3.0rc2
pkgrel=1
_tag=${pkgver/rc/-rc.}
pkgdesc="Themeable Hyprland desktop: shell, theme and layout daemon, CLI and base config"
arch=(x86_64)
url="https://github.com/asafelobotomy/uq"
license=(MIT)
depends=(uq-hyprland-pin dbus glib2 qt6ct gcc-libs 'quickshell>=0.3.1' 'quickshell<0.4' brightnessctl upower systemd noto-fonts-emoji
  kirigami qqc2-desktop-style qt6-declarative kvantum polkit)
makedepends=(cargo qt6-base qt6-declarative)
checkdepends=(lua qt6-declarative)
optdepends=(
  'kitty: default terminal (SUPER+Return)'
  'papirus-icon-theme: icon theme used by every uQ theme'
  'bibata-cursor-theme: cursor theme used by every uQ theme'
  'ttf-jetbrains-mono: monospace font'
  'inter-font: interface font'
  'wireplumber: volume keys and the Sound settings page'
  'playerctl: media keys'
  'networkmanager: network status in the shell and the Network settings page'
  'scdr: CPU priorities for the focused app and builds (enable scdr-session; uQ starts it)'
  'tailscale: exit-node and VPN status in the shell'
  'bluez: Bluetooth status in the shell and the Bluetooth settings page'
  'power-profiles-daemon: power profile switching'
  'hyprlock: fallback lock for the SUPER+CTRL+L recovery bind'
  'noti-fi: notification backend'
  'fprintd: fingerprint unlock'
  'crum-bs: uninstall apps with their leftovers and clean up storage'
  'xzram: the Memory and swap page in Settings'
  'scale_tail: the Tailscale page and quick-settings tile'
  'greetd: the uQ login screen (run0 uqctl greeter enable)'
  'networkmanager-openvpn: OpenVPN connections on the Network settings page'
  'sound-theme-freedesktop: the test sound on the Sound settings page'
  'xorg-xrandr: tells X11 apps which display is the main one'
)
# Keep !lto: rustc links with lld, and makepkg's LTO flags make the cxx-qt C++ objects unreadable to it.
options=(!lto)
backup=(etc/pam.d/uq-lock etc/pam.d/uq-lock-fingerprint etc/uq/greetd.toml etc/uq/greeter.toml)
# The release asset, not GitHub's /archive/ tarball: that one is generated on demand and its bytes
# (so its checksum) can change. The release workflow uploads exactly this file and prints its sum.
source=("$pkgname-$_tag.tar.gz::$url/releases/download/v$_tag/$pkgname-$_tag.tar.gz")
# The release asset's sha256 for this tag; update it with pkgver at each release (docs/releasing.md).
sha256sums=('e2e93b51e1029dacefc0c78755c8ae5e89e727ede820545f9e337742632023dd')

prepare() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p uqd -p uqctl -p uq-settings -p uq-settings-helper
}

check() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
  # Shell checks, when the tools are present (qs and qmltestrunner ship with quickshell and Qt).
  scripts/lint-shell.sh
  scripts/lint-settings.sh
  local qmltest=/usr/lib/qt6/bin/qmltestrunner
  [ -x "$qmltest" ] || qmltest=$(command -v qmltestrunner || true)
  if [ -n "$qmltest" ]; then
    QT_QPA_PLATFORM=offscreen "$qmltest" -import shell -input tests/qml
    QT_QPA_PLATFORM=offscreen "$qmltest" -import apps/uq-settings/qml -input tests/settings-qml
  fi
}

package() {
  cd "$srcdir/$pkgname-$_tag"
  install -Dm755 target/release/uqd "$pkgdir/usr/bin/uqd"
  install -Dm755 target/release/uqctl "$pkgdir/usr/bin/uqctl"
  install -Dm755 scripts/uq-dev "$pkgdir/usr/bin/uq-dev"
  # The uQ session entry: runs `uqctl setup` on first login, then Hyprland.
  install -Dm755 packaging/uq-session "$pkgdir/usr/bin/uq-session"
  install -Dm644 packaging/uq.desktop "$pkgdir/usr/share/wayland-sessions/uq.desktop"
  install -Dm644 config/hypr/base.lua "$pkgdir/usr/share/uq/hypr/base.lua"
  install -dm755 "$pkgdir/usr/share/uq"
  cp -r --no-preserve=ownership themes templates "$pkgdir/usr/share/uq/"
  # templates/ also holds the integration templates (widget, settings page, provider) as
  # reference copies; never a build of the provider example.
  rm -rf "$pkgdir/usr/share/uq/templates/provider/target" \
    "$pkgdir/usr/share/uq/templates/provider/Cargo.lock" \
    "$pkgdir/usr/share/uq/templates/provider/.gitignore"
  # Every theme variant's tokens.json, rendered by uqd's renderer, for the greeter (it never reads
  # a home directory). The themes loader skips this rendered/ directory.
  target/release/uqctl render-themes --themes themes --templates templates \
    "$pkgdir/usr/share/uq/themes/rendered"
  # The whole shell tree (QML, shell/core/qmldir, logic/*.js).
  find shell -type f -exec install -Dm644 {} "$pkgdir/usr/share/uq/{}" \;
  # The lock instance (its own Quickshell config). lock/core, lock/logic and lock/auth are
  # symlinks to the shell's: Quickshell only imports from inside the config directory.
  find lock -type f -exec install -Dm644 {} "$pkgdir/usr/share/uq/{}" \;
  ln -s ../shell/core "$pkgdir/usr/share/uq/lock/core"
  ln -s ../shell/logic "$pkgdir/usr/share/uq/lock/logic"
  ln -s ../shell/auth "$pkgdir/usr/share/uq/lock/auth"
  # The login screen (its own Quickshell config, run by greetd through uq-greeter-session).
  find greeter -type f -exec install -Dm644 {} "$pkgdir/usr/share/uq/{}" \;
  for d in core logic auth; do ln -s "../shell/$d" "$pkgdir/usr/share/uq/greeter/$d"; done
  install -Dm755 packaging/uq-greeter-session "$pkgdir/usr/lib/uq/uq-greeter-session"
  install -Dm644 packaging/greeter/greetd.toml "$pkgdir/etc/uq/greetd.toml"
  install -Dm644 packaging/greeter/greeter.toml "$pkgdir/etc/uq/greeter.toml"
  install -Dm644 packaging/greeter/greetd-uq.conf "$pkgdir/usr/lib/systemd/system/greetd.service.d/uq.conf"
  install -Dm644 packaging/tmpfiles/uq-greeter.conf "$pkgdir/usr/lib/tmpfiles.d/uq-greeter.conf"
  install -Dm755 target/release/uq-settings "$pkgdir/usr/bin/uq-settings"
  install -Dm644 packaging/org.uq.Settings.desktop "$pkgdir/usr/share/applications/org.uq.Settings.desktop"
  install -Dm644 packaging/dbus/org.uq.Settings1.service "$pkgdir/usr/share/dbus-1/services/org.uq.Settings1.service"
  # uq-settings-helper: uQ's only root-side code. D-Bus-activated on the system bus, hardened
  # by its systemd unit, and every method checks its own polkit action before it writes.
  install -Dm755 target/release/uq-settings-helper "$pkgdir/usr/lib/uq/uq-settings-helper"
  install -Dm644 packaging/dbus/org.uq.SettingsHelper1.service "$pkgdir/usr/share/dbus-1/system-services/org.uq.SettingsHelper1.service"
  install -Dm644 packaging/dbus/org.uq.SettingsHelper1.conf "$pkgdir/usr/share/dbus-1/system.d/org.uq.SettingsHelper1.conf"
  install -Dm644 packaging/uq-settings-helper.service "$pkgdir/usr/lib/systemd/system/uq-settings-helper.service"
  install -Dm644 packaging/polkit/org.uq.settings.policy "$pkgdir/usr/share/polkit-1/actions/org.uq.settings.policy"
  # The helper's unit makes these writable only if they exist.
  install -dm755 "$pkgdir/etc/uq" "$pkgdir/etc/systemd/logind.conf.d"
  # Plugin settings pages are read from here (one directory per page); none ship with uQ itself.
  install -dm755 "$pkgdir/usr/share/uq/settings/pages"
  install -Dm644 packaging/uqd.service "$pkgdir/usr/lib/systemd/user/uqd.service"
  install -Dm644 packaging/uq-shell.service "$pkgdir/usr/lib/systemd/user/uq-shell.service"
  install -Dm644 packaging/uq-lock.service "$pkgdir/usr/lib/systemd/user/uq-lock.service"
  install -Dm755 packaging/uq-lock-run "$pkgdir/usr/lib/uq/uq-lock-run"
  install -Dm644 packaging/pam/uq-lock "$pkgdir/etc/pam.d/uq-lock"
  install -Dm644 packaging/pam/uq-lock-fingerprint "$pkgdir/etc/pam.d/uq-lock-fingerprint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 themes/CREDITS.md "$pkgdir/usr/share/licenses/$pkgname/THEME-CREDITS.md"
}
