# $Id$
# Maintainer: Florian Maunier <fmaunier@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Piotr Balcerowski <piotr@balcerowski.org>

pkgname=libcurl-openssl-1.0
pkgver=7.61.1
pkgrel=1
pkgdesc="An URL retrieval library (without versioned symbols, built against openssl-1.0)"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'curl' 'krb5' 'libssh2' 'openssl-1.0' 'zlib' 'libpsl')
provides=('libcurl-openssl-1.0.so')
options=('strip')
source=("https://curl.haxx.se/download/curl-${pkgver}.tar.gz")
sha512sums=('6469a3ff27623826bf29a9256ba730ae0a5135c20b27377027554e19ed26be6d0225db0101b60e7f12aa22d55eccaa53f4015414ef5736ee6002c6d780ed513f')

build() {
  cd curl-${pkgver}

  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

  ./configure \
    --prefix=/usr \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --disable-versioned-symbols \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --with-gssapi \
    --with-random=/dev/urandom \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib
}

package() {
  cd curl-${pkgver}

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-openssl-1.0}.so.4.5.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  ln -s libcurl-openssl-1.0.so.4.5.0 "${pkgdir}"/usr/lib/libcurl-openssl-1.0.so

  install -d "${pkgdir}"/usr/lib/libcurl-openssl-1.0
  for _i in so so.4 so.4.5.0; do
    ln -s ../libcurl-openssl-1.0.so.4.5.0 "${pkgdir}"/usr/lib/libcurl-openssl-1.0/libcurl.${_i}
  done

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/${pkgname}
}
