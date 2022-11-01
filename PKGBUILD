# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=libxmlrpc
# Using the "super stable" version
pkgver=1.51.08
pkgrel=3
epoch=1
pkgdesc='XML-RPC for C and C++'
arch=(x86_64)
# HTTPS is not available
url='http://xmlrpc-c.sourceforge.net/'
license=(custom)
depends=(curl)
makedepends=(libtool setconf)
conflicts=(xmlrpc-c)
provides=(xmlrpc-c)
replaces=(xmlrpc-c)
options=(!emptydirs)
source=("https://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$pkgver/xmlrpc-$pkgver.tgz")
b2sums=('636215329996a36dc8404e95b8791779f1e6afc063f8a3457c72e04475e49c3cbf213c872934c5116a2e761d579994b7c98fe1f2ad7a6dbb38a370963b921500')

build() {
  cd xmlrpc-$pkgver

  ./configure \
    --disable-cgi-server \
    --disable-libwww-client \
    --disable-libxml2-backend \
    --disable-wininet-client \
    --enable-cplusplus \
    --mandir=/usr/share/man \
    --prefix=/usr

  mkdir -p include/curl
  touch include/curl/types.h

  make CFLAGS_PERSONAL="$CFLAGS -fPIC -w" CXXFLAGS_PERSONAL="$CXXFLAGS -fPIC -w"
  make -C tools CFLAGS_PERSONAL="$CFLAGS -fPIC -w" CXXFLAGS_PERSONAL="$CXXFLAGS -fPIC -w"
}

package() {
  cd xmlrpc-$pkgver

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C tools install

  # Remove references to build directory
  setconf "$pkgdir/usr/bin/xmlrpc-c-config" BLDDIR ''
  setconf "$pkgdir/usr/bin/xmlrpc-c-config" ABS_SRCDIR ''

  # Custom license
  install -Dm644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
