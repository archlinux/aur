# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Reventlov <contact@volcanis.me>
# Your system will break if you install this. For breaking purposes only

pkgname=libressl-git
pkgver=2.5.0.570.e168f3b
pkgrel=1
pkgdesc="FREE version of the SSL/TLS protocol forked from OpenSSL - HIGHLY EXPRIMENTAL ONLY"
url="http://www.libressl.org/"
arch=('i686' 'x86_64')
license=('custom:Openssl')
depends=('glibc')
makedepends=('git')
optdepends=('ca-certificates')
backup=('etc/ssl/openssl.cnf')
provides=('libressl' 'openssl')
conflicts=('libressl' 'openssl')
source=(${pkgname}::git+https://github.com/libressl-portable/portable
        ${pkgname}-openbsd::git+https://github.com/libressl-portable/openbsd
        libressl-dummy-rand-egd.patch)
sha512sums=('SKIP'
            'SKIP'
            '73ca8a924a23f874287503453d939ecffa40f05760cd539b4773f3f28687ee1f2fa463ca3f2cad4ac5f57a49f3b6a918c015c8829112c61cb3ea7b798c0d110b')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git describe --tags --abbrev=0|sed -r 's|v?(.*)|\1|g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  ln -sf "${srcdir}/${pkgname}-openbsd" openbsd
  ./autogen.sh
  # Dummy RAND_egd() function - Can help to compile some stuff
  # https://blog.hboeck.de/archives/851-LibreSSL-on-Gentoo.html
  patch -p1 < "${srcdir}/libressl-dummy-rand-egd.patch"
  # fix manpage symlink locations
  sed -ri 's|(ln -sf )(.+) (.+)|\1\2.gz \3.gz|g' man/Makefile.in
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --with-openssldir=/etc/ssl
  make
}

check() {
  cd ${pkgname}
  make check
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/etc/ssl/cert.pem"
  ln -s /usr/lib/libssl.so "${pkgdir}/usr/lib/libssl.so.1.0.0"
  ln -s /usr/lib/libcrypto.so "${pkgdir}/usr/lib/libcrypto.so.1.0.0"
  ln -s /usr/lib/libtls.so "${pkgdir}/usr/lib/libtls.so.1.0.0"
}

# vim: ts=2 sw=2 et:
