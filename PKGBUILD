# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ananas-desktop
pkgver=0.9.0
pkgrel=1
pkgdesc="A hackable data integration & analysis tool to enable non technical users to edit data processing jobs and visualise data on demand"
arch=('x86_64')
url='https://ananasanalytics.com'
license=('Apache')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ananas-analytics/ananas-desktop/releases/download/v${pkgver}/Ananas.Analytics.Desktop.Edition.${pkgver}.linux.AppImage")
sha256sums=('5b9dc4178a560d88b496c18f0cf2929d02579c941871162163da299b2b46a2b3')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/ananasanalytics.png "${pkgdir}/usr/share/pixmaps/ananas-desktop.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Ananas Desktop" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/ananas-desktop"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}