# Maintainer: KaiserBh <developer.kaiserbh.f01xk@simplelogin.com>
#
# PKGBUILD for Cathode, a cross-platform IPTV player (Tauri + Dioxus + mpv).
#
# Build + install with:  makepkg -si   (no AUR helper required)
#
# Notes for maintaining this on the AUR:
#   - keep `pkgver` in sync with the release tag (it maps to v$pkgver below),
#   - regenerate the source info on every change: makepkg --printsrcinfo > .SRCINFO
#   - lint with: namcap PKGBUILD && namcap cathode-*.pkg.tar.zst
#   - the build needs network access: rustup fetches the toolchain pinned in the
#     repo's rust-toolchain.toml, prepare() builds tauri-cli, and dx downloads a
#     matching wasm-bindgen. This is fine for makepkg/AUR helpers, but a fully
#     network-isolated chroot build would need those pre-provisioned.
pkgname=cathode
pkgver=0.5.3 # x-release-please-version
pkgrel=1
pkgdesc="Cross-platform IPTV player (Tauri + Dioxus + mpv)"
arch=('x86_64')
url="https://github.com/kaiserbh/cathode"
license=('GPL-3.0-or-later')
# Runtime: mpv provides libmpv.so.2 (linked by the libmpv2 crate); the UI runs in
# WebKitGTK on top of GTK 3.
depends=('mpv' 'gtk3' 'webkit2gtk-4.1')
# Build: rustup honours the repo's rust-toolchain.toml, so it installs the pinned
# toolchain AND the wasm32-unknown-unknown target the Dioxus frontend compiles to
# (the plain `rust` package would need `rust-wasm` and ignores the pin). dioxus-cli
# (dx) is in the official repos. tauri-cli is deliberately NOT a makedep: its AUR
# package is frequently outdated/broken, so prepare() builds a pinned copy with
# cargo (whose crates.io client is reliable) into a package-local prefix. This also
# keeps the package buildable with bare makepkg, no AUR helper. base-devel (always
# present for makepkg) supplies the C toolchain and pkgconf; git is for the VCS
# source and the cargo git fetch below.
makedepends=('rustup' 'git' 'dioxus-cli')
# Cargo's release profile already does fat LTO; don't let makepkg inject -flto
# into the C deps (e.g. bundled sqlite) on top of it.
options=('!lto')
source=("$pkgname::git+https://github.com/kaiserbh/cathode.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  # Fetch git dependencies (e.g. dioxus-primitives) with the system git CLI;
  export CARGO_NET_GIT_FETCH_WITH_CLI=true
  # Build a pinned tauri-cli into a package-local prefix (see makedepends note).
  cargo install --locked --version '^2' --root "$srcdir/tools" tauri-cli
  # Pre-fetch the project's crates against the committed lockfile.
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname"
  export CARGO_NET_GIT_FETCH_WITH_CLI=true
  export PATH="$srcdir/tools/bin:$PATH"
  # --no-bundle: produce just the release binary (installed directly; runtime
  # libraries come from depends), while still running the frontend
  # beforeBuildCommand (dx bundle). rust-toolchain.toml selects the toolchain.
  cargo tauri build --no-bundle
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/cathode" "$pkgdir/usr/bin/cathode"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/cathode.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cathode.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Cathode
Comment=Cross-platform IPTV player
Exec=cathode
Icon=cathode
Terminal=false
Categories=AudioVideo;Player;TV;
EOF
}
