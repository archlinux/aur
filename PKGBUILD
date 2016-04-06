# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.11.1
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="https://gitlab.com/ocserv/ocserv"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libnl' 'libsystemd' 'pam' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client' 'libev')
makedepends=('freeradius' 'gperf')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/ocserv/ocserv/repository/archive.tar.gz?ref=ocserv_0_11_1"
	libs.patch)
sha256sums=('c01a992c5bd945756fa1b11b8899bf2f42a70076ac76067243c4bd03d3552feb'
            'ac600ec5bf93a677a5d28fc2492ecdf07b391bb4f30f88a1075024a755ffb308')

prepare() {
  cd ${pkgname}-${pkgname}_*
  patch -Np0 -b -z .orig < ../libs.patch
  autoreconf -fiv
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
