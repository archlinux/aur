pkgname=redisinsight
pkgver=2.0.3
pkgrel=1
pkgdesc="RedisInsight is a desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data."
arch=('x86_64')
url='https://redis.com/redis-enterprise/redis-insight'
license=('custom:unknown')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://download.redisinsight.redis.com/latest/RedisInsight-preview-linux.AppImage")
sha256sums=('b654998755b34e563aa670054492081a99049e565830bc927f020dd29ad585c0')

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
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/redisinsight"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
