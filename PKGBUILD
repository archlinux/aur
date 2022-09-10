# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=owntone-server
pkgver=28.5
pkgrel=1
pkgdesc="iTunes-compatible media server previously known as forked-daapd, originally intended as a rewrite of Firefly Media Server (mt-daapd)."
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/owntone/owntone-server"
license=('GPL')
depends=(avahi sqlite3 ffmpeg confuse libevent mxml libunistring libplist libsodium protobuf-c json-c libwebsockets)
makedepends=(gperf)
backup=(etc/owntone.conf)
install=owntone.install
source=(https://github.com/owntone/owntone-server/archive/$pkgver.tar.gz owntone.install)
sha256sums=('cf8cc5979eef026104d79cf3bd133f7ce4838232f0605fb54ea493f057a0a2c8'
            'c21617a866ecd4ae1ea81b372e7ad3a782e6b6bcf3b1c03e6f0666953b1844f2')

build() {
  cd "$srcdir/owntone-server-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-itunes --enable-chromecast --enable-lastfm --with-libwebsockets --sbindir=/usr/bin LDFLAGS="-Wl,--allow-multiple-definition"
  make
}

package() {
  cd "$srcdir/owntone-server-$pkgver"

  install -D -m644 "owntone.service" "$pkgdir/usr/lib/systemd/system/owntone.service"
  make DESTDIR="$pkgdir/" install
  rmdir $pkgdir/var/run
}
