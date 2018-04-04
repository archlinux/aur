# Maintainer: drakkan <nicola.murino at gmail dot com>

pkgname=curl-ssh
_pkgname=curl
pkgver=7.59.0
pkgrel=2
pkgdesc="An URL retrieval utility and library (with ssh support)"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl' 'libnghttp2')
provides=('libcurl.so')
conflicts=('curl')
options=('strip' 'debug')
source=("https://curl.haxx.se/download/$_pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('b61bced0ed8673a0358e0aaae545a7aba08eee460deee3140a45179a5846425066271566295d2cd0d8f05d84c1e3dc5e58d1f20863f7055f0f9853020cc7c76f'
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
