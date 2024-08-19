# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mixo
pkgver=1.71.0
pkgrel=1
pkgdesc="Connect your DJ software, sync your library to all your devices, listen to your sets on your phone, and backup your library to the cloud"
arch=('x86_64')
url='https://www.mixo.dj'
license=("custom:${pkgname}")
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://www.mixo.tech/download/MIXO-${pkgver}.AppImage"
        'LICENSE')
sha256sums=('df877806141c5c89c64178b041a00d1aeecc075252f05561c4c98b8d696e7512'
            '84b2a88e0ca0dad3ddca2244b6300af37da7c79eb83b7dfa21457f8a72def1ee')
package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/mixo.png "${pkgdir}/usr/share/pixmaps/mixo.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "MIXO" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Network;Audio;AudioVideo;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/${pkgname}"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod o-w {} +
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
