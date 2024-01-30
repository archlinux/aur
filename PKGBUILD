# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=owntone-server
pkgver=28.9
pkgrel=1
pkgdesc="iTunes-compatible media server previously known as forked-daapd, originally intended as a rewrite of Firefly Media Server (mt-daapd)."
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/owntone/owntone-server"
license=('GPL')
depends=(avahi sqlite3 ffmpeg confuse libevent mxml libunistring libplist libsodium protobuf-c json-c libwebsockets)
makedepends=(gperf)
backup=(etc/owntone.conf)
install=owntone.install
source=(https://github.com/owntone/owntone-server/archive/$pkgver.tar.gz owntone.install override.conf)
sha256sums=('e7939e683174b4e69252b313804d24bc61727536ad0eee6a147595ec8bad150b'
            'c21617a866ecd4ae1ea81b372e7ad3a782e6b6bcf3b1c03e6f0666953b1844f2'
            '102a179eb7e0c022bf3f8c27656f66ffff0e0b0ae07d65b12d790b9c924f42b0')

build() {
  cd "$srcdir/owntone-server-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-itunes --enable-chromecast --enable-lastfm --with-libwebsockets --sbindir=/usr/bin LDFLAGS="-Wl,--allow-multiple-definition"
  make
}

package() {
  cd "$srcdir/owntone-server-$pkgver"

  install -D -m644 "$srcdir/override.conf" "$pkgdir/usr/lib/systemd/system/owntone.service.d/override.conf"
  install -D -m644 "owntone.service" "$pkgdir/usr/lib/systemd/system/owntone.service"
  make DESTDIR="$pkgdir/" install
  rmdir $pkgdir/var/run
}
