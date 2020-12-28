# Contributor: Kyle Keen <keenerd@gmail.com>
# Maintainer: Jakob <grandchild@gmx.net>

_pkgname=zeromq
pkgname=${_pkgname}-draft
pkgver=4.3.3
_cppver=4.7.1
pkgrel=1
pkgdesc="Fast messaging system built on sockets. C and C++ bindings. aka 0MQ, ZMQ. With draft APIs."
arch=('x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('gcc-libs' 'util-linux' 'libsodium' 'libpgm')
makedepends=('asciidoc' 'xmlto')
conflicts=('zeromq')
options=('staticlibs')
# "http://download.zeromq.org/$_pkgname-$pkgver.tar.gz"
source=("https://github.com/${_pkgname}/libzmq/releases/download/v$pkgver/${_pkgname}-${pkgver}.tar.gz"
        "zmq.hpp.$pkgver.tgz::https://github.com/${_pkgname}/cppzmq/archive/v${_cppver}.tar.gz")
sha256sums=('9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2'
            '9853e0437d834cbed5d3c223bf1d755cadee70e7c964c6e42c4c6783dee5d02c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure prefix=/usr --with-pgm --with-libsodium \
    --with-documentation --enable-static --disable-Werror --enable-drafts
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  # this will fail if zmq.hpp is out of date
  LANG=C gcc -c ../cppzmq-$_cppver/zmq.hpp -L ./.libs/ -I ./include/ -o ./test.o
  rm -f test.o

  if [[ $CARCH == 'i686' ]]; then
    return 0
  fi
  make -k check
}


package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  cd "$srcdir/cppzmq-$_cppver"
  install -Dm644 zmq.hpp "$pkgdir/usr/include/zmq.hpp"
  install -Dm644 zmq_addon.hpp "$pkgdir/usr/include/zmq_addon.hpp"
}
