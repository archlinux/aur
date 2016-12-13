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
pkgver=7.51.0
pkgrel=2
pkgdesc="An URL retrieval utility and library. With http2 support."
arch=('i686' 'x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl' 'nghttp2')
provides=("curl=$pkgver" 'libcurl.so')
conflicts=('curl' 'curl-git' 'curl-http2-git')
options=('strip')
source=("https://curl.haxx.se/download/$_pkgname-$pkgver.tar.gz"{,.asc}
        curlbuild.h)
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

sha512sums=('6bec021caa1befd16dd2a5221a22764b70c1bd5cf5d553eaa2cb980ef340129a0deb2f900dd9ef5c07f734f73abf0d6447eedb1f8803e16fe469d6271161fa67'
            'SKIP'
            '4e71366c3faaab76a6e438fcc484fb1ce16b2ae84eefa176879cf164e8fb0b04e4a355384e66a1137e9641e95041ee573553b43da98ec92820696d7256beb4f5')
