# Maintainer: mikilimj <milosz@medportal.pl>
# VCS package: always builds the tip of upstream main. pkgver comes from
# `git describe` against the latest release tag, so nothing needs bumping on
# release — only a rebuild (makepkg -f / an AUR helper's -git handling).
pkgname=snippit-git
pkgver=1.2.2.r4.gf6f438c
pkgrel=1
pkgdesc="Desktop clip-trimming tool with live multi-track audio mixing and lossless export (Tauri + React) (git version)"
arch=('x86_64')
url="https://github.com/mikilimj/Snippit"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'rclone'
         'gst-plugins-good' 'gst-libav' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm')
provides=('snippit')
conflicts=('snippit' 'snippit-bin')
# rusqlite's bundled sqlite3 is compiled by gcc; -flto bitcode objects can't
# be consumed by the Rust lld link step, so LTO must stay off.
options=('!lto')
source=("$pkgname::git+$url.git#branch=main"
        "snippit.desktop")
sha256sums=('SKIP'
            '9a05c74e25b18ccdcdc1dc89cb0471a73203780fccea90a061d4b771c95f97a0')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$pkgname"

  # Sidecar binaries are gitignored upstream (CI downloads them); on Arch the
  # app resolves sidecars next to /usr/bin/snippit, so the system ffmpeg and
  # rclone packages satisfy them. tauri-build only needs files present here.
  mkdir -p src-tauri/binaries
  ln -sf /usr/bin/ffmpeg  src-tauri/binaries/ffmpeg-x86_64-unknown-linux-gnu
  ln -sf /usr/bin/ffprobe src-tauri/binaries/ffprobe-x86_64-unknown-linux-gnu
  ln -sf /usr/bin/rclone  src-tauri/binaries/rclone-x86_64-unknown-linux-gnu

  npm ci
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu" \
    --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "$pkgname"
  # Version stays whatever upstream's tauri.conf.json carries: the pkgver this
  # package derives (1.2.2.r4.gf6f438c) is not a semver string, which Tauri
  # rejects at config-parse time.
  npm run tauri build -- --no-bundle
}

package() {
  cd "$pkgname"

  install -Dm755 src-tauri/target/release/snippit "$pkgdir/usr/bin/snippit"
  install -Dm644 "$srcdir/snippit.desktop" \
    "$pkgdir/usr/share/applications/snippit.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/snippit.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/snippit.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/snippit.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/snippit.png"
}
