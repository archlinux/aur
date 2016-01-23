# $Id: PKGBUILD 152069 2015-12-10 04:13:47Z foutrelis $
# Maintainer: Kyle Keen <keenerd@gmail.com>
_pkgbasename=zeromq
pkgname=lib32-zeromq
pkgver=4.1.3
pkgrel=4
pkgdesc="Fast messaging system built on sockets.  C and C++ bindings.  aka 0MQ, ZMQ."
arch=('x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('gcc-multilib' 'lib32-util-linux' 'lib32-libsodium' 'lib32-libpgm')
makedepends=('asciidoc' 'xmlto')
options=('staticlibs')
source=("http://download.zeromq.org/$_pkgbasename-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/zeromq/cppzmq/a88bf3e0b/zmq.hpp')
md5sums=('d0824317348cfb44b8692e19cc73dc3a'
         '3b61c38fca2967e3c7ef252516da5dd1')

prepare() {
  # Needed for new libsodium
  sed -i 's/libzmq_werror="yes"/libzmq_werror="no"/' $_pkgbasename-$pkgver/configure
}

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure prefix=/usr --with-pgm --with-libsodium \
    --with-documentation --enable-static --libdir=/usr/lib32
  make
}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  # this will fail if zmq.hpp is out of date
  LANG=C gcc -c ../zmq.hpp -L ./.libs/ -I ./include/ -o ./test.o
  rm -f test.o

  if [[ $CARCH == 'i686' ]]; then
    return 0
  fi
  make -k check
}


package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

