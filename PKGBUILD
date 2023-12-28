# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=libxmlrpc
pkgver=1.59.02 # latest "super stable" release from https://t.ly/6IEne
pkgrel=1
epoch=1
pkgdesc='XML-RPC for C and C++'
arch=(x86_64)
url='https://xmlrpc-c.sourceforge.net/'
license=(custom)
depends=(curl)
makedepends=(libtool setconf)
conflicts=(xmlrpc-c)
provides=(xmlrpc-c)
replaces=(xmlrpc-c)
options=(!emptydirs)
source=("https://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$pkgver/xmlrpc-c-$pkgver.tgz")
b2sums=('08b0756792c9b89607a601136cdbc0720ed180b0c793ee69bb9f93445f95a3dbad490a78d4fce3109f11878950f7f017f308cee0932c2e6bc40ba05d155eeab6')

build() {
  cd xmlrpc-c-$pkgver

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
  cd xmlrpc-c-$pkgver

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C tools install

  # Remove references to build directory
  setconf "$pkgdir/usr/bin/xmlrpc-c-config" BLDDIR ''
  setconf "$pkgdir/usr/bin/xmlrpc-c-config" ABS_SRCDIR ''

  # Custom license
  install -Dm644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
