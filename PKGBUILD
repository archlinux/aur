# $Id$
# Maintainer: Nils Czernia <nils[at]czserver.de>
# Based on the offical 'communiti/unifi' package from:
#    Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
#    Contributor: Frederik Schwan frederik dot schwan at linux dot com>

pkgname=unifi-voip
pkgver=1.0.5
_pkgver="1.0.5-kxe7d9"
pkgrel=2
pkgdesc='Centralized management system for Ubiquiti UniFi VoIP hardware'
arch=('any')
url='https://www.ubnt.com/download/unifi-video/'
license=('custom')
depends=('mongodb' 'java-runtime-headless' 'fontconfig')
conflicts=('tomcat-native')
install=unifi-voip.install
source=("UniFiVoip-$pkgver.zip::http://dl.ubnt.com/unifi-voip/$_pkgver/UniFiVoip.unix.zip"
        'unifi-voip.service'
        'unifi-voip.sysusers'
        'LICENSE')
sha256sums=('e1e6115817687f52ead6c58fcb4dd29e5a871740cbafee5bba47b1e0dcf714c2'
            'c00bec077663bf579725dd1eb5e487e25824106791de61c9c3c038954ef5a824'
            'f153a78bc8d69173a1bf642a5a8082c1c93005d0364a0b59403dbb9d1a306f36'
            '80205a13ec23f81eec8ea07bc0494284aa90fdf5928f9bfc4d296e594a4c889b')

package() {
  # lib
  install -dm755 "$pkgdir/usr/lib/unifi-voip"
  cp -r UniFiVoip/{bin,dl,lib,webapps} "$pkgdir/usr/lib/unifi-voip"

  # data
  install -dm750 "$pkgdir/var/lib/unifi-voip"
  for _d in data run work; do
    install -dm750 "$pkgdir/var/lib/unifi-voip/$_d"
    ln -s "../../../var/lib/unifi-voip/$_d" "$pkgdir/usr/lib/unifi-voip/$_d"
  done
  chown -R 113:113 "$pkgdir/var/lib/unifi-voip"

  # log
  install -dm750 "$pkgdir/var/log/unifi-voip"
  ln -s ../../../var/log/unifi "$pkgdir/usr/lib/unifi-voip/logs"
  chown -R 113:113 "$pkgdir/var/log/unifi-voip"

  # readme
  install -Dm644 UniFiVoip/readme.txt "$pkgdir/usr/share/doc/$pkgname/README"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # systemd
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 ft=sh et:
