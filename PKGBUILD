# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=1.2.0
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="https://gitlab.com/openconnect/ocserv"
license=('GPL2')
depends=('autogen' 'libpcl' 'http-parser' 'libnl' 'libsystemd' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client' 'libev' 'oath-toolkit' 'geoip')
makedepends=('freeradius' 'gperf')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("https://gitlab.com/openconnect/ocserv/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6eb0929adb0c4c7a47621e00e5bcf1aa47e7ac764e66e5f3e31125c12ba62d41')

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
