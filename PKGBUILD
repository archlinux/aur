# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=sipp-git
pkgver=3.5.0.rc1.149.gd787e09
pkgrel=2
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
source=("git+http://github.com/sipp/sipp")
depends=('openssl' 'libpcap' 'gsl')
makedepends=('git')
md5sums=('SKIP')

pkgver() {
  cd "sipp"
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "sipp"
  git submodule update --init
}

build() {
  cd "sipp"
  autoreconf -vifs
  ./configure --prefix=/usr \
	--with-openssl \
	--with-pcap \
	--with-rtpstream \
	--with-gsl

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
