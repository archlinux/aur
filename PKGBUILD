# Maintainer: asafelobotomy
# Builds from the tagged GitHub Release's source tarball (the AUR package). To build this
# checkout instead, run scripts/build-local-pkg.sh (it swaps the source for `git archive HEAD`).
# pkgver is the Cargo.toml version with '-rc.N' written 'rcN' (pacman forbids '-');
# scripts/bump-version.sh keeps them in step.
pkgname=uq
pkgver=0.3.41
pkgrel=1
_tag=${pkgver/rc/-rc.}
# The uq-hyprland-pin this release's config/hypr/base.lua is tested with: equal to
# packaging/uq-hyprland-pin's pkgver (tests/shell/version_test.sh checks). A versioned dependency
# keeps an updated uq from installing beside an older pin that allows a Hyprland it doesn't support.
_pin=0.56.2
pkgdesc="Themeable Hyprland desktop: shell, theme and layout daemon, CLI and base config"
arch=(x86_64)
url="https://github.com/asafelobotomy/uq"
license=(MIT)
depends=("uq-hyprland-pin>=$_pin" dbus glib2 shared-mime-info qt6ct gcc-libs 'quickshell>=0.3.1' 'quickshell<0.4' brightnessctl upower systemd noto-fonts-emoji gnome-keyring
  kirigami qqc2-desktop-style qt6-declarative kvantum polkit kcolorscheme kconfig
  plasma-integration papirus-icon-theme adw-gtk-theme inter-font ttf-jetbrains-mono
  xdg-desktop-portal-gtk libnotify)
install=uq.install
makedepends=(cargo qt6-base qt6-declarative kcolorscheme kconfig)
checkdepends=(lua qt6-declarative)
optdepends=(
  'plasma5-integration: Qt 5 apps follow the uQ theme (with kvantum-qt5)'
  'kvantum-qt5: the uQ widget style for Qt 5 apps'
  'kyko: default terminal (SUPER+Return)'
  'kitty: terminal used where kyko is not installed'
  'bibata-cursor-theme: cursor theme used by every uQ theme'
  'wireplumber: volume keys and the Sound settings page'
  'playerctl: media keys'
  'networkmanager: network status in the shell and the Network settings page'
  'scdr: CPU priorities for the focused app and builds (enable scdr-session; uQ starts it)'
  'tailscale: exit-node and VPN status in the shell'
  'bluez: Bluetooth status in the shell and the Bluetooth settings page'
  'cups: the Printers settings page'
  'power-profiles-daemon: power profile switching'
  'hyprlock: fallback lock for the SUPER+CTRL+L recovery bind'
  'noti-fi: notification backend'
  'fprintd: fingerprint unlock'
  'crum-bs: uninstall apps with their leftovers and clean up storage'
  'xzram: the Memory and swap page in Settings'
  'scale_tail: the Tailscale page and quick-settings tile'
  'reelo: the default media player, themed like uQ, with the Media player page'
  'greetd: the uQ login screen (run0 uqctl greeter enable)'
  'kwallet-pam: unlock KDE Wallet at the uQ login screen'
  'networkmanager-openvpn: OpenVPN connections on the Network settings page'
  'sound-theme-freedesktop: the test sound on the Sound settings page'
  'xorg-xrandr: tells X11 apps which display is the main one'
  'grim: screenshots (Print)'
  'slurp: pick an area for a screenshot (Print)'
  'wl-clipboard: copy screenshots to the clipboard (Copy in the preview)'
  'uqview: Mark up and Open in the screenshot preview; the image viewer'
  'kate: KWrite, a plain text editor'
)
# Keep !lto: rustc links with lld, and makepkg's LTO flags make the cxx-qt C++ objects unreadable to it.
options=(!lto)
backup=(etc/pam.d/uq-greetd etc/pam.d/uq-greeter etc/pam.d/uq-lock etc/pam.d/uq-lock-fingerprint etc/uq/greetd.toml etc/uq/greeter.toml)
# The release asset, not GitHub's /archive/ tarball: that one is generated on demand and its bytes
# (so its checksum) can change. The release workflow uploads exactly this file and prints its sum.
source=("$pkgname-$_tag.tar.gz::$url/releases/download/v$_tag/$pkgname-$_tag.tar.gz")
# The release asset's sha256 for this tag; update it with pkgver at each release (docs/releasing.md).
sha256sums=('c19b2bc5802d7c56439681dfaff3ab5e7bcba4aa81a56ec37f5f1b79f9723c35')

prepare() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p uqd -p uqctl -p uqlip -p uq-settings -p uq-settings-helper
}

# The full suite (cargo plus ~950 QML tests, about a minute) runs in CI before every tag, so builds
# skip it unless asked: UQ_CHECK=1 makepkg ... (makepkg has no per-PKGBUILD '!check' option).
check() {
  [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
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
  install -Dm755 target/release/uqlip "$pkgdir/usr/bin/uqlip"
  install -Dm755 scripts/uq-dev "$pkgdir/usr/bin/uq-dev"
  # The uQ session entry: runs `uqctl setup` on first login, then Hyprland.
  install -Dm755 packaging/uq-session "$pkgdir/usr/bin/uq-session"
  install -Dm755 packaging/uq-screenshot "$pkgdir/usr/bin/uq-screenshot"
  install -Dm644 packaging/org.uq.Screenshot.desktop "$pkgdir/usr/share/applications/org.uq.Screenshot.desktop"
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
  # The boot and shutdown banner (off until enabled: systemctl enable uq-banner-boot uq-banner-shutdown).
  install -Dm755 packaging/banner/uq-banner "$pkgdir/usr/lib/uq/uq-banner"
  install -Dm644 packaging/banner/uq-banner-boot.service "$pkgdir/usr/lib/systemd/system/uq-banner-boot.service"
  install -Dm644 packaging/banner/uq-banner-shutdown.service "$pkgdir/usr/lib/systemd/system/uq-banner-shutdown.service"
  # ROM and retro-platform file types: names, extensions and icons for file managers and xdg-open.
  # pacman's shared-mime-info and icon-cache hooks refresh the databases after the install.
  install -Dm644 packaging/mime/uq-roms.xml "$pkgdir/usr/share/mime/packages/uq-roms.xml"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes" packaging/mime/icons/*.svg
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
  install -Dm644 packaging/polkit/49-uq-greeter-theme.rules "$pkgdir/usr/share/polkit-1/rules.d/49-uq-greeter-theme.rules"
  # The helper's unit makes these writable only if they exist.
  install -dm755 "$pkgdir/etc/uq" "$pkgdir/etc/systemd/logind.conf.d"
  # Plugin settings pages are read from here (one directory per page); uQ ships only uqlip's.
  install -dm755 "$pkgdir/usr/share/uq/settings/pages"
  # uqlip's own page (the clipboard history).
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/uqlip" uq/pages/uqlip/*
  install -Dm644 packaging/uqd.service "$pkgdir/usr/lib/systemd/user/uqd.service"
  install -Dm644 packaging/uq-shell.service "$pkgdir/usr/lib/systemd/user/uq-shell.service"
  install -Dm644 packaging/uqlip.service "$pkgdir/usr/lib/systemd/user/uqlip.service"
  install -Dm644 packaging/uq-lock.service "$pkgdir/usr/lib/systemd/user/uq-lock.service"
  install -Dm755 packaging/uq-lock-run "$pkgdir/usr/lib/uq/uq-lock-run"
  install -Dm644 packaging/pam/uq-greetd "$pkgdir/etc/pam.d/uq-greetd"
  install -Dm644 packaging/pam/uq-greeter "$pkgdir/etc/pam.d/uq-greeter"
  install -Dm644 packaging/pam/uq-lock "$pkgdir/etc/pam.d/uq-lock"
  install -Dm644 packaging/pam/uq-lock-fingerprint "$pkgdir/etc/pam.d/uq-lock-fingerprint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 themes/CREDITS.md "$pkgdir/usr/share/licenses/$pkgname/THEME-CREDITS.md"
}
