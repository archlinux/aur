# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>

_pkgname=sipp
pkgname=sipp-git
pkgver=3.6.1.r42.g9f62be0
pkgrel=2
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
depends=('openssl' 'libpcap' 'gsl' 'lksctp-tools')
makedepends=('git' 'cmake')
source=("$pkgname::git+http://github.com/sipp/sipp")
sha256sums=('SKIP')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git submodule update --init
}

build() {
  cd ${pkgname}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_SSL=ON \
    -DUSE_PCAP=ON \
    -DUSE_SCTP=ON \
    .
  make sipp
}

check() {
  cd ${pkgname}
  make sipp_unittest

  ./sipp_unittest
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir" install
}
