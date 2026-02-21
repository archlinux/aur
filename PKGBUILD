# Maintainer: theasyncat-mvp <https://github.com/theasyncat-mvp>
pkgname=palette-asyncat-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A local-first color palette designer built with Tauri"
arch=('x86_64')
url="https://github.com/theasyncat-mvp/palette"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gtk3')
provides=('palette')
conflicts=('palette')

source_x86_64=("palette-${pkgver}.deb::https://github.com/theasyncat-mvp/palette/releases/download/v${pkgver}/palette_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract the deb
  ar x "palette-${pkgver}.deb"
  tar xf data.tar.gz -C "${pkgdir}"

  # Rename binary from 'app' to 'palette'
  mv "${pkgdir}/usr/bin/app" "${pkgdir}/usr/bin/palette"

  # Rename icons from 'app' to 'palette'
  for size in 32x32 128x128; do
    mv "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" \
       "${pkgdir}/usr/share/icons/hicolor/${size}/apps/palette.png"
  done
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" \
     "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/palette.png"

  # Fix the desktop file to point to the renamed binary and icon
  sed -i 's|^Exec=app|Exec=palette|' "${pkgdir}/usr/share/applications/palette.desktop"
  sed -i 's|^Icon=app|Icon=palette|' "${pkgdir}/usr/share/applications/palette.desktop"
}
