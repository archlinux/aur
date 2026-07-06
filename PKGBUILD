# Maintainer: KaiserBh <developer.kaiserbh.f01xk@simplelogin.com>
#
# PKGBUILD for Cathode, a cross-platform IPTV player (Tauri + Dioxus + mpv).
#
pkgname=cathode
pkgver=0.5.6 # x-release-please-version
pkgrel=1
pkgdesc="Cross-platform IPTV player (Tauri + Dioxus + mpv)"
arch=('x86_64')
url="https://github.com/kaiserbh/cathode"
license=('GPL-3.0-or-later')
depends=('mpv' 'gtk3' 'webkit2gtk-4.1')
makedepends=('rustup' 'git' 'dioxus-cli')
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
