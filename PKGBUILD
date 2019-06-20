# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=kronosnet
pkgver=1.10
pkgrel=1
pkgdesc="VPNs on steroids"
arch=('i686' 'x86_64')
url="http://www.kronosnet.org/"
license=('GPL2')
makedepends=('lksctp-tools' 'doxygen' 'libqb')
depends=('nss' 'lzo' 'zstd')
source=("https://kronosnet.org/releases/$pkgname-$pkgver.tar.xz")
md5sums=('b2ec4275f5cbac2765ca89a3e5de19fc')

prepare() {
  cd ${pkgname}-${pkgver}
  echo ${pkgver}|sed 's,\.r,.,;s,\.g,-,;s,..$,,' >.tarball-version
  sed -e 's,rx_thread = NULL;,rx_thread = 0;,' -i libknet/tests/knet_bench.c
  sed -e 's,%zu,%ld,g' -i libknet/tests/api_knet_link_get_ping_timers.c
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --enable-publicandocs \
              --with-systemddir=/usr/lib/systemd/system
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

