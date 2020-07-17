# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=querypie
pkgver=6.2.0
pkgrel=1
pkgdesc="The most advanced Data Warehouse Client for data analytics teams.
Optimized for Snowflake, Presto, BigQuery, and Redshift"
arch=('x86_64')
url='https://www.querypie.com'
license=("custom:${pkgname}")
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://d2f8621kw7pn7s.cloudfront.net/latest/QueryPie-${pkgver}.AppImage?v=${pkgver}-latest.200615184"
        'LICENSE')
sha256sums=('8ece78588dc1604cf052c3962b664c8400bdb7516d9a6158d043e532d10a7da1'
            'SKIP')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/querypie.png "${pkgdir}/usr/share/pixmaps/querypie.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "QueryPie" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Application' \
          --icon "${pkgname}" \
          --mimetypes=x-scheme-handler/querypie; \
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/${pkgname}"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}