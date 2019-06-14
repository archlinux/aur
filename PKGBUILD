# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Kyle Fuller <inbox@kylefuller.co.uk>
# Contributor: jibi <jibi@paranoici.org>
# Co-Maintainer: TheGoliath <contact@xdfr.de>

pkgname='inspircd'
pkgver='3.1.0'
pkgrel='1'
pkgdesc='A modular C++ IRC daemon (ircd).'
arch=('any')
url='http://www.inspircd.org/'
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
sha512sums=('77e5602115d612be6bb1dc0123f5fde2e6ff0547376de04cd5c24de9376797654bbd62a01d058b6f27858bd338ae9126cdd0dcd8571ba0c33afc1f3e166e000c'
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
    --log-dir=/var/log/inspircd

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

  # Warn about major upgrade
  echo "Version 3 is a major upgrade!"
  echo "Please consult https://docs.inspircd.org/3/configuration-changes/"
  echo "for configuration changes and add them accordingly" 

}
