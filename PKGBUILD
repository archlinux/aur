# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Kyle Fuller <inbox@kylefuller.co.uk>
# Contributor: jibi <jibi@paranoici.org>

pkgname='inspircd'
pkgver='2.0.23'
pkgrel='1'
pkgdesc='A stable, modern and lightweight IRC daemon'
arch=('any')
url='http://www.inspircd.org/'
license=('GPL2')
conflicts=('inspircd')
provides=('inspircd')
depends=('perl')
makedepends=('pkg-config' 'libmariadbclient' 'sqlite3' 'libldap' 'geoip'
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
sha512sums=('93a3dab04e797cfde158de8c2e959d1bb5df115aa3fe5a4066cdf9f56cb0c548fd2664a12d61bf2dbdb45549577974be99a0d6ffc6114c72cf0697f5ca4f85bb'
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
    --enable-extras=m_sqlite3.cpp

  ./configure \
    --uid=0 \
    --prefix=/usr/lib/inspircd \
    --binary-dir=/usr/bin \
    --module-dir=/usr/lib/inspircd/modules \
    --config-dir=/etc/inspircd \
    --data-dir=/var/lib/inspircd \
    --log-dir=/var/log/inspircd \
    --enable-gnutls \
    --enable-openssl \
    --enable-epoll

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
