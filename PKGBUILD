# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=gnurl
pkgver=7.72.0
pkgrel=1
pkgdesc="fork of libcurl, which is mostly for GNUnet"
arch=(x86_64)
url="https://gnunet.org/en/gnurl.html"
license=('MIT')
depends=('gnutls' 'krb5' 'libnghttp2' 'zstd')
source=("https://ftp.gnu.org/gnu/gnunet/gnurl-$pkgver.tar.Z"{,.sig})
validpgpkeys=('A88C8ADD129828D7EAC02E52E22F9BBFEE348588'  # Nils Gillmann
              '6115012DEA3026F62A98A556D6B570842F7E7F8D') # nikita@3dfx.re
sha512sums=('b68474750b6020ee4d82ec477c4c37b597eb74a688691e075d89422a72eca9a74600023bf4015c8e6a25e1a034df306010b137cce49a87c3faa08a117c5e37a5'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./buildconf
  ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --disable-dict \
        --disable-file \
        --disable-ftp \
        --disable-gopher \
        --disable-imap \
        --disable-ldap \
        --disable-ldaps \
        --disable-ntlm-wb \
        --disable-pop3 \
        --disable-rtsp \
        --disable-smb \
        --disable-smtp \
        --disable-telnet \
        --disable-tftp \
        --enable-ipv6 \
        --enable-manual \
        --enable-versioned-symbols \
        --enable-threaded-resolver \
        --without-gssapi \
        --with-gnutls \
        --without-libidn \
        --without-libpsl \
        --without-librtmp \
        --without-ssl \
        --disable-ftp \
        --disable-file \
        --with-random=/dev/urandom \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

#  rm -rf "$pkgdir"/usr/share/man \
#    "$pkgdir"/usr/bin/curl \
#    "$pkgdir"/usr/share/aclocal
#  mkdir -p "$pkgdir"/usr/include/gnurl
#  mv "$pkgdir"/usr/include/curl "$pkgdir"/usr/include/gnurl/curl
#  sed -i 's|includedir=.*|includedir=/usr/include/gnurl|g' "$pkgdir"/usr/lib/pkgconfig/libgnurl.pc
}
