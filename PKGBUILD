# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=libcurl-openssl-1.0-fixed
_pkgname=libcurl-openssl-1.0
pkgver=7.54.0
pkgrel=2
pkgdesc='An URL retrieval library (build against openssl-1.0)'
arch=('i686' 'x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('curl' 'glibc' 'krb5' 'openssl-1.0' 'libpsl' 'zlib' 'libssh2.so')
options=('strip')
conflicts=('libcurl-openssl-1.0')
source=("https://curl.haxx.se/download/curl-${pkgver}.tar.gz")
sha256sums=('a84b635941c74e26cce69dd817489bec687eb1f230e7d1897fc5b5f108b59adf')

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
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt' --libdir=/usr/lib/openssl-1.0

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib
}

package() {
  cd curl-${pkgver}

  make -C lib DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/usr/lib/openssl-1.0/libcurl.{a,la}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/${_pkgname}
}
