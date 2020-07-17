# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scrapestorm
pkgver=3.5.1
pkgrel=1
pkgdesc="AI-Powered visual website scraper, which can be used to extract data from almost any websites without writing any code"
arch=('x86_64')
url='https://www.scrapestorm.com'
license=("custom:${pkgname}")
depends=('pango-legacy' 'bash')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://scrapestorm2.azureedge.net/update/en/nature/ScrapeStorm-${pkgver}.AppImage"
        'LICENSE')
sha256sums=('57e49f253ee0e66eee40501822f50ffe9578f7a2c8688ff73349799c10548dd9'
            'SKIP')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/ScrapeStorm.png "${pkgdir}/usr/share/pixmaps/scrapestorm.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "ScrapeStorm" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  echo "#!/usr/bin/env bash
  LD_LIBRARY_PATH=/opt/pango-legacy/usr/lib /usr/share/${pkgname}/${pkgname}.AppImage" > scrapestorm
  install -Dm755 scrapestorm -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}