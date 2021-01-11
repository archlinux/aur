# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lizao (Larry) Li <lzlarryli@gmail.com>

pkgname=libcurl-gnutls-minimal-git
pkgver=7.73.0
pkgrel=1
pkgdesc='An URL retrieval library (linked against gnutls)'
arch=('x86_64')
url='https://curl.haxx.se'
license=('MIT')
provides=(libcurl-gnutls)
conflicts=(libcurl-gnutls)
depends=('curl' 'glibc' 'gnutls' 'libidn2' 'libnghttp2'
         'libpsl' 'nettle'
         'zlib' 'zstd')
options=('strip')
source=("git+https://github.com/curl/curl")
sha512sums=('SKIP')
validpgpkeys=('SKIP') # Daniel Stenberg

pkgver() {
  cd curl
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd curl

  ./buildconf
  ./configure \
    --prefix='/usr' \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --disable-versioned-symbols \
    --disable-ipv6 \
    --disable-rtsp \
    --disable-ftp \
    --disable-file \
    --disable-dict \
    --disable-telnet \
    --disable-tftp \
    --disable-pop3 \
    --disable-imap \
    --disable-smb \
    --disable-smtp \
    --disable-gopher \
    --disable-mqtt \
    --enable-threaded-resolver \
    --without-gssapi \
    --without-libssh \
    --without-libssh2 \
    --without-libidn \
    --without-ssl \
    --without-librtmp \
    --without-libmetalink \
    --without-wolfssh \
    --with-gnutls='/usr' \
    --with-random='/dev/urandom' \
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'

  make -C lib
}

package() {
  cd curl

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-gnutls}.so.4.7.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  for version in 3 4 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0; do
    ln -s libcurl-gnutls.so.4.7.0 "${pkgdir}"/usr/lib/libcurl-gnutls.so.${version}
  done

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-gnutls
}

# vim: ts=2 sw=2 et:
