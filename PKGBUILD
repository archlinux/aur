# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=kronosnet-git
pkgver=0.0.r1101.g3cea157
pkgrel=3
pkgdesc="VPNs on steroids"
arch=('i686' 'x86_64')
url="http://www.kronosnet.org/"
license=('GPL2')
makedepends=('git' 'libqb-git')
depends=('nss')
provides=('kronosnet')
conflicts=('kronosnet')
source=("$pkgname::git+https://github.com/fabbione/kronosnet.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -e 's,rx_thread = NULL;,rx_thread = 0;,' -i libknet/tests/knet_bench.c
  sed -e 's,%zu,%ld,g' -i libknet/tests/api_knet_link_get_ping_timers.c
  mkdir -p m4
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --libdir=/usr/lib
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

