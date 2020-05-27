# Maintainer: Jesús E. <heckyel@hyperbola.info>

pkgname=libressl-latest
pkgver=3.1.2
pkgrel=1
pkgdesc='A version of the TLS/crypto stack forked from OpenSSL, with goals of modernizing the codebase, improving security, and applying best practice development processes'
url='https://www.libressl.org/'
arch=('i686' 'x86_64')
license=('OpenSSL')
depends=('glibc')
optdepends=('ca-certificates')
backup=('etc/ssl/openssl.cnf')
provides=('openssl' 'openssl-1.0')
conflicts=('openssl' 'openssl-1.0')
replaces=('openssl' 'openssl-1.0')
source=(https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/${pkgname%-latest}-${pkgver}.tar.gz{,.asc}
        libressl-dummy-rand-egd.patch)
sha512sums=('b024c5661777daa73feff7085ce7be76a2e766d2f3cb5ca35c208c471e5651a365252758ca36782e20cdfb2bc8171919a08ad592420878a5c95fbe646f5288c8'
            'SKIP'
            '6dbf61a66d41383027c91133a5cd473054bba6b1f41e6290663bf7a2c662b7fc2422eb45d1d60687938a6810d2c836b5cb5d181574acbba46ef887a2724b39f2')
validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>

prepare() {
  cd ${pkgname%-latest}-${pkgver}
  # Dummy RAND_egd() function - Can help to compile some stuff
  # https://blog.hboeck.de/archives/851-LibreSSL-on-Gentoo.html
  patch -p1 < "${srcdir}/libressl-dummy-rand-egd.patch"
  # fix manpage symlink locations
  sed -ri 's|(ln -sf )(.+) (.+)|\1\2.gz \3.gz|g' man/Makefile.in
}

build() {
  cd ${pkgname%-latest}-${pkgver}
  ./configure --prefix=/usr --with-openssldir=/etc/ssl
  make
}

check() {
  cd ${pkgname%-latest}-${pkgver}
  make check
}

package() {
  cd ${pkgname%-latest}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  rm "${pkgdir}/etc/ssl/cert.pem"
  ln -sf libssl.so "${pkgdir}/usr/lib/libssl.so.1.0.0"
  ln -sf libssl.so "${pkgdir}/usr/lib/libssl.so.1.1"
  ln -sf libssl.so "${pkgdir}/usr/lib/libssl.so.46"
  ln -sf libcrypto.so "${pkgdir}/usr/lib/libcrypto.so.1.0.0"
  ln -sf libcrypto.so "${pkgdir}/usr/lib/libcrypto.so.1.1"
  ln -sf libcrypto.so "${pkgdir}/usr/lib/libcrypto.so.44"
}

# vim: ts=2 sw=2 et:
