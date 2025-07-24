# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=libxmlrpc
# latest release from https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/
pkgver=1.59.03
pkgrel=2
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
source=("https://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$pkgver/xmlrpc-c-$pkgver.tgz"
        "https://raw.githubusercontent.com/gentoo/gentoo/61b6130343a41b49da1ffe7376ab5d2077a37411/dev-libs/xmlrpc-c/files/xmlrpc-c-1.59.03-use-system-expat.patch")
b2sums=('7a8d2ea19fe698538747d8b5735eb3247dec0c0ef87204cdec3a2aa051581e2d23b1a7b41673ff422c69474c5a4f24243945d5474c30beafc59235bc60c2cad5'
        '083684f61e0448ee34b724edf97c349927f0f1360af94cbbbccac3ab0311ec1bc564b4160632281711180c51f75ede0469951dd3ffe3a2a6e71f993acc491944')

prepare() {
  cd xmlrpc-c-$pkgver

  patch -p1 -i ../xmlrpc-c-1.59.03-use-system-expat.patch
}

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

  make CFLAGS_PERSONAL="$CFLAGS -fPIC -std=c11 -w -D_GNU_SOURCE -D_DEFAULT_SOURCE" CXXFLAGS_PERSONAL="$CXXFLAGS -fPIC -std=c++17 -w"
  make -C tools CFLAGS_PERSONAL="$CFLAGS -fPIC -std=c11 -w -D_GNU_SOURCE -D_DEFAULT_SOURCE" CXXFLAGS_PERSONAL="$CXXFLAGS -fPIC -std=c++17 -w"
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
