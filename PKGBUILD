pkgname=chaosvpn
pkgver=2.18
pkgrel=1
pkgdesc="Config generator for chaosVPN"
arch=('i686' 'x86_64')
url="http://wiki.hamburg.ccc.de"
license=('Apache')
makedepends=('git' 'flex')
depends=('tinc' 'iproute2')
backup=(etc/tinc/chaosvpn.conf)

source=(git://github.com/ryd/chaosvpn.git
        iproute2-chaosvpn.patch
        iproute2-warzone.patch
        chaosvpn.service)
md5sums=('SKIP'
         '31f1d9c064d3cdefb424e6b44805e824'
         '8d8a99003bf186b6dd7e5fd2e80e0cad'
         '97e364f361231d1f2cba0c784719be55')

pkgver() {
  cd "$pkgname"
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed 's#/sbin#/bin#g' -i Makefile
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/chaosvpn.service" "$pkgdir/usr/lib/systemd/system/chaosvpn.service"

  patch -d "$pkgdir/etc/tinc" -p0 -i "$srcdir/iproute2-chaosvpn.patch"
  patch -d "$pkgdir/etc/tinc" -p0 -i "$srcdir/iproute2-warzone.patch"

  sed -e 's|/sbin/ip|/usr/sbin/ip|g' -i "$pkgdir/etc/tinc/chaosvpn.conf" "$pkgdir/etc/tinc/warzone.conf"
}
