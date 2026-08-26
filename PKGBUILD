# Maintainer: Frederic Van Assche <frederic@fredericva.com>
# Adapted from package by: Maxime Gauduin <alucryd@archlinux.org>
# Patch by: Alessandro Ghedini <ghedo@debian.org>

pkgname=libcurl3-gnutls
pkgver=8.21.0
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
sha512sums=('1a1c88d7e52200d0a8879f61868accd7eb7edacb730e09db8e1f741535e9906005c897c2ce39b562c20e1b3ef2c84512f5b4fda9aa50c67e2364c473d15a1f65'
            'SKIP'
            'f6c02cdfe593c07be00e783ff9dc972748079f80faee4de96a1b7ebad79e984e1c86584c8235f5553c5d53d6487552c6857b430125c8505924a2d18683b091f2')

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
