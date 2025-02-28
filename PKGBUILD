# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=owntone-server
pkgver=28.12
pkgrel=1
pkgdesc='iTunes-compatible media server (fka forked-daapd) (rewrite of mt-daapd)'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/owntone/owntone-server"
license=('GPL-2.0-or-later')
depends=(avahi sqlite3 ffmpeg confuse libevent libxml2 libunistring libplist libsodium protobuf-c json-c libwebsockets)
makedepends=(gperf)
backup=(etc/owntone.conf)
install=owntone.install
source=(https://github.com/owntone/owntone-server/archive/$pkgver.tar.gz owntone.install override.conf)
sha256sums=('c4d795d25a93e9f391feb70807472589810465684281e67cb5c77f9225eb1f0b'
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
