# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Piotr Balcerowski <piotr@balcerowski.org>

pkgname=lib32-libcurl-compat-minimal-git
pkgver=7.74.0
pkgrel=1
pkgdesc='An URL retrieval library (without versioned symbols)'
arch=('x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('lib32-curl' 'lib32-glibc' 'lib32-libidn2' 'lib32-krb5'
         'lib32-libpsl' 'lib32-openssl' 'lib32-zlib'
         'lib32-zstd')
optdepends=('libcurl-compat: 64bit support')
provides=(lib32-libcurl-compat)
conflicts=(lib32-libcurl-compat)
options=('strip')
source=(git+https://github.com/curl/curl)
sha512sums=('SKIP')
#validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg

build() {
  cd curl

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./buildconf
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --disable-versioned-symbols \
    --disable-ipv6 \
    --enable-threaded-resolver \
    --with-gssapi \
    --without-libssh2 \
    --with-random='/dev/urandom' \
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt' \
    --disable-verbose \
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
    --disable-ares \
    --disable-proxy \
    --without-libssh \
    --without-librtmp \
    --without-libmetalink \
    --without-wolfssh \
    --without-winssl \
    --without-schannel \
    --without-darwinssl \
    --without-secure-transport \
    --without-amissl \
    --without-mesalink \
    --without-winidn \
    --with-nghttp2 \
     --with-nghttp3 \
    --with-ngtcp2 \
    --with-quiche 

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib
}

package() {
  cd curl

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib32/libcurl{,-compat}.so.4.7.0
  rm "${pkgdir}"/usr/lib32/libcurl.{a,so}*
  for version in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0; do
    ln -s libcurl-compat.so.4.7.0 "${pkgdir}"/usr/lib32/libcurl.so.${version}
  done

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libcurl-compat "${pkgdir}"/usr/share/licenses/lib32-libcurl-compat
}

# vim: ts=2 sw=2 et:
