# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=pipette-desktop-git
pkgver=0.5.0.r0.g5c0160ee
pkgrel=1
pkgdesc="Pipette — Vial-compatible keyboard configurator (Git version)"
arch=('x86_64')
url="https://github.com/darakuneko/pipette-desktop"
license=('GPL-3.0-or-later')
provides=('pipette-desktop')
conflicts=('pipette-desktop-bin' 'pipette-desktop-keychron-bin' 'pipette-desktop-keychron-git')
depends=('webkit2gtk-4.1' 'libsoup3' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libayatana-appindicator' 'systemd-libs' 'dbus' 'hicolor-icon-theme')
makedepends=('git' 'nodejs' 'corepack' 'cargo')
options=('!lto')

source=("git+https://github.com/darakuneko/pipette-desktop.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "pipette-desktop"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# The repo pins its pnpm version (packageManager), which corepack provides;
# the Tauri build calls `pnpm` itself, so a wrapper goes first on PATH. The
# Rust toolchain is the system one (rustup follows src-tauri/rust-toolchain.toml).
_env() {
  export COREPACK_HOME="$srcdir/corepack"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  mkdir -p "$srcdir/bin"
  printf '#!/bin/sh\nexec corepack pnpm "$@"\n' > "$srcdir/bin/pnpm"
  chmod +x "$srcdir/bin/pnpm"
  export PATH="$srcdir/bin:$PATH"
}

prepare() {
  cd "pipette-desktop"
  _env
  pnpm install --frozen-lockfile
}

build() {
  cd "pipette-desktop"
  _env
  pnpm exec tauri build --no-bundle
}

package() {
  cd "pipette-desktop"
  install -Dm755 src-tauri/target/release/pipette "$pkgdir/usr/bin/pipette-desktop"
  install -Dm644 scripts/99-vial.rules "$pkgdir/usr/lib/udev/rules.d/70-pipette-desktop.rules"
  install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/pipette-desktop.png"

  install -dm755 "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/pipette-desktop.desktop" <<EOF
[Desktop Entry]
Name=Pipette
Exec=pipette-desktop %U
Terminal=false
Type=Application
Icon=pipette-desktop
StartupWMClass=pipette
Comment=Vial-compatible keyboard configurator
Categories=Utility;HardwareSettings;
EOF
}
