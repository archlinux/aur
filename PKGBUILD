# Maintainer: Ketchup901 <ketchup901@riseup.net>
# Contributors: Arch Linux Developers https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=libxmlrpc

pkgname=lib32-libxmlrpc
# latest release from https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/
pkgver=1.64.04
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
source=("https://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$pkgver/xmlrpc-c-$pkgver.tgz")
b2sums=('50d75deba12984bca300f189e85a18b96802c280f5551ae0b6408cc145abf46d5732e1ce0a2ef0d8bcd61f8ed61179e794022ae972441c2ed7229b987d0ea685')

_srcdir="xmlrpc-c-$pkgver"

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
