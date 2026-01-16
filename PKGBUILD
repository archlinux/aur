# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=opodsync
pkgver=0.5.1
pkgrel=1
pkgdesc="minimalist GPodder-compatible server"
arch=('any')
url="https://fossil.kd2.org/opodsync/doc/main/README.md"
license=('AGPL-3.0-or-later')
depends=(
  'php'
  'php-sqlite'
)
optdepends=(
  'php-fpm: to run in FastCGI process manager'
  'nginx: Nginx webserver'
  'apache: Apache webserver'
  'caddy: Caddy webserver'
)
backup=(etc/opodsync/config.php)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kd2org/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=('3b6b73958406da836d6e32354eaee72b48d419d9cc2b48db0d8f0e889332b5e88bbf27d953e73e63f3393d5dbf8ea446a967ab25c81d8be72151b22b1ac2caff'
        '500aa3dd73f3de17326da6bb90863b29b9487f22ccdd92597f0184db2eca85de8ac0e602a0e0b100e19ce9240ebd0d89e9393182d5cd2a11125d619bf485c085'
        '03a45ca033ade9679d9c1a52df7b67b3dea86189488cf15b6241f48d349e2e9a6a1eb7c6462b75cf5c0a325e021c70ae8fc7a9ad04ed7dda673b3420a9a11569')

package() {
  # systemd integration
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname-$pkgver"
  _instdir="$pkgdir"/usr/share/webapps/opodsync
  install -d "$pkgdir"/usr/share/webapps/ "$pkgdir"/etc/opodsync "$pkgdir"/var/lib/opodsync/data "$pkgdir"/var/log/opodsync
  cp -r "${srcdir}/${pkgname}-${pkgver}/server" "$_instdir"
  install -Dm644 "config.dist.php" "$pkgdir"/etc/opodsync/config.php

  # Setup detfault config
  sed -i "s|const DATA_ROOT = ROOT . '/data';|const DATA_ROOT = '/var/lib/opodsync/data';|g" "$pkgdir"/etc/opodsync/config.php
  sed -i "s|const ERRORS_SHOW = true;|const ERRORS_SHOW = false;|g" "$pkgdir"/etc/opodsync/config.php

  # setup logging
  sed -i "s|ErrorManager::setLogFile(ROOT . 'error.log');|ErrorManager::setLogFile('/var/log/opodsync/error.log');|g" "$_instdir"/_inc.php
  sed -i "s|const ERRORS_LOG = DATA_ROOT . '/error.log';|const ERRORS_LOG = '/var/log/opodsync/error.log';|g" "$pkgdir"/etc/opodsync/config.php

  # set config path
  sed -i "s|(getenv('DATA_ROOT') ?: ROOT . '/data') . '/config.local.php';|'/etc/opodsync/config.php';|g" "$_instdir"/_inc.php

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
