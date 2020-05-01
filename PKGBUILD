# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Kyle Fuller <inbox@kylefuller.co.uk>
# Contributor: jibi <jibi@paranoici.org>
# Co-Maintainer: TheGoliath <contact@xdfr.de>

pkgname='inspircd'
pkgver='3.6.0'
pkgrel='1'
pkgdesc='InspIRCd is a modular Internet Relay Chat (IRC) server written in C++ for Linux, BSD, Windows and macOS systems.'
arch=('any')
url='https://www.inspircd.org/'
license=('GPL2')
conflicts=('inspircd')
provides=('inspircd')
depends=('perl')
makedepends=('pkgconf' 'libmariadbclient' 'sqlite3' 'libldap' 'geoip'
             'gnutls' 'openssl' 'libgcrypt')
optdepends=('gnutls: m_ssl_gnutls'
            'libgcrypt: m_ssl_gnutls'
            'openssl: m_ssl_openssl'
            'libmariadbclient: m_mysql'
            'pcre: m_regex_pcre'
            'sqlite3: m_sqlite3'
            'libldap: m_ldapoper and m_ldapauth'
            'geoip: m_geoip')
install='inspircd.install'
source=("https://github.com/inspircd/inspircd/archive/v$pkgver.tar.gz"
        'inspircd.service')
sha512sums=('b1feaf983f30aa3192860d931f85bb2e5b5f10d3b7582b7e5faa8fc16a349c79506f5a7ba9e1f4f8b24d62639c0e0e88f2d97a3130473ee10eda93dd5c131630'
            '5a16a7c237693ffc6a108358f339b6aa2451fb16430561848ae869f890199b38fab6a13640bcc35cf1d07e32d7e5fff405d88668ee05ddaffc2ef61cb42ee832')

build() {
  cd "${srcdir}/inspircd-${pkgver}"

  ./configure \
    --enable-extras=m_geoip.cpp \
    --enable-extras=m_ldapauth.cpp \
    --enable-extras=m_ldapoper.cpp \
    --enable-extras=m_mysql.cpp \
    --enable-extras=m_regex_pcre.cpp \
    --enable-extras=m_regex_posix.cpp \
    --enable-extras=m_sqlite3.cpp \
    --enable-extras=m_ssl_gnutls.cpp \
    --enable-extras=m_ssl_openssl.cpp

  ./configure \
    --uid=0 \
    --prefix=/usr/lib/inspircd \
    --binary-dir=/usr/bin \
    --module-dir=/usr/lib/inspircd/modules \
    --config-dir=/etc/inspircd \
    --data-dir=/var/lib/inspircd \
    --log-dir=/var/log/inspircd \
    --distribution-label=archlinux
  make
}

package() {
  install -Dm644 "${srcdir}"/inspircd.service "${pkgdir}"/usr/lib/systemd/system/inspircd.service
  install -o141 -g141 -dm750 "${pkgdir}/var/log/inspircd" "${pkgdir}/var/lib/inspircd"

  cd "${srcdir}/inspircd-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "${pkgdir}"/usr/share/inspircd
  mv "${pkgdir}"/etc/inspircd/examples "${pkgdir}"/usr/share/inspircd/examples

  rm -rf "${pkgdir}"/usr/lib/inspircd/logs
  rm -rf "${pkgdir}"/usr/lib/inspircd/data
}
