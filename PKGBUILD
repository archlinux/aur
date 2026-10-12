# Maintainer: TJ Griffiths <teej.d.man@gmail.com>
# trdc: remote desktop client with a built-in AI copilot — connection tabs,
# connection sidebar, and an AI panel that can see the remote screen and
# (with per-action approval) drive its mouse and keyboard.
#
# As of 0.2.0 trdc links FreeRDP 3 directly: no sidecar process, no
# guacamole-server build. The only runtime pieces are this binary and the
# system webkit/freerdp libraries.
pkgname=trdc
pkgver=0.2.0
pkgrel=1
pkgdesc="Remote desktop client with a built-in AI copilot (native FreeRDP RDP client)"
arch=('x86_64')
url="https://github.com/Teejer/trdc"
license=('GPL-2.0-or-later')
depends=('freerdp' 'gcc-libs' 'glibc' 'glib2' 'gtk3' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('cargo' 'npm' 'pkgconf' 'rust')
options=('!debug')
source=("https://github.com/Teejer/trdc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef6bc3ff0ef936cca1ade4688b5f6c85d6eb5a329749f7d856058656f9a75106')

build() {
  cd "trdc-$pkgver"
  npm ci --no-audit --no-fund
  npm run build          # tauri's build.rs embeds ../dist at compile time

  # ring (rustls crypto) builds hand-written asm through cc-rs, which
  # inherits CFLAGS. Arch's default "-flto=auto" makes cc-rs LTO the C
  # objects but not the .S files, so the asm symbols vanish and linking
  # fails with "undefined symbol: ring_core_*". Strip LTO for the Rust
  # build only (our Rust crate still gets Rust's own LTO via Cargo.toml).
  cd src-tauri
  # custom-protocol embeds the built frontend into the binary; without it
  # cargo build loads devUrl localhost:1420 and the installed app dies with
  # "Could not connect to localhost". --remap-path-prefix cleans
  # panic-location strings. The residual "contains reference to $srcdir"
  # warning comes from tauri-build baking the workspace path into an asset
  # string literal at macro expansion time (not remappable); it is
  # cosmetic and each builder's binary embeds their own path.
  env CFLAGS="${CFLAGS/-flto=auto/}" CXXFLAGS="${CXXFLAGS/-flto=auto/}" \
    RUSTFLAGS="--remap-path-prefix=$srcdir=build --remap-path-prefix=$HOME/.cargo=cargo" \
    cargo build --release --locked --features custom-protocol
}

package() {
  cd "$srcdir/trdc-$pkgver"
  install -Dm755 src-tauri/target/release/trdc "$pkgdir/usr/bin/trdc"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/trdc.png"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/trdc.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=trdc
GenericName=Remote desktop client
Comment=Remote desktop client with a built-in AI copilot
Exec=trdc %u
Terminal=false
Categories=Network;RemoteAccess;
Keywords=rdp;remote;desktop;ai;
Icon=trdc
EOF
}
