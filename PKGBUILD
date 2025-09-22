# Maintainer: ChadAPSheridan <chad.sheridan@cysec.ca>

pkgname=rivalcfg-tray
pkgver=0.9.3
pkgrel=1
pkgdesc="A GTK-based GUI for Rivalcfg tray indicator"
arch=('x86_64')
url="https://github.com/ChadAPSheridan/RivalCfgGuiGTK"
license=('GPL')
# runtime dependencies: gtk3 for UI, libayatana-appindicator for indicators, hidapi/rivalcfg for device access,
# librsvg provides rsvg-convert used at runtime to render SVGs to PNG for the indicator
depends=('gtk3' 'libayatana-appindicator' 'hidapi' 'rivalcfg' 'librsvg')
makedepends=('cargo' 'rust')
# Use GitHub release tarball (uploaded by the workflow)
source=("https://github.com/ChadAPSheridan/RivalCfgGuiGTK/releases/download/v0.9.3/RivalCfgGuiGTK-0.9.3.tar.gz")
sha256sums=(a0e906a2e2d2692b10a48bf5ba1c4460eb48f713edcbd8e4e4368605229705de)  # Replace with the actual checksum

build() {
  cd "$srcdir/RivalCfgGuiGTK-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/RivalCfgGuiGTK-$pkgver"

  # install the binary
  install -Dm755 target/release/rivalcfg-tray "$pkgdir/usr/bin/rivalcfg-tray"

  # desktop entry and appdata (metainfo)
  install -Dm644 io.github.chadapsheridan.rivalcfgtray.appdata.xml "$pkgdir/usr/share/metainfo/io.github.chadapsheridan.rivalcfgtray.appdata.xml"
  install -Dm644 rivalcfg-tray.desktop "$pkgdir/usr/share/applications/rivalcfg-tray.desktop"

  # install a raster app icon (256x256) for stores and legacy use
  install -Dm644 icons/app_icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/rivalcfg-tray.png"
  # also install a copy named to match the desktop/appdata id so the Desktop Icon= resolves
  install -Dm644 icons/app_icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.chadapsheridan.rivalcfgtray.png"

  # install SVG source icons into scalable and sized hicolor dirs so they can be found at runtime
  for svg in icons/*.svg; do
    base=$(basename "$svg")
    # determine numeric size if present, e.g. battery-50.svg -> 50
    size=$(echo "$base" | sed -n 's/[^0-9]*\([0-9][0-9]*\).*/\1/p')
    if [ -n "$size" ]; then
      install -Dm644 "$svg" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${base}"
    fi
    # also install as scalable SVG so icon themes can pick them
    install -Dm644 "$svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${base}"
    # if this svg is the generic app icon, also install a copy named to match the app id
    if [ "$base" = "app_icon.png" ] || [ "$base" = "app_icon.svg" ]; then
      install -Dm644 "$svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.chadapsheridan.rivalcfgtray.svg" 2>/dev/null || true
    fi
  done

  # update icon cache at install time is optional for manual installs; packaging tools handle it
}