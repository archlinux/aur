# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: pandan <predrg@gmail.com>

pkgname=webdis
pkgver=0.1.1
pkgrel=1
pkgdesc='REST server for Redis data'
arch=('x86_64' 'i686')
url='http://webd.is/'
license=('BSD')
depends=('redis' 'libevent' 'jansson')
makedepends=('git')
install='webdis.install'
source=('webdis::git://github.com/nicolasff/webdis.git#tag=0.1.1'
        'webdis.service'
        'webdis.logrotate')
sha256sums=('SKIP'
            '3c77e6968a0926c8b56755acab430f32c3e883f50b2f6f59d4dce2501bf247a7'
            'f409fefee8533e60db6a6340c021b77b57f55cfcbf26ae4acdc3b672c7aa79b7')

pkgver() {
  cd "${pkgname%-git}"

  git describe --tags
}

build() {
  make -C "${pkgname%-git}" LDFLAGS+="-levent -pthread" \
    CFLAGS+="-I. -Ihttp-parser -Iformats -Ijansson/src"
}

package() {
  cd "${pkgname%-git}"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/webdis/COPYING"
  install -Dm644 "$srcdir/webdis.service" \
    "$pkgdir/usr/lib/systemd/system/webdis.service"
  install -Dm644 "$srcdir/webdis.logrotate" \
    "$pkgdir/etc/logrotate.d/webdis"
}

# vim:set ts=2 sw=2 et:
