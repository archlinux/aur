# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Piotr Balcerowski <piotr@balcerowski.org>
# Contributor: Florian Maunier <fmaunier@gmail.com>

pkgname=libcurl-openssl-1.0
pkgver=7.57.0
pkgrel=1
pkgdesc='An URL retrieval library (build against openssl-1.0)'
arch=('i686' 'x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('curl' 'glibc' 'krb5' 'openssl-1.0' 'libpsl' 'zlib' 'libssh2.so')
options=('strip')
source=("https://curl.haxx.se/download/curl-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2'   # Daniel Stenberg
              '914C533DF9B2ADA2204F586D78E11C6B279D5C91')  # Daniel Stenberg (old key)
sha512sums=('1ce8138c708965d29628f9b3e37cb9cb5c586f82f42091d5e60ba66ddcebcd55dba874c5d903365af0ef94c5c1679430bdd8c0cefbffdf5f7f347d9055824648'
            'SKIP')

build() {
  cd curl-${pkgver}

  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

  ./configure \
    --prefix='/usr' \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --with-gssapi \
    --with-random='/dev/urandom' \
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'

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
