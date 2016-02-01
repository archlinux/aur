# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Reventlov <contact@volcanis.me>
# Your system will break if you install this. For breaking purposes only

pkgname=libressl
pkgver=2.3.2
pkgrel=1
pkgdesc='FREE version of the SSL/TLS protocol forked from OpenSSL - EXPRIMENTAL ONLY'
url='http://www.libressl.org/'
arch=('i686' 'x86_64')
license=('custom:Openssl')
depends=('glibc')
optdepends=('ca-certificates')
backup=('etc/ssl/openssl.cnf')
provides=('openssl')
conflicts=('openssl')
source=(http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/${pkgname}-${pkgver}.tar.gz{,.asc}
        libressl-dummy-rand-egd.patch)
sha512sums=('619acf3e9c670cc5f32aa9e0064e8b72297bfc05c68743c5cb9f7b7332207d05fc43f44ea9652db9b651b301e8ce5dd90777a20a4a25e8145d1f7fa977d782c1'
            'SKIP'
            '73ca8a924a23f874287503453d939ecffa40f05760cd539b4773f3f28687ee1f2fa463ca3f2cad4ac5f57a49f3b6a918c015c8829112c61cb3ea7b798c0d110b')
validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>

prepare() {
  cd ${pkgname}-${pkgver}
  # Dummy RAND_egd() function - Can help to compile some stuff
  # https://blog.hboeck.de/archives/851-LibreSSL-on-Gentoo.html
  patch -p1 < ../libressl-dummy-rand-egd.patch
  # fix manpage symlink locations
  sed -ri 's|(ln -sf )(.+) (.+)|\1\2.gz \3.gz|g' man/Makefile.in
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-openssldir=/etc/ssl
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
