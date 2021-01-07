# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=curl-minimal-git
pkgver=7.73.0
pkgrel=1
pkgdesc="An URL retrieval utility and library"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'openssl' 'zlib'
         'libpsl' 'libpsl.so' 'libnghttp2' 'libidn2' 'zstd')
provides=('libcurl.so' curl)
conflicts=(curl)
source=("git+https://github.com/curl/curl")
sha512sums=('SKIP')

pkgver() {
  cd curl
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd curl

  ./buildconf
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --disable-manual \
      --disable-verbose \
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
      --disable-ares \
      --disable-proxy \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --without-libssh \
      --without-libssh2 \
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
      --with-random=/dev/urandom \
      --with-nghttp2 \
      --with-nghttp3 \
      --with-ngtcp2 \
      --with-quiche \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd curl

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C scripts

  # license
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
