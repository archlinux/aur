# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=libxmlrpc
# using the latest available release tarball (the "super stable" one) from
# https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/
pkgver=1.54.06
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
b2sums=('1286323b59aa4d77fe2f8b04fef18d9a448d29a7fa23aad143418e62c92ac6a5156bb61ee58e0df4b0667e73a9170663b02b42fac94b38df71fc789d13e929e0')

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
