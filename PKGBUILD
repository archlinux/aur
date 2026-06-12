# Maintainer: Cenk Kılıç <cenk1cenk2cenk3@gmail.com>
pkgname=hyprpilot-bin
pkgver=2.4.1 # x-release-please-version
pkgrel=1
pkgdesc="Tauri overlay daemon for agent-driven workflows on Hyprland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/hyprpilot/hyprpilot"
license=('MIT')
# Runtime deps — verified via `ldd target/release/hyprpilot` + a read of
# the `tray-icon` crate's Linux backend. `webkit2gtk-4.1` covers webkit
# + javascriptcoregtk; `gtk3` covers gdk + glib + cairo + pango +
# harfbuzz transitively; `gtk-layer-shell` is the C wrapper the
# `gtk-layer-shell` crate binds against — Wayland layer-shell anchored
# overlay needs it.
#
# `libappindicator-gtk3` is required at RUNTIME via `dlopen` (the
# `libappindicator-sys` crate uses `libloading`, which is why `ldd`
# shows no static reference). tauri 2's `tray-icon = "0.23"` feature
# initialises a `TrayIconBuilder` at daemon startup; on GNOME with the
# AppIndicator extension that path opens `libappindicator-gtk3.so.1`
# to publish the icon. On Hyprland there's no tray host so the dlopen
# silently no-ops, but the dep stays declared so KDE / GNOME users
# don't lose the tray with a confusing silent failure.
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'gtk-layer-shell'
  'libappindicator-gtk3'
)
provides=('hyprpilot')
conflicts=('hyprpilot-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/hyprpilot/hyprpilot/releases/download/v$pkgver/hyprpilot-v$pkgver-x86_64-unknown-linux-gnu.tar.zst")
# updpkgsums fills these in on every release-please bump (the AUR
# publish workflow runs `updpkgsums: true` so the deployed PKGBUILD
# always carries real checksums against the freshly-uploaded
# tarball). Local-build path: run `updpkgsums` manually after a
# pkgver edit.
b2sums=('09251a2199c12c4453b00f8566a6e33c75e8c3767696158f5223883984dcc295da1ebded7258ede3dbc2c3735f6c6c6a36992b90f738ab8169d40c21a73366b4')

package() {
  cd "$srcdir/hyprpilot"
  install -Dm755 hyprpilot "$pkgdir/usr/bin/hyprpilot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 hyprpilot.desktop "$pkgdir/usr/share/applications/hyprpilot.desktop"
  install -Dm644 hyprpilot.service "$pkgdir/usr/lib/systemd/user/hyprpilot.service"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprpilot.png"
  done
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
