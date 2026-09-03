# Maintainer: Miguel Rincon <miguelaezak at gmail dot com>

pkgbase=slipmat
pkgname=('slipmat-daemon' 'slipmat' 'climat')
pkgver=0.11.0
pkgrel=1
arch=('x86_64')          # Widevine on Linux is x86_64 only
url="https://github.com/SoftARV/Slipmat"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'nodejs' 'npm' 'git' 'pkgconf' 'librsvg'
             'gtk4' 'libadwaita' 'libpulse')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad026864baeea9d8f16b35539bbc903cda7df4c368962294167e3bd5115667d9')
options=('!debug' '!lto')

prepare() {
  cd "$srcdir/Slipmat-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cd sidecar
  npm install --no-audit --no-fund
  node node_modules/electron/install.js
}

build() {
  cd "$srcdir/Slipmat-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$srcdir/Slipmat-$pkgver"
  cargo test --release --frozen
}

package_slipmat-daemon() {
  pkgdesc="Slipmat's playback daemon and hidden Chromium sidecar"
  depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libxkbcommon' 'mesa' 'libdrm'
           'libseccomp' 'libpulse')

  cd "$srcdir/Slipmat-$pkgver"
  install -Dm755 target/release/slipmatd "$pkgdir/usr/bin/slipmatd"

  install -d "$pkgdir/usr/share/slipmat/sidecar"
  cp -r sidecar/package.json sidecar/main.js sidecar/preload.js \
        sidecar/queue-identity.js \
        sidecar/node_modules "$pkgdir/usr/share/slipmat/sidecar/"

  find "$pkgdir/usr/share/slipmat/sidecar" -name '*.node' \
    ! -name '*linux-x64-gnu*' -delete

  install -Dm644 packaging/systemd/slipmatd.service \
    "$pkgdir/usr/lib/systemd/user/slipmatd.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_slipmat() {
  pkgdesc="A native GNOME client for Apple Music"
  depends=("slipmat-daemon=$pkgver-$pkgrel"
           'gtk4' 'libadwaita' 'librsvg' 'hicolor-icon-theme')

  cd "$srcdir/Slipmat-$pkgver"
  local appid=dev.miguelrincon.Slipmat

  install -Dm755 target/release/slipmat "$pkgdir/usr/bin/slipmat"
  install -Dm644 "data/$appid.desktop" \
    "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "data/icons/hicolor/scalable/apps/$appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  install -Dm644 "data/icons/hicolor/symbolic/apps/$appid-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$appid-symbolic.svg"

  for sz in 16 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    rsvg-convert -w "$sz" -h "$sz" "data/icons/hicolor/scalable/apps/$appid.svg" \
      -o "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$appid.png"
  done

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_climat() {
  pkgdesc="Winamp-style Apple Music in a terminal; needs a graphical session"
  depends=("slipmat-daemon=$pkgver-$pkgrel" 'libpulse' 'hicolor-icon-theme')

  cd "$srcdir/Slipmat-$pkgver"
  local appid=dev.miguelrincon.Climat

  install -Dm755 target/release/climat "$pkgdir/usr/bin/climat"
  install -Dm644 "data/$appid.desktop" \
    "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "data/icons/hicolor/scalable/apps/$appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"

  for sz in 16 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    rsvg-convert -w "$sz" -h "$sz" "data/icons/hicolor/scalable/apps/$appid.svg" \
      -o "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$appid.png"
  done

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 crates/climat/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
