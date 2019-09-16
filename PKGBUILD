# Contributor: Kyle Keen <keenerd@gmail.com>
# Maintainer: Jakob <grandchild@gmx.net>
pkgname=zeromq-draft
_pkgname=zeromq
pkgver=4.3.2
_cppver=4.4.1
pkgrel=2
pkgdesc="Fast messaging system built on sockets. C and C++ bindings. aka 0MQ, ZMQ. With draft APIs."
arch=('x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('gcc-libs' 'util-linux' 'libsodium' 'libpgm')
makedepends=('asciidoc' 'xmlto')
conflicts=('zeromq')
options=('staticlibs')
# "http://download.zeromq.org/$_pkgname-$pkgver.tar.gz"
source=("https://github.com/zeromq/libzmq/releases/download/v$pkgver/zeromq-$pkgver.tar.gz"
        "zmq.hpp.$pkgver.tgz::https://github.com/zeromq/cppzmq/archive/v$_cppver.tar.gz")
        #"zmq.hpp.$pkgver::https://raw.githubusercontent.com/zeromq/cppzmq/b0e6d4b/zmq.hpp")
sha256sums=('ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763'
            '117fc1ca24d98dbe1a60c072cde13be863d429134907797f8e03f654ce679385')

prepare() {
  # Needed for new libsodium
  sed -i 's/libzmq_werror="yes"/libzmq_werror="no"/' $_pkgname-$pkgver/configure
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure prefix=/usr --with-pgm --with-libsodium \
    --with-documentation --enable-static --enable-drafts
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
