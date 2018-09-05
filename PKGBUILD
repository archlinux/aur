# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=curl-ssh
_pkgname=curl
pkgver=7.61.1
pkgrel=1
pkgdesc="An URL retrieval utility and library (with ssh support)"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl' 'libnghttp2')
provides=('libcurl.so' "curl=${pkgver}")
conflicts=('curl')
options=('strip' 'debug')
source=("https://curl.haxx.se/download/$_pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('6469a3ff27623826bf29a9256ba730ae0a5135c20b27377027554e19ed26be6d0225db0101b60e7f12aa22d55eccaa53f4015414ef5736ee6002c6d780ed513f'
            'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2'   # Daniel Stenberg
              '914C533DF9B2ADA2204F586D78E11C6B279D5C91')  # Daniel Stenberg (old key)

build() {
  cd "$_pkgname-$pkgver"

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
      --with-random=/dev/urandom \
      --with-libssh2 \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C scripts

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: ts=2 sw=2 et:
