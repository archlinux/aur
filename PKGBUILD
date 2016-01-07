# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Reventlov <contact@volcanis.me>
# Your system will break if you install this. For breaking purposes only

pkgname=libressl
pkgver=2.3.1
pkgrel=2
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
sha512sums=('ac70d2f09035d63765bb980422c6c6b55ef07f6af4a93fce54748ff3621cf08ef87acfd438797d562dc21ab9b4862992876792deef9310aafdb927e20e27d453'
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
