# Maintainer: asafelobotomy
# Builds from the tagged GitHub Release's source tarball (the AUR package). To build this
# checkout instead, run scripts/build-local-pkg.sh (it swaps the source for `git archive HEAD`).
# pkgver is the Cargo.toml version with '-rc.N' written 'rcN' (pacman forbids '-');
# scripts/bump-version.sh keeps them in step.
pkgname=uq
pkgver=0.2.0
pkgrel=1
_tag=${pkgver/rc/-rc.}
pkgdesc="Themeable Hyprland desktop: shell, theme and layout daemon, CLI and base config"
arch=(x86_64)
url="https://github.com/asafelobotomy/uq"
license=(MIT)
depends=(uq-hyprland-pin dbus glib2 qt6ct gcc-libs 'quickshell>=0.3.1' 'quickshell<0.4' brightnessctl upower systemd noto-fonts-emoji)
makedepends=(cargo)
checkdepends=(lua qt6-declarative)
optdepends=(
  'kitty: default terminal (SUPER+Return)'
  'papirus-icon-theme: icon theme used by every uQ theme'
  'bibata-cursor-theme: cursor theme used by every uQ theme'
  'ttf-jetbrains-mono: monospace font'
  'inter-font: interface font'
  'wireplumber: volume keys'
  'playerctl: media keys'
  'networkmanager: network status in the shell'
  'scdr: CPU priorities for the focused app and builds (enable scdr-session; uQ starts it)'
  'tailscale: exit-node and VPN status in the shell'
  'bluez: Bluetooth status in the shell'
  'power-profiles-daemon: power profile switching'
  'hyprlock: fallback lock for the SUPER+CTRL+L recovery bind'
  'noti-fi: notification backend'
  'fprintd: fingerprint unlock'
  'crum-bs: uninstall apps with their leftovers and clean up storage'
)
options=(!lto)
backup=(etc/pam.d/uq-lock etc/pam.d/uq-lock-fingerprint)
# The release asset, not GitHub's /archive/ tarball: that one is generated on demand and its bytes
# (so its checksum) can change. The release workflow uploads exactly this file and prints its sum.
source=("$pkgname-$_tag.tar.gz::$url/releases/download/v$_tag/$pkgname-$_tag.tar.gz")
# Replaced with the release asset's sha256 for each tag (docs/releasing.md); SKIP until v0.2.0.
sha256sums=('e26496850b444ba0f3d5aae0291bbf9db69e403c1354078ccd1d0161d16ab0a1')

prepare() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p uqd -p uqctl
}

check() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
  # Shell checks, when the tools are present (qs and qmltestrunner ship with quickshell and Qt).
  scripts/lint-shell.sh
  local qmltest=/usr/lib/qt6/bin/qmltestrunner
  [ -x "$qmltest" ] || qmltest=$(command -v qmltestrunner || true)
  if [ -n "$qmltest" ]; then
    QT_QPA_PLATFORM=offscreen "$qmltest" -import shell -input tests/qml
  fi
}

package() {
  cd "$srcdir/$pkgname-$_tag"
  install -Dm755 target/release/uqd "$pkgdir/usr/bin/uqd"
  install -Dm755 target/release/uqctl "$pkgdir/usr/bin/uqctl"
  install -Dm644 config/hypr/base.lua "$pkgdir/usr/share/uq/hypr/base.lua"
  install -dm755 "$pkgdir/usr/share/uq"
  cp -r --no-preserve=ownership themes templates "$pkgdir/usr/share/uq/"
  # The whole shell tree (QML, shell/core/qmldir, logic/*.js).
  find shell -type f -exec install -Dm644 {} "$pkgdir/usr/share/uq/{}" \;
  # The lock instance (its own Quickshell config). lock/core and lock/logic are symlinks to the
  # shell's: Quickshell only imports from inside the config directory.
  find lock -type f -exec install -Dm644 {} "$pkgdir/usr/share/uq/{}" \;
  ln -s ../shell/core "$pkgdir/usr/share/uq/lock/core"
  ln -s ../shell/logic "$pkgdir/usr/share/uq/lock/logic"
  install -Dm644 packaging/uqd.service "$pkgdir/usr/lib/systemd/user/uqd.service"
  install -Dm644 packaging/uq-shell.service "$pkgdir/usr/lib/systemd/user/uq-shell.service"
  install -Dm644 packaging/uq-lock.service "$pkgdir/usr/lib/systemd/user/uq-lock.service"
  install -Dm755 packaging/uq-lock-run "$pkgdir/usr/lib/uq/uq-lock-run"
  install -Dm644 packaging/pam/uq-lock "$pkgdir/etc/pam.d/uq-lock"
  install -Dm644 packaging/pam/uq-lock-fingerprint "$pkgdir/etc/pam.d/uq-lock-fingerprint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 themes/CREDITS.md "$pkgdir/usr/share/licenses/$pkgname/THEME-CREDITS.md"
}
