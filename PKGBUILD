# Maintainer: 6ng4n
# Forked from PitBall's PKGBUILD

pkgname=lib32-libcurl-compat-nostatic
_pkgname=curl
pkgver=7.48.0
pkgrel=1
pkgdesc="An URL retrieval library (32bit version) without static libs and conflicts"
arch=('x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'lib32-gnutls' 'lib32-openssl' 'lib32-zlib')
conflicts=('lib32-libcurl-compat')
replaces=('lib32-libcurl-compat')
provides=('lib32-libcurl-compat')
makedepends=('gcc-multilib')
options=('strip')
source=("http://curl.haxx.se/download/${_pkgname}-$pkgver.tar.bz2")
md5sums=('d42e0fc34a5cace5739631cc040974fe')
install=curl-compat.install

build() {
  config=" ./configure \
      --libdir=/usr/lib32
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgname}-$pkgver-gnutls"
  $config --without-ssl --with-gnutls
  make

  cd "../${_pkgname}-$pkgver"
  $config
  make
}

package() {
  cd "${_pkgname}-$pkgver-gnutls"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/lib32/libcurl.so.4.4.0 \
     $pkgdir/usr/lib32/libcurl-gnutls-compat.so.4.4.0
  cd "../${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/lib32/libcurl.so.4.4.0 \
     $pkgdir/usr/lib32/libcurl-compat.so.4.4.0
  rm -rf "${pkgdir}"/usr/{share,bin,include}
  ln -s libcurl-compat.so.4.4.0  "$pkgdir"/usr/lib32/libcurl.so.3
  ln -s libcurl-gnutls-compat.so.4.4.0  "$pkgdir"/usr/lib32/libcurl-gnutls.so.3
  rm $pkgdir/usr/lib32/libcurl.so{,.4}
  rm $pkgdir/usr/lib32/libcurl.la
  rm -r $pkgdir/usr/lib32/pkgconfig

  # license
  install -d "$pkgdir"/usr/share/licenses
  ln -s "$_pkgname" "$pkgdir"/usr/share/licenses/"$pkgname"
}
