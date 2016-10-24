# $Id: PKGBUILD 276535 2016-09-16 12:08:43Z dreisner $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# https://bugs.archlinux.org/task/37894
# $ gpg --lsign 5CC908FDB71E12C2

pkgname=curl-http2
_pkgname=curl
pkgver=7.50.3
pkgrel=1
pkgdesc="An URL retrieval utility and library. With http2 support."
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libidn' 'libssh2' 'openssl' 'zlib' 'nghttp2')
provides=("curl=$pkgver" 'libcurl.so')
conflicts=('curl' 'curl-git' 'curl-http2-git')
#replace=('curl')
options=('strip')
source=("http://curl.haxx.se/download/$_pkgname-$pkgver.tar.gz"{,.asc}
        curlbuild.h)
md5sums=('870e16fd88a88b52e26a4f04dfc161db'
         'SKIP'
         '751bd433ede935c8fae727377625a8ae')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2'   # Daniel Stenberg
              '914C533DF9B2ADA2204F586D78E11C6B279D5C91')  # Daniel Stenberg (old key)

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --enable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-libidn \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
      --with-nghttp2=/usr

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  local wordsize=$(cpp -include 'bits/wordsize.h' <<<'__WORDSIZE' | sed '$!d')
  local _curlbuild=curlbuild-$wordsize.h

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  # devel
  mv "$pkgdir/usr/include/curl/curlbuild.h" "$pkgdir/usr/include/curl/$_curlbuild"
  install -m644 "$srcdir/curlbuild.h" "$pkgdir/usr/include/curl/curlbuild.h"
}
