# Maintainer: minus <aur@mnus.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: pandan <predrg@gmail.com>

pkgname=webdis
pkgver=0.1.4
pkgrel=1
pkgdesc='REST server for Redis data'
arch=('x86_64' 'i686')
url='https://webd.is/'
license=('BSD')
depends=('redis' 'libevent' 'jansson')
install='webdis.install'
source=("https://github.com/nicolasff/webdis/archive/$pkgver.tar.gz"
        'webdis.service'
        'webdis.logrotate')
sha256sums=('2e384eae48cfc2e4503e3311c61d4790e5d3b3ab5cf82ec554c0bef5d84c6807'
            '3c77e6968a0926c8b56755acab430f32c3e883f50b2f6f59d4dce2501bf247a7'
            'f409fefee8533e60db6a6340c021b77b57f55cfcbf26ae4acdc3b672c7aa79b7')

build() {
  make -C "$pkgname" LDFLAGS+="-levent -pthread" \
    CFLAGS+="-I. -Ihttp-parser -Iformats -Ijansson/src"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/webdis/COPYING"
  install -Dm644 "$srcdir/webdis.service" \
    "$pkgdir/usr/lib/systemd/system/webdis.service"
  install -Dm644 "$srcdir/webdis.logrotate" \
    "$pkgdir/etc/logrotate.d/webdis"
}

# vim:set ts=2 sw=2 et:
