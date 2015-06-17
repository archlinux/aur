# Maintainer: Anatol Pomozov anatol dot pomozov at g mail
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: bender02 at archlinux dot us
# Contributor: Felix Saparelli <me@passcod.name>

pkgname=mongoose
pkgver=5.6
pkgrel=1
pkgdesc='Easy to use, powerful, embeddable web server'
arch=(i686 x86_64)
license=(GPL2)
depends=(glibc openssl)
backup=(etc/mongoose/mongoose.conf)
url='https://github.com/cesanta/mongoose'
source=(https://github.com/cesanta/mongoose/archive/$pkgver.tar.gz
        mongoose.conf
        mongoose.service)
sha1sums=('e99340a6db580af2e5abab738b3fab4a10fae843'
          'dc53f149c21243e65dbc6e6463f9b373026e79d8'
          '493e5792257b6ea9651f1042683385d4850cc28d')

build() {
  cd mongoose-$pkgver
  # hopefully upstream will provdide an official Makefile
  # https://github.com/cesanta/mongoose/issues/326
  gcc -shared -fPIC -DNS_ENABLE_SSL $CFLAGS $LDFLAGS mongoose.c -o libmongoose.so -lssl

  cd examples/web_server
  make web_server
}

package() {
  install -D -m644 mongoose.conf "$pkgdir/etc/mongoose/mongoose.conf"
  install -D -m644 mongoose.service "$pkgdir/usr/lib/systemd/system/mongoose.service"

  cd mongoose-$pkgver
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 libmongoose.so "$pkgdir/usr/lib/libmongoose.so"
  install -D -m644 mongoose.h "$pkgdir/usr/include/mongoose.h"
  install -D -m755 examples/web_server/web_server "$pkgdir/usr/bin/mongoose"
}
