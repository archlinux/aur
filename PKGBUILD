# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=archifiltre-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Provides you with an export script that you can run directly on your file server. It allows you to generate a file that can be directly sent to an archivist"
arch=('x86_64')
url='https://archifiltre.fabrique.social.gouv.fr'
license=('MIT')
provides=("${pkgname%-bin}")
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/SocialGouv/archifiltre/releases/download/v${pkgver}/archifiltre.tar.gz"
        'LICENSE::https://github.com/SocialGouv/archifiltre/raw/master/LICENSE')
sha256sums=('689cfd97dd09906f70d140cc6816d9b08c0ab3773eb2096fae494469eb21a97d'
            '65391aaa97d61e1d969cdbd8d822ef708c9e9b3a9b6845f18ed52047496187d3')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/archifiltre.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Archifiltre" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}