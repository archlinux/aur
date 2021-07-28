# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Christian Pfeiffer
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Kyle Fuller <inbox@kylefuller.co.uk>
# Contributor: jibi <jibi@paranoici.org>

pkgname='inspircd'
pkgver='3.10.0'
pkgrel='1'
pkgdesc='InspIRCd is a modular Internet Relay Chat (IRC) server written in C++ for Linux, BSD, Windows and macOS systems.'
arch=('x86_64')
url='https://www.inspircd.org/'
license=('GPL2')
conflicts=('inspircd')
provides=('inspircd')
depends=('perl')
makedepends=('libmariadbclient' 'sqlite3' 'libldap' 'geoip' 'libmaxminddb'
    'gnutls' 'openssl' 'libgcrypt' 'postgresql-client'
    're2' 'tre' 'mbedtls')
optdepends=('gnutls: m_ssl_gnutls'
    'libgcrypt: m_ssl_gnutls'
    'openssl: m_ssl_openssl'
    'libmariadbclient: m_mysql'
    'postgresql-client: m_pgsql'
    'libmaxminddb: m_geo_maxmind'
    'pcre: m_regex_pcre'
    'sqlite3: m_sqlite3'
    'libldap: m_ldap'
    'geoip: m_geoip'
    're2: m_regex_re2'
    'tre: m_regex_tre'
    'mbedtls: m_ssl_mbedtls')
install='inspircd.install'
source=("https://github.com/inspircd/inspircd/archive/v$pkgver.tar.gz"
    "$pkgname.service"
    "$pkgname.sysusers"
    )
sha512sums=('6cb1c66ce2a4531628264fc4b4836b47b7cba2c8aa6ffef5d72489ae663815254783b09aeb149d8ae9e41cf51be3c703612d443da84995695449a94db86f8944'
            '5a16a7c237693ffc6a108358f339b6aa2451fb16430561848ae869f890199b38fab6a13640bcc35cf1d07e32d7e5fff405d88668ee05ddaffc2ef61cb42ee832'
            '90e7ae20a0d13cef2ff00c56382ea5cf1ed8843228937c49cab7fe0e2a34d02b9fac20dd55c6cd5e79533b5764a9d10d19e26b043a2d9c98a4384a7e1c2859c4')

build() {
    cd "${srcdir}/inspircd-${pkgver}"

    ./configure \
    --enable-extras=m_geo_maxmind.cpp \
    --enable-extras=m_ldap.cpp \
    --enable-extras=m_mysql.cpp \
    --enable-extras=m_pgsql.cpp \
    --enable-extras=m_regex_pcre.cpp \
    --enable-extras=m_regex_posix.cpp \
    --enable-extras=m_regex_stdlib.cpp \
    --enable-extras=m_regex_re2.cpp \
    --enable-extras=m_regex_tre.cpp \
    --enable-extras=m_sqlite3.cpp \
    --enable-extras=m_ssl_gnutls.cpp \
    --enable-extras=m_ssl_openssl.cpp \
    --enable-extras=m_ssl_mbedtls.cpp \
    --enable-extras=m_sslrehashsignal.cpp

    ./configure \
    --uid=0 \
    --gid=0 \
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
    install -Dm644 "${srcdir}/$pkgname.service" "${pkgdir}"/usr/lib/systemd/system/inspircd.service
    install -Dm644 "${srcdir}/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -dm750 "${pkgdir}/var/log/inspircd" "${pkgdir}/var/lib/inspircd"

    cd "${srcdir}/inspircd-${pkgver}"
    make DESTDIR="$pkgdir" install

    mkdir -p "${pkgdir}"/usr/share/inspircd
    mv "${pkgdir}"/etc/inspircd/examples "${pkgdir}"/usr/share/inspircd/examples

    rm -rf "${pkgdir}"/usr/lib/inspircd/logs
    rm -rf "${pkgdir}"/usr/lib/inspircd/data
}
