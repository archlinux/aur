# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=libcurl-compat-fix
_pkgname=curl
pkgver=7.23.1
pkgrel=3
pkgdesc="An URL retrieval library (old version)"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'gnutls' 'openssl' 'zlib')
options=('strip')
source=("http://curl.haxx.se/download/${_pkgname}-$pkgver.tar.gz")
md5sums=('8e23151f569fb54afef093ac0695077d')
install=libcurl-compat.install

build() {
  config="./configure \
      --prefix=/usr \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --disable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --without-gssapi \
      --without-libidn \
      --without-libssh2 \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt"

  cp -a ${_pkgname}-$pkgver{,-gnutls}

  cd "${_pkgname}-$pkgver-gnutls"
  $config --without-ssl --with-gnutls
  make -C lib

  cd "../${_pkgname}-$pkgver"
  $config
  make -C lib
}

package() {
  cd "${_pkgname}-$pkgver-gnutls"
  make -C lib DESTDIR="$pkgdir" install
  mv $pkgdir/usr/lib/libcurl{,-gnutls}.so.4.2.0
  cd "../${_pkgname}-$pkgver"
  make -C lib DESTDIR="$pkgdir" install
  rm $pkgdir/usr/lib/libcurl.so{,.4}
  rm -rf $pkgdir/etc
  ln -s libcurl.so.4.2.0  $pkgdir/usr/lib/libcurl.so.3
  ln -s libcurl-gnutls.so.4.2.0  $pkgdir/usr/lib/libcurl-gnutls.so.3

  # license
  install -d "$pkgdir/usr/share/licenses"
  ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
