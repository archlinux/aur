# Maintainer: Houjun Liu <hliu at shabang dot cf>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=condution-bin
pkgver=1.0.2
_pkgver=1.0.2
pkgrel=0
pkgdesc="A personal project management system that makes sense and will not burn your pockets out"
arch=('x86_64')
url='https://www.condution.com'
license=('GPL3')
depends=('nss'
         'dbus-glib'
         'gtk2'
         'gtk3'
         'libxss'
         'libdbusmenu-glib')
makedepends=('gendesk')
source=("${pkgname%-bin}-${_pkgver}.AppImage::https://github.com/Shabang-Systems/Condution/releases/download/v${_pkgver}/Condution-${_pkgver}.AppImage")
sha256sums=('f013180d1cb1d2612d527afee31baf7bdba9409f2a58ad46761e98fb096d93bb')

package() {
  chmod 755 ./${pkgname%-bin}-${_pkgver}.AppImage
  ./${pkgname%-bin}-${_pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/condution.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Condution" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
