# Maintainer: PitBall

pkgname=lib32-libcurl-compat
_pkgname=curl
pkgver=7.23.1
pkgrel=2
pkgdesc="An URL retrieval library (old 32bit version)"
arch=('x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'lib32-gnutls' 'lib32-openssl' 'lib32-zlib')
makedepends=('gcc-multilib')
#provides=('libcurl.so.3' 'libcurl-gnutls.so.3' 'libcurl-gnutls.so.4.2.0' 'libcurl-gnutls.so.4.2.0')
options=('strip')
source=("http://curl.haxx.se/download/${_pkgname}-$pkgver.tar.gz")
md5sums=('8e23151f569fb54afef093ac0695077d')
install=curl-compat.install

build() {
  config=" ./configure \
      --libdir=/usr/lib32
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

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
  mv $pkgdir/usr/lib32/libcurl{,-gnutls}.so.4.2.0
  cd "../${_pkgname}-$pkgver"
  make -C lib DESTDIR="$pkgdir" install
  rm $pkgdir/usr/lib32/libcurl.so{,.4}
  rm -rf $pkgdir/etc
  ln -s libcurl.so.4.2.0  $pkgdir/usr/lib32/libcurl.so.3
  ln -s libcurl-gnutls.so.4.2.0  $pkgdir/usr/lib32/libcurl-gnutls.so.3

  # license
  install -d "$pkgdir/usr/share/licenses"
  ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
