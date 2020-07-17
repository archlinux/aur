# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=journee-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A simplified, RedNotebook-type journal/diary app. With a focus on minimal design and a distraction free writing environment"
arch=('x86_64')
url='https://adueck.github.io/journee'
license=('Apache')
provides=('journee')
makedepends=('gendesk')
options=('!emptydirs')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://s3.amazonaws.com/journee-app/Journee-${pkgver}-x86_64.AppImage")
sha256sums=('2b05513db146bc19db8dcb691ecbb9c50425a8e9387a801b5b6175b33c5b027f')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/journee.png "${pkgdir}/usr/share/pixmaps/journee.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Journee" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Office;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}