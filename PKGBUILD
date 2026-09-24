# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=libxmlrpc
# latest release from https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/
pkgver=1.64.04
pkgrel=1
epoch=1
pkgdesc='XML-RPC for C and C++'
arch=(x86_64)
url='https://xmlrpc-c.sourceforge.net/'
license=(custom)
depends=(curl perl libxml2)
makedepends=(libtool setconf)
conflicts=(xmlrpc-c)
provides=(xmlrpc-c)
replaces=(xmlrpc-c)
options=(!emptydirs)
source=("xmlrpc-c-$pkgver.tgz::https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/$pkgver/xmlrpc-c-$pkgver.tgz/download")
b2sums=('50d75deba12984bca300f189e85a18b96802c280f5551ae0b6408cc145abf46d5732e1ce0a2ef0d8bcd61f8ed61179e794022ae972441c2ed7229b987d0ea685')

_srcdir="xmlrpc-c-$pkgver"

build() {
  cd "$_srcdir"

  export CFLAGS_PERSONAL="$CFLAGS -fPIC -std=c11 -w -D_GNU_SOURCE -D_DEFAULT_SOURCE"
  export CXXFLAGS_PERSONAL="$CXXFLAGS -fPIC -std=c++17 -w"

  ./configure \
    --disable-cgi-server \
    --disable-libwww-client \
    --disable-wininet-client \
    --enable-cplusplus \
    --enable-libxml2-backend \
    --mandir=/usr/share/man \
    --prefix=/usr

  mkdir -p include/curl
  touch include/curl/types.h

  # Random issues happens when running in parallel.
  make -j1
  make -j1 -C tools
}

package() {
  cd "$_srcdir"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C tools install

  # Remove references to build directory
  setconf "$pkgdir/usr/bin/xmlrpc-c-config" BLDDIR ''
  setconf "$pkgdir/usr/bin/xmlrpc-c-config" ABS_SRCDIR ''

  # Custom license
  install -Dm644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
