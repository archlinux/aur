# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=kronosnet
pkgver=0.0.r1101.g3cea157
pkgrel=1
pkgdesc="VPNs on steroids"
arch=('i686' 'x86_64')
url="http://www.kronosnet.org/"
license=('GPL2')
depends=('nss')
commit='3cea1579c6c93553921548358be04edf8a7ba5b4'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fabbione/kronosnet/archive/${commit}.tar.gz")
md5sums=('d148b869f2ada482ccd82961310f3c40')

prepare() {
  cd ${pkgname}-${commit}
  echo ${pkgver}|sed 's,\.r,.,;s,\.g,-,;s,...$,,' >.tarball-version
  sed -e 's,rx_thread = NULL;,rx_thread = 0;,' -i libknet/tests/knet_bench.c
  sed -e 's,%zu,%ld,g' -i libknet/tests/api_knet_link_get_ping_timers.c
  ./autogen.sh
}

build() {
  cd ${pkgname}-${commit}
  ./configure --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --enable-publicandocs \
              --with-systemddir=/usr/lib/systemd/system
  make V=0
}

package() {
  cd ${pkgname}-${commit}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

