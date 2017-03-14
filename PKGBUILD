# Maintainer: Alexander Görtz <aur@nyloc.de>
# Community Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Frederik Schwan frederik dot schwan at linux dot com>

pkgname=unifi-unstable
pkgver=5.5.7.0cbda0cd4a
_pkgver=5.5.7-0cbda0cd4a
pkgrel=1
pkgdesc='Centralized management system for Ubiquiti UniFi AP'
arch=('any')
url='https://community.ubnt.com/unifi'
# We are allowed to ship the software in our repository
# https://mailman.archlinux.org/mailman/private/arch-dev/2014-August/015690.html
license=('custom')
depends=('mongodb' 'java-runtime-headless' 'fontconfig')
conflicts=('tomcat-native' 'unifi' 'unifi-beta')
provides=('unifi')
source=("UniFi-$pkgver.zip::https://www.ubnt.com/downloads/unifi/$_pkgver/UniFi.unix.zip"
        'unifi.service'
        'unifi.sysusers'
        'LICENSE')
md5sums=('f6410763493201ce022717a13c48fb56'
         '79998cabf110d9a96ba4d3367101c94c'
         'a92291a0074a5dcf414da4dfe812bc2a'
         '2c5d961c64e9309baf12f83e401ff2a4')

package() {
  # lib
  install -dm755 "$pkgdir/usr/lib/unifi"
  cp -r UniFi/{bin,dl,lib,webapps} "$pkgdir/usr/lib/unifi"

  # data
  install -dm750 "$pkgdir/var/lib/unifi"
  for _d in data run work; do
    install -dm750 "$pkgdir/var/lib/unifi/$_d"
    ln -s "../../../var/lib/unifi/$_d" "$pkgdir/usr/lib/unifi/$_d"
  done
  chown -R 113:113 "$pkgdir/var/lib/unifi"

  # log
  install -dm750 "$pkgdir/var/log/unifi"
  ln -s ../../../var/log/unifi "$pkgdir/usr/lib/unifi/logs"
  chown -R 113:113 "$pkgdir/var/log/unifi"

  # readme
  install -Dm644 UniFi/readme.txt "$pkgdir/usr/share/doc/${pkgname%-unstable}/README"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-unstable}/LICENSE"

  # systemd
  install -Dm644 ${pkgname%-unstable}.service "$pkgdir/usr/lib/systemd/system/${pkgname%-unstable}.service"
  install -Dm644 ${pkgname%-unstable}.sysusers "$pkgdir/usr/lib/sysusers.d/${pkgname%-unstable}.conf"
}

# vim:set ts=2 sw=2 ft=sh et:

