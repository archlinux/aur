# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=recollectr
pkgver=latest
pkgrel=1
pkgdesc="Record and recall without breaking your flow"
arch=('x86_64')
url='https://recollectr.io'
license=("custom:${pkgname}")
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://recollectr.io/download/linux/"
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/recollectr.png "${pkgdir}/usr/share/pixmaps/recollectr.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Recollectr" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Office;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/recollectr"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}