# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=sipp-git
pkgver=3.6.1.r42.g9f62be0
pkgrel=1
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
source=("git+http://github.com/sipp/sipp")
depends=('openssl' 'libpcap' 'gsl' 'lksctp-tools')
makedepends=('git' 'cmake')
md5sums=('SKIP')

pkgver() {
  cd "sipp"
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "sipp"
  git submodule update --init
}

build() {
  cd "sipp"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_SSL=ON \
    -DUSE_PCAP=ON \
    -DUSE_SCTP=ON \
    .
  make sipp
}

check() {
  cd "sipp"
  make sipp_unittest

  ./sipp_unittest
}

package() {
  make -C "sipp" DESTDIR="$pkgdir" install
}
