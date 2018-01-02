# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=zmeventserver-git
_pkgname=${pkgname%%-git}
pkgver=20171227.b6a8eca
pkgrel=2
pkgdesc='A WSS (Secure Web Sockets) based event notification server that broadcasts new events to any authenticated listeners.'
arch=(any)
url='https://github.com/pliablepixels/zmeventserver'
license=(GPL3)
depends=(
  perl-crypt-mysql
  perl-io-socket-ssl
  perl-json
  perl-lwp-protocol-https
  perl-net-websocket-server
)
makedepends=(git)
source=(
  git+https://github.com/pliablepixels/zmeventserver.git
  zmeventserver.service
)
sha256sums=(
  SKIP
  24a523f42e0022792db99acdfb27c44f9951e25cd7ddcd92b82abbf60fe4d623
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  install -Dm 755 \
    "$srcdir/zmeventserver/zmeventnotification.pl" \
    "$pkgdir/usr/bin/zmeventnotification.pl"
  install -Dm 644 \
    "$srcdir/zmeventserver.service" \
    "$pkgdir/usr/lib/systemd/system/zmeventserver.service"

  install -dm 770 -g http "$pkgdir/etc/webapps/zmeventserver"
  sed -i \
    's,/etc/\(apache2/ssl\|private\),/etc/webapps/zmeventserver,' \
    "$pkgdir/usr/bin/zmeventnotification.pl"
}
