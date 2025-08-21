# Contributor: Houjun Liu <hliu at shabang dot cf>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=condution-bin
pkgver=1.2.1
pkgrel=1
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
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/Shabang-Systems/Condution/releases/download/v${pkgver}/Condution-${pkgver}.AppImage")
sha256sums=('ed1460dfe0ad2c7e4d75fc365e308c6b516c17c09ec1fd8eb8c16482fbf4d55c')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
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
