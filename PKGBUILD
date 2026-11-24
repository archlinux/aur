# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: Bindle built from a tagged release's source, for an Arch
# system that is already installed. Installed this way it lives in /usr/bin
# and updates with the AUR: Bindle's own self-update (`bindleup`'s Bindle
# stage) only replaces the copy `bindle first-login install` puts in
# /usr/local/bin, and only reports a packaged one. The release workflow
# writes the published copy (version and checksum filled in, plus .SRCINFO)
# into its `aur` artifact.

pkgname=bindle
pkgver=0.1.43
pkgrel=1
pkgdesc='Fresh-install setup wizard and system updater (bindleUP) for Arch Linux'
arch=('x86_64')
url='https://github.com/asafelobotomy/bindle'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'pacman' 'polkit' 'curl' 'gnupg' 'systemd'
         'qt6-base' 'qt6-declarative' 'kirigami' 'hicolor-icon-theme')
makedepends=('cargo' 'cmake')
optdepends=('snapper: a snapshot before each apply or update, and undo'
            'libnotify: the daily update-check notification'
            'uq: Bindle'"'"'s page in uQ Settings (setup, updates, history)')
# Rust does its own LTO; makepkg's C/C++ LTO flags break the cxx-qt objects.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b87ac0a21566b589fd460aed3ee393bf81bb2a3058d5422d4fda3c5cb0dd68a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --release --frozen -p bindle-cli -p bindle-gui
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --release --frozen --workspace --exclude bindle-gui
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" target/release/bindle target/release/bindle-gui
  # One binary, three names (crates/bindle-cli/src/bindo_cmd.rs).
  ln -s bindle "$pkgdir/usr/bin/bindo"
  ln -s bindle "$pkgdir/usr/bin/bindleup"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/bindle.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Bindle
Comment=Set up and optimise this system
Exec=bindle open
Icon=bindle
Terminal=false
Categories=System;
DESKTOP
  install -Dm644 -t "$pkgdir/usr/share/metainfo" packaging/io.github.asafelobotomy.bindle.metainfo.xml
  install -Dm644 branding/bindle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bindle.svg"
  local png n
  for png in branding/png/bindle-*.png; do
    n=${png##*-}; n=${n%.png}
    install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/${n}x${n}/apps/bindle.png"
  done

  # The root helper's password message (pkexec /usr/bin/bindle helper). Its
  # own file and action id, so it never clashes with the policy
  # `bindle first-login install` writes for /usr/local/bin/bindle.
  sed -e 's|io.github.asafelobotomy.bindle.apply|io.github.asafelobotomy.bindle.apply.package|' \
      -e 's|>/usr/local/bin/bindle<|>/usr/bin/bindle<|' \
      packaging/polkit/io.github.asafelobotomy.bindle.policy |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/polkit-1/actions/io.github.asafelobotomy.bindle.package.policy"

  # uQ Settings' Bindle page (inert without uQ). Its commands run
  # /usr/lib/bindle/bindle, since a page may only run programs under /usr/lib or /usr/bin.
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/bindle" uq/pages/bindle/*
  # bindleUP's icon in uQ's bar (a widget; inert without uQ).
  install -Dm644 -t "$pkgdir/usr/share/uq/shell/widgets/bindleup" uq/widgets/bindleup/*
  # Bindle's problem codes, for uqctl explain and uQ Settings' Problems page (inert without uQ).
  install -Dm644 -t "$pkgdir/usr/share/uq/diag" uq/diag/bindle.toml
  install -d "$pkgdir/usr/lib/bindle"
  ln -s /usr/bin/bindle "$pkgdir/usr/lib/bindle/bindle"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md docs/UPGRADE.md docs/BINDO.md
}
