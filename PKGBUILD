# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=responsively-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A modified web browser that helps in responsive web development. A web developer's must have dev-tool"
arch=('x86_64')
url='https://responsively.app'
license=('AGPL3')
provides=('responsively')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/manojVivek/responsively-app/releases/download/v${pkgver}/ResponsivelyApp-${pkgver}.AppImage")
sha256sums=('0a5dfc10ba6e4666fe70b4b84c1b16d2a3419e810bd6ef286a006c92dee20732')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/responsively-app.png "${pkgdir}/usr/share/pixmaps/responsively.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Responsively" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}