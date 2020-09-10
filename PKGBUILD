# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scrapestorm
pkgver=3.5.3
pkgrel=2
pkgdesc="AI-Powered visual website scraper, which can be used to extract data from almost any websites without writing any code"
arch=('x86_64')
url='https://www.scrapestorm.com'
license=("custom:${pkgname}")
depends=('pango-legacy' 'bash' 'gconf')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://scrapestorm2.azureedge.net/update/en/nature/ScrapeStorm-${pkgver}.AppImage"
        'LICENSE')
sha256sums=('abb7350d0337b25629e2ec3ba48bb3436b45e4d7f72da00685c26ea0d650f888'
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
  LD_LIBRARY_PATH=/opt/pango-legacy/usr/lib /opt/scrapestorm/app/ScrapeStorm" > scrapestorm
  install -Dm755 scrapestorm -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}