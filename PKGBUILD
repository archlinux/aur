# Maintainer: Frederic Van Assche <frederic@fredericva.com>
# Adapted from package by: Maxime Gauduin <alucryd@archlinux.org>
# Patch by: Alessandro Ghedini <ghedo@debian.org>

pkgname=libcurl3-gnutls
pkgver=8.4.0
pkgrel=0
pkgdesc='An URL retrieval library (linked against gnutls) with libcurl3 versioned symbols'
arch=('x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('curl' 'glibc' 'gnutls' 'libpsl' 'nettle' 'zlib'
         'libssh2.so')
options=('strip')
conflicts=('libcurl-gnutls')
provides=('libcurl-gnutls')
source=("https://curl.haxx.se/download/curl-${pkgver}.tar.gz"{,.asc}
        03_keep_symbols_compat.patch)
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
sha512sums=('375d241effccde852cfba32aa61be406f6c6e8ef2773b48d57bfa1ff99fdf414dc08bdb6b3a65930e53b28e31246a4bc396c81054ae9c560a3bf58cca0ae78b0'
            'SKIP'
            '596c227bb5ede8182831c5c92b3ac7b74b770f51fae99277e2aabb02d38b7a5d4d06003731042ab5403ca89e719827d7080c3a179e29ef08b41a1993a7788a33')

prepare() {
  cd curl-${pkgver}

  patch -p1 < ${srcdir}/03_keep_symbols_compat.patch
}

build() {
  cd curl-${pkgver}

  ./configure \
    --prefix='/usr' \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --enable-versioned-symbols \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --without-gssapi \
    --with-libssh2 \
    --without-libidn \
    --with-gnutls='/usr' \
    --with-random='/dev/urandom' \
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'

  make -C lib
}

package() {
  cd curl-${pkgver}

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-gnutls}.so.4.8.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  for version in 3 4 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-gnutls.so.4.8.0 "${pkgdir}"/usr/lib/libcurl-gnutls.so.${version}
  done

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-gnutls
}

# vim: ts=2 sw=2 et:
