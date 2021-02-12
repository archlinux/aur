# Maintainer: Houjun Liu <hliu at shabang dot cf>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=condution-bin
pkgver=1.0.1
_pkgver=1.0.1
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
sha256sums=('5f5bbad45fd5c25232f58351152f96b19d0e7300672197c529c849875d762658')

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
