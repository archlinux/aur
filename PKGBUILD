# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.11.2
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="https://gitlab.com/ocserv/ocserv"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libnl' 'libsystemd' 'pam' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client' 'libev' 'oath-toolkit')
makedepends=('freeradius' 'gperf')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/ocserv/ocserv/repository/archive.tar.gz?ref=ocserv_0_11_2")
sha256sums=('f78e2b866f0b883af8b55aa2f42d119d9adf914b0725c5c9a54ec85912713d72')

prepare() {
  cd ${pkgname}-${pkgname}_*
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgname}_*
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgname}_*
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
  install -Dm0644 doc/systemd/standalone/ocserv.service "$pkgdir/usr/lib/systemd/system/ocserv.service"
}
