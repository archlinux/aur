# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=curl-ssh
_pkgname=curl
pkgver=7.60.0
pkgrel=1
pkgdesc="An URL retrieval utility and library (with ssh support)"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl' 'libnghttp2')
provides=('libcurl.so' 'curl=7.60.0')
conflicts=('curl')
options=('strip' 'debug')
source=("https://curl.haxx.se/download/$_pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('f25c8d79be87bfbcae93cd200b319f664efd62aea8f1a94bb441407a9e1489bd935943cfd1347f3b252f94b9a0286da8aeb04b407a2ba95ebfa717dff80e891b'
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
