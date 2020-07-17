# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=roloviewer-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Image slideshow viewer"
arch=('x86_64')
url='https://github.com/rosenloecher-it/roloviewer'
license=('GPL3')
provides=('roloviewer')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/rosenloecher-it/roloviewer/releases/download/${pkgver}/roloviewer-${pkgver}-x86_64.AppImage")
sha256sums=('f4a0328e0cb9aa657d34f8d1b4589aba343535e84ef86974f815936b2938d862')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/roloviewer.png "${pkgdir}/usr/share/pixmaps/roloviewer.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "RoloViewer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Graphics;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}