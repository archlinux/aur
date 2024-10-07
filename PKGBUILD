# Maintainer: A. Jack Roehr <jack at roe dot hr>

pkgname=zeromq3
pkgver=3.2.5
pkgrel=2
pkgdesc="Fast messaging system built on sockets, C and C++ bindings.  aka 0MQ, ZMQ."
arch=('i686' 'x86_64')
url="http://www.zeromq.org"
license=('LGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('pkg-config' 'python2')

build() {
  ./configure --with-foo \
    $OPTS
}
options=("strip" "debug" "zipman" "!staticlibs")
conflicts=('zeromq')
#https://raw.githubusercontent.com/zeromq/cppzmq/1f05e0d11/zmq.hpp
#'6a7b5e04ff4a55c75683aa9fa7ec8e5e'
source=("https://github.com/zeromq/zeromq3-x/releases/download/v$pkgver/zeromq-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/zeromq/cppzmq/1f05e0d11/zmq.hpp"
	"1_FIX_MISSING_TIME_H.patch")
b2sums=("88fe3b3206f0e59acb3cf370964c9e40df2dceb5e40aef85ae8cd8fedef4c655fd2698a7f81431e34550b5156814a75c0b1a738393e7c44acbfefe96acc4c4bc"
	"d29c6fe033804d597108d41db676e62b71819753e85b687d94d2d0fa2dd45a120d8084f9cb27004ce1613913b5a8ffaa1a5c17f19a43e197e1c163a0340da04f"
	"2ba5bd092c7de27a43b30c5d542eaf8c32171d2a4d5073869e2ca5fbffdd61fe4bf706ce7f4ed2bb8afc1228b8884cc5862212565cb86476b94186725221784c")

prepare() {
	cd zeromq-$pkgver
	patch -Np1 -i ../1_FIX_MISSING_TIME_H.patch
}

build() {
  cd "$srcdir/zeromq-$pkgver"
  ./configure prefix=/usr \
	  --with-pgm \
	  --disable-dependency-tracking \
	  --enable-shared \
	  --enable-fast-install \
	  --with-gcov=no
  sed -i 's/python$/&2/' foreign/openpgm/build-staging/openpgm/pgm/{Makefile,version_generator.py}
  make -j$(nproc)
}

package() {
  cd "$srcdir/zeromq-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/zmq.hpp" "$pkgdir/usr/include/zmq.hpp"
}
