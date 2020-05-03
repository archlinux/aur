# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Christoph Krapp <headlock@its-crap.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=curl-http2-git
_pkgname=curl
pkgver=curl.7_70_0.r28.gf7ab48857
pkgrel=1
pkgdesc="A URL retrieval utility and library (HTTP/2 enabled)"
arch=('i686' 'x86_64')
url="https://curl.haxx.se/"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl' 'libnghttp2'
         'libidn2' 'libidn2.so' 'nghttp2')
makedepends=('git')
provides=('libcurl.so')
conflicts=('curl' 'curl-git')
options=('!libtool')
source=('git+https://github.com/curl/curl.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}

  ./buildconf
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --disable-manual \
      --enable-ipv6 \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-libssh2 \
      --with-random=/dev/urandom \
      --with-nghttp2=/usr \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C scripts

  install -Dm644 docs/libcurl/libcurl.m4 $pkgdir/usr/share/aclocal/libcurl.m4
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
