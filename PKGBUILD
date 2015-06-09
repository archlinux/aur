# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=proxygen
pkgver=0.24.0
pkgrel=1
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server"
arch=('i686' 'x86_64')
url="https://github.com/facebook/proxygen"
license=('BSD')
depends=('folly>=0.34.0' 'fbthrift' 'libcap')
source=("https://github.com/facebook/proxygen/archive/v$pkgver.tar.gz"
'EchoServer.cpp.patch'
'HTTPDownstreamSessionTest.cpp.patch'
)
makedepends=('autoconf-archive' 'wget' 'ruby' 'gperftools')
options=('!makeflags')
conflicts=('proxygen-git')
provides=('proxygen')
md5sums=('390b8481e398f54dffed91fde90365bf'
         'f587fd8970bd02648474dac6d9d62326'
         '4b0332e707b17770e72b67da7d9f3e65')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  autoreconf -ivf
  pushd . 
  cd httpserver/samples/echo
  patch --verbose -p0 < $srcdir/EchoServer.cpp.patch
  popd
  cd lib/http/session/test
  patch --verbose -p0 < $srcdir/HTTPDownstreamSessionTest.cpp.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --disable-static \
    --with-gnu-ld=yes \
    --with-sysconfdir=/etc \
    --with-sysroot=/usr

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  make DESTDIR="$pkgdir/" install
  # Install the license
  # By default, 'make install' skips 'external' directory
  for i in http_parser_cpp.cpp http_parser.{c,h}; do
    install -Dm644 external/http_parser/$i $pkgdir/usr/include/external/http_parser/$i
  done
  install -Dm755 httpserver/samples/echo/echo_server $pkgdir/usr/bin/echo_server
}

# vim:set ts=2 sw=2 et:
