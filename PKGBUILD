# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=kronosnet-git
_pkgname=kronosnet
pkgver=1.23.r2.gbf929fc3
pkgrel=1
pkgdesc="VPNs on steroids"
arch=('i686' 'x86_64')
url="http://www.kronosnet.org/"
license=('GPL2')
makedepends=('git' 'doxygen' 'lksctp-tools' 'libqb-git')
depends=('nss' 'lzo' 'zstd' 'bzip2' 'libnl')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/$_pkgname/$_pkgname.git#branch=stable1-proposed")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -e 's,rx_thread = NULL;,rx_thread = 0;,' -i libknet/tests/knet_bench.c
  sed -e 's,%zu,%ld,g' -i libknet/tests/api_knet_link_get_ping_timers.c
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --enable-publicandocs \
              --with-systemddir=/usr/lib/systemd/system
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

