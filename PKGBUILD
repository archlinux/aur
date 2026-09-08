# Maintainer: Ketchup901 <ketchup901@riseup.net>
# Contributors: Arch Linux Developers https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=libxmlrpc

pkgname=lib32-libxmlrpc
# latest release from https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/
pkgver=1.64.03
pkgrel=1
pkgdesc='XML-RPC for C and C++ (32-bit)'
arch=(x86_64)
url='https://xmlrpc-c.sourceforge.net/'
license=(custom)
depends=(
    libxmlrpc
    lib32-curl
    perl
    lib32-libxml2
    lib32-glibc
    lib32-openssl
    lib32-gcc-libs
)
makedepends=(libtool setconf)
conflicts=(lib32-xmlrpc-c)
provides=(lib32-xmlrpc-c)
replaces=(lib32-xmlrpc-c)
options=(!emptydirs)
source=("https://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$pkgver/xmlrpc-$pkgver.tgz")
b2sums=('6da8a4872b8e6a6a9131e20be0c0953f0fad852152866e3e13ce713f1079b9d8d81105d0942b3892902414f972719a4b29dfaba958d1476cfc0eade7abdf7935')

_srcdir="xmlrpc-$pkgver"

build() {
  cd "$_srcdir"

  export CFLAGS+=" -m32 -fPIC -std=c11 -w -D_GNU_SOURCE -D_DEFAULT_SOURCE"
  export CXXFLAGS+=" -m32 -fPIC -std=c++17 -w"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --build=i686-pc-linux-gnu \
    --program-suffix="-32" \
    --libdir=/usr/lib32 \
    --disable-static \
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
}

package() {
  cd "$_srcdir"

  make DESTDIR="$pkgdir" install

  # Remove files conflicting with libxmlrpc
  rm -rf -- "${pkgdir:?}/usr/bin"
  rm -rf -- "${pkgdir:?}/usr/include"
  rm -rf -- "${pkgdir:?}/usr/share"

  # Custom license
  install -Dm644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
