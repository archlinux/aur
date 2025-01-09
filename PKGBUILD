# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=1.3.0
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="https://gitlab.com/openconnect/ocserv"
license=(GPL-2.0-or-later)
depends=('autogen' 'http-parser' 'libnl' 'libsystemd' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client' 'libev' 'oath-toolkit' 'geoip')
makedepends=('freeradius' 'gperf' 'ipcalc')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("https://gitlab.com/openconnect/ocserv/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('69795a7a0a4376a80f03bb4fd1fd3a99095ba9cafd54323d582e8ab5006015d3')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
  install -Dm0644 doc/systemd/standalone/ocserv.service "$pkgdir/usr/lib/systemd/system/ocserv.service"
}
