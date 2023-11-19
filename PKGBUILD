# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=1.2.2
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="https://gitlab.com/openconnect/ocserv"
license=('GPL2')
depends=('autogen' 'libpcl' 'http-parser' 'libnl' 'libsystemd' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client' 'libev' 'oath-toolkit' 'geoip')
makedepends=('freeradius' 'gperf')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("https://gitlab.com/openconnect/ocserv/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2cb90577d34c320165eaab138eb000ee8acb210ced7a5b1fba8a260a69b9a42e')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
  install -Dm0644 doc/systemd/standalone/ocserv.service "$pkgdir/usr/lib/systemd/system/ocserv.service"
}
