# Maintainer: Ryan Rusnak <ryan@airspace.com>
pkgname=todarchy-git
pkgver=0.2.0.r0
pkgrel=1
pkgdesc="Keyboard-first, Omarchy-themed task manager"
arch=('x86_64')
url="https://github.com/ryanrusnak/todarchy-linux"
license=('MIT')
depends=('webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'npm' 'git')
provides=('todarchy' 'tod')
# Disable makepkg's global LTO for this package. With `lto` enabled, the
# -flto=auto C flags compile the `ring` crate's C/asm helpers as LTO bitcode,
# which the final Rust link (ld.lld) then can't resolve — you get a wall of
# `undefined symbol: ring_core_*`. Rust does its own codegen optimization; the
# C-level LTO buys nothing here and only breaks the link.
options=('!lto')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd todarchy-linux
  # Pull the base version out of src-tauri/Cargo.toml so -git installs
  # reflect the real semver, not a hardcoded string that drifts. Append
  # commit count + hash the usual -git way.
  local base
  base=$(grep -m1 '^version' src-tauri/Cargo.toml | cut -d'"' -f2)
  printf "%s.r%s.%s" "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd todarchy-linux
  npm install
  npx tauri build --no-bundle
  cargo build --release -p todarchy-cli -p todarchy-waybar
}

package() {
  cd todarchy-linux
  # Tauri GUI (package name todarchy → target/release/todarchy)
  install -Dm755 target/release/todarchy                    "$pkgdir/usr/bin/todarchy"
  # CLI companion (bin name "tod", from crates/todarchy-cli)
  install -Dm755 target/release/tod                         "$pkgdir/usr/bin/tod"
  # Waybar helper
  install -Dm755 target/release/todarchy-waybar             "$pkgdir/usr/bin/todarchy-waybar"
  # Desktop integration
  install -Dm644 packaging/omarchy/todarchy.desktop         "$pkgdir/usr/share/applications/todarchy.desktop"
  install -Dm644 src-tauri/icons/128x128.png                "$pkgdir/usr/share/icons/hicolor/128x128/apps/todarchy.png"
  install -Dm644 src-tauri/icons/icon.png                   "$pkgdir/usr/share/icons/hicolor/512x512/apps/todarchy.png"
  install -Dm644 LICENSE                                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
