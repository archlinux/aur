# Maintainer: Dan Walsh <dan@danwalsh.ca>
pkgname=redisinsight
pkgver=2.18.0
pkgrel=1
pkgdesc="Desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data."
arch=('x86_64')
url='https://redis.com/redis-enterprise/redis-insight'
license=('custom:SSPL')
depends=('dbus-glib'
         'nss'
         'libindicator-gtk2'
         'gtk3'
         'libdbusmenu-gtk2'
         'alsa-lib')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://download.redisinsight.redis.com/latest/RedisInsight-v2-linux-x86_64.AppImage" 
        "LICENSE::https://raw.githubusercontent.com/RedisInsight/RedisInsight/main/LICENSE")
sha256sums=('57d50a9794ffb388de3fb7bc58013579f27e2c784b0efb5dc4bf1229cb844c7c'
            '723a1b274ff1653c4414fa9133b11cae6cc0b258af7617967d50c04fa4354c9e')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/redisinsight.png "${pkgdir}/usr/share/pixmaps/redisinsight.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "RedisInsight" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/redisinsight"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
