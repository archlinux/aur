# Maintainer: 6ng4n
# Forked from: Evan Anderson <evananderson@thelinuxman.us>
# Contributor: Christian Hesse <arch@eworm.de>
# Contributor: PitBall

pkgname=libcurl-compat-nostatic
_pkgname=curl
pkgver=7.48.0
pkgrel=1
pkgdesc="An URL retrieval library (old version) without static libs"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'gnutls' 'openssl' 'zlib')
options=('strip')
conflicts=('libcurl-gnutls' 'libcurl-compat')
provides=('libcurl-compat')
replaces=('libcurl-compat')
source=("http://curl.haxx.se/download/${_pkgname}-$pkgver.tar.bz2")
md5sums=('d42e0fc34a5cace5739631cc040974fe')
install=libcurl-compat.install

build() {
  config="./configure \
      --prefix=/usr \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --disable-manual \
      --disable-versioned-symbols \
      --enable-threaded-resolver \
      --without-gssapi \
      --without-libidn \
      --without-libssh2 \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
      --enable-static=no"

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
  mv $pkgdir/usr/lib/libcurl.so.4.4.0 \
    $pkgdir/usr/lib/libcurl-gnutls-compat.so.4.4.0
  cd "../${_pkgname}-$pkgver"
  make -C lib DESTDIR="$pkgdir" install
  mv $pkgdir/usr/lib/libcurl.so.4.4.0 \
    $pkgdir/usr/lib/libcurl-compat.so.4.4.0
  rm $pkgdir/usr/lib/libcurl.so{,.4}
  rm -rf $pkgdir/etc
  ln -s libcurl-compat.so.4.4.0  $pkgdir/usr/lib/libcurl.so.3
  ln -s libcurl-gnutls-compat.so.4.4.0  $pkgdir/usr/lib/libcurl-gnutls.so.3

  # license
  install -d "$pkgdir/usr/share/licenses"
  ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
