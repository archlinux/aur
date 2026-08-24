# Maintainer: Miguel Rincon <miguelaezak at gmail dot com>
pkgname=slipmat
pkgver=0.10.0
pkgrel=1
pkgdesc="A native GNOME client for Apple Music"
arch=('x86_64')          # Widevine on Linux is x86_64 only
url="https://github.com/SoftARV/Slipmat"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'librsvg' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm' 'git' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25ebc6c8aa985eed15aa62cded733425f8f626c05b6ee62fed1219ead61b51ac')
options=('!debug' '!lto')

# The ~200 MB castLabs Electron download and the crate registry both need the
# network, so neither can happen in package(). makepkg allows it here.
prepare() {
  cd "Slipmat-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  # sidecar/.npmrc carries `allow-git=root`; npm 12 refuses git dependencies
  # without it and castLabs Electron ships only as a GitHub release.
  cd sidecar
  npm install --no-audit --no-fund
  # castLabs ships no postinstall hook — the Chromium binary is fetched by an
  # explicit step. Skip it and node_modules is 14 MB with no Electron in it.
  node node_modules/electron/install.js
}

build() {
  cd "Slipmat-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "Slipmat-$pkgver"
  cargo test --release --frozen
}

package() {
  cd "Slipmat-$pkgver"
  local appid=dev.miguelrincon.Slipmat

  install -Dm755 target/release/slipmat "$pkgdir/usr/bin/slipmat"

  # The sidecar goes under /usr/share, which `sidecar::locate` finds via
  # XDG_DATA_DIRS. It is read-only here; Chromium fetches the Widevine CDM
  # per-user into ~/.config/Slipmat at first run, so nothing needs to write
  # inside this directory.
  install -d "$pkgdir/usr/share/slipmat/sidecar"
  cp -r sidecar/package.json sidecar/main.js sidecar/preload.js \
        sidecar/node_modules "$pkgdir/usr/share/slipmat/sidecar/"

  # Prebuilt binaries for architectures this package is not for — 7 MB of
  # arm64, ia32, darwin and win32 shipped inside one npm dependency. They also
  # make `strip` complain during packaging, which is how they were noticed.
  find "$pkgdir/usr/share/slipmat/sidecar" -name '*.node' \
    ! -name '*linux-x64-gnu*' -delete

  install -Dm644 "data/$appid.desktop" \
    "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "data/icons/hicolor/scalable/apps/$appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  install -Dm644 "data/icons/hicolor/symbolic/apps/$appid-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$appid-symbolic.svg"

  # Raster sizes, rendered from the same SVG, as `make install` does.
  for sz in 16 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    rsvg-convert -w "$sz" -h "$sz" "data/icons/hicolor/scalable/apps/$appid.svg" \
      -o "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$appid.png"
  done

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
