# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail.com>
# Contributor: boypt <pentie at gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=zeromq-git
pkgver=4.3.4.r305.g5a5f90e0
pkgrel=1
pkgdesc="Fast messaging system built on sockets. C and C++ bindings. aka 0MQ, ZMQ"
arch=('i686' 'x86_64')
url="https://zeromq.org/"
license=('GPL' 'LGPL')
depends=('glibc' 'libpgm' 'libsodium' 'util-linux')
makedepends=('git' 'asciidoc' 'pkgconf' 'xmlto')
provides=("zeromq=$pkgver" 'libzmq.so')
conflicts=('zeromq')
options=('staticlibs')
source=("git+https://github.com/zeromq/libzmq.git"
        "git+https://github.com/zeromq/cppzmq.git")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "libzmq"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libzmq"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --disable-Werror \
    --enable-static \
    --with-libsodium \
    --with-pgm
  make
}

check() {
  cd "libzmq"

  #make check
}

package() {
  cd "$srcdir/libzmq"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/cppzmq"
  install -Dm644 {zmq.hpp,zmq_addon.hpp} -t "$pkgdir/usr/include"
}
