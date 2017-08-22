# $Id: PKGBUILD 242345 2017-07-04 23:53:29Z seblu $
# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Frederik Schwan frederik dot schwan at linux dot com>

pkgname=unifi
pkgver=5.5.19
pkgrel=1
pkgdesc='Centralized management system for Ubiquiti UniFi AP'
arch=('any')
url='https://community.ubnt.com/unifi'
# We are allowed to ship the software in our repository
# https://mailman.archlinux.org/mailman/private/arch-dev/2014-August/015690.html
license=('custom')
depends=('mongodb' 'java-runtime-headless' 'fontconfig')
conflicts=('tomcat-native')
source=("UniFi-$pkgver.zip::https://dl.ubnt.com/unifi/$pkgver/UniFi.unix.zip"
        'unifi.service'
        'unifi.sysusers'
        'LICENSE')
md5sums=('1f784ada6d9d28b9c258325df9accc25'
         '79998cabf110d9a96ba4d3367101c94c'
         'a92291a0074a5dcf414da4dfe812bc2a'
         '63a6f9e67db6a466f31a40c228c16d63')

package() {
  # lib
  install -dm755 "$pkgdir/usr/lib/unifi"
  cp -r UniFi/{bin,dl,lib,webapps} "$pkgdir/usr/lib/unifi"
  rm -r "$pkgdir/usr/lib/unifi/lib/native"

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
  install -Dm644 UniFi/readme.txt "$pkgdir/usr/share/doc/$pkgname/README"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # systemd
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 ft=sh et:
