# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=proxygen-git
pkgver=r209.0953640
pkgrel=1
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server"
arch=('i686' 'x86_64')
url="https://github.com/facebook/proxygen"
license=('Apache')
depends=('fbthrift' 'libcap')
source=('git+https://github.com/facebook/proxygen.git' 
'EchoServer.cpp.patch')
makedepends=('git' 'autoconf-archive' 'wget' 'ruby' 'gperftools')
options=('!makeflags')
md5sums=('SKIP'
         'f587fd8970bd02648474dac6d9d62326')
_pkgname=${pkgname%-git}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname/$_pkgname"
  autoreconf -ivf
  cd httpserver/samples/echo
  patch --verbose -p0 < $srcdir/EchoServer.cpp.patch
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname"
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --with-gnu-ld=yes \
    --with-sysconfdir=/etc \
    --with-sysroot=/usr

  make
}

check() {
  cd "$srcdir/$_pkgname/$_pkgname"
  make check
}

package() {
  cd "$srcdir/$_pkgname/$_pkgname"
  make DESTDIR="$pkgdir/" install
  # by default, 'make install' skips 'external' directory
  for i in http_parser_cpp.cpp http_parser.{c,h}; do
    install -Dm644 external/http_parser/$i $pkgdir/usr/include/external/http_parser/$i
  done
  install -Dm755 httpserver/samples/echo/echo_server $pkgdir/usr/bin/echo_server
}

# vim:set ts=2 sw=2 et:
