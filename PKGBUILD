# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=curl-git
pkgver=7.37.1.17.g6f8046f
pkgrel=1
pkgdesc="A URL retrieval utility and library"
arch=('i686' 'x86_64')
url="http://curl.haxx.se/"
license=('MIT')
depends=('zlib' 'libssh2' 'openssl' 'ca-certificates')
makedepends=('git')
provides=('curl=999')
conflicts=('curl')
options=('!libtool')
source=('git://github.com/bagder/curl.git'
        'curlbuild.h')
md5sums=('SKIP'
         '751bd433ede935c8fae727377625a8ae')

pkgver() {
  # curl-7_30_0-101-gf4e6e20
  cd curl

  git describe | sed 's/curl-//; s/[_-]/./g'
}

build() {
  cd curl

  ./buildconf
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --enable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --without-libidn \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd curl

  make DESTDIR="$pkgdir" install

  local ptrsize=$(cpp <<<'__SIZEOF_POINTER__' | sed '/^#/d')
  case $ptrsize in
    8) _curlbuild=curlbuild-64.h ;;
    4) _curlbuild=curlbuild-32.h ;;
    *) error "unknown pointer size for architecture: %s bytes" "$ptrsize"
      exit 1
      ;;
  esac

  install -Dm644 docs/libcurl/libcurl.m4 $pkgdir/usr/share/aclocal/libcurl.m4
  mv "$pkgdir/usr/include/curl/curlbuild.h" "$pkgdir/usr/include/curl/$_curlbuild"
  install -m 644 $srcdir/curlbuild.h "$pkgdir/usr/include/curl/curlbuild.h"

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
