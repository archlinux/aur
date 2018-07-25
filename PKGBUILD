# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=curl-ssh
_pkgname=curl
pkgver=7.61.0
pkgrel=2
pkgdesc="An URL retrieval utility and library (with ssh support)"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl' 'libnghttp2')
provides=('libcurl.so' "curl=${pkgver}")
conflicts=('curl')
options=('strip' 'debug')
source=("https://curl.haxx.se/download/$_pkgname-$pkgver.tar.bz2"{,.asc}
  '0001-header-output-switch-off-all-styles-not-just-unbold.patch')
sha512sums=('4907234c75a9e52a5b81cf895bcc811d7a69f1db84a9ae1adc3af360e8cc4371f58c00925ce6bc5170f2a8072848da47a52c41f4bfedcf14274ec75802afcddd'
            'SKIP'
            'af8df41040778853bef695f0d1cde78efbb907a5f49bd596393096791daa90fccc556a9e8701a7ab8db379fbefe27fffc590c95f33b0917406c1fe16a036281d')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2'   # Daniel Stenberg
              '914C533DF9B2ADA2204F586D78E11C6B279D5C91')  # Daniel Stenberg (old key)

prepare() {
  cd "$_pkgname-$pkgver"

  patch -Np1 < ../0001-header-output-switch-off-all-styles-not-just-unbold.patch
}

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
