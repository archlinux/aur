# Maintainer: Dan Walsh <dan@danwalsh.ca>
pkgname=redisinsight
pkgver=2.20.0
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
makedepends=('gendesk' 'nodejs' 'yarn')
source=("git+https://github.com/RedisInsight/RedisInsight.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/RedisInsight"
  git checkout "release/$pkgver"
  yarn install
  yarn --cwd redisinsight/api/
  NODE_OPTIONS=--openssl-legacy-provider yarn package:prod
}

package() {
  cd "$srcdir/RedisInsight/release/linux-unpacked"
  install -Dm644 resources/resources/icons/512x512.png "${pkgdir}/usr/share/pixmaps/redisinsight.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "RedisInsight" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 resources/LICENSE.redisinsight.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -avR * "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/redisinsight "${pkgdir}/usr/bin/redisinsight"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
