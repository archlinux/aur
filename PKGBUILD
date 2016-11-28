# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=iproute-mptcp
pkgver=0.91.1
pkgrel=1
pkgdesc="IP Routing Utilities, with Multipath TCP support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://multipath-tcp.org/pmwiki.php/Users/Tools"
depends=('glibc' 'iptables')
makedepends=('linux-atm')
optdepends=('linux-atm: ATM support')
provides=('iproute2')
conflicts=('iproute2')
options=('staticlibs' '!makeflags')
backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
	'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/multipath-tcp/$pkgname/archive/v$pkgver.tar.gz"
        "iproute2-fhs.patch"
        "unwanted-link-help.patch")
sha256sums=('c115591ea271b894c795d6be8840dac11d2cf71a712956dd40b1c685ad6f77f7'
            'fa569bd5be8c6c47d43e84b8836436e15cec3347326aa896bb55a8babe9cb0bd'
            '3f72492554a5417c13b2b6f6222c158319ce91c0b6c25fd651f49add493323a7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/iproute2-fhs.patch"

  # allow operations on links called "h", "he", "hel", "help"
  patch -Np1 -i "${srcdir}/unwanted-link-help.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"

  # move binaries
  cd "${pkgdir}"
  mv sbin usr/bin
}
