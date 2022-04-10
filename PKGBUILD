# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=proftpd
pkgname=${_pkgname}-git
pkgver=1.3.8rc2.135.ga34cb3043
pkgrel=1
pkgdesc='High-performance, scalable FTP server'
arch=('x86_64' 'i686')
url='http://www.proftpd.org/'
license=('GPL')
depends=('mariadb-libs' 'postgresql-libs' 'libcap' 'pam' 'hiredis')
makedepends=('git')
backup=('etc/proftpd.conf')
options=('!emptydirs')
source=("git+https://github.com/${_pkgname}/${_pkgname}.git"
        'proftpd.logrotate' 'proftpd.service'
        'proftpd.tmpfiles')
sha256sums=('SKIP'
            'eaacf8df09c3d267cb08e962910af9cab50d1d5b007b232eb79b5240d8c5a721'
            '3a4558773ed747ab66b51551b6fc1732148e30908edc010f00a5e8675c817e64'
            '359cb8f5b30e66627929f7c50cbdd7dcc6919f7261f36eb617045210caf90abb')

pkgver(){
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-pam \
    --with-modules=mod_digest:mod_sftp:mod_quotatab:mod_quotatab_sql:mod_quotatab_file:mod_tls:mod_tls_shmcache:mod_ldap:mod_sql:mod_sql_mysql:mod_sql_postgres:mod_facl:mod_dynmasq \
    --sysconfdir=/etc \
    --localstatedir=/run/proftpd \
    --enable-ctrls \
    --enable-ipv6 \
    --with-includes=/usr/include/mysql:/usr/include/postgresql \
    --with-libraries=/usr/lib/mysql:/usr/lib/postgresql \
    --enable-nls \
    --enable-redis \
    --enable-facl \
    --with-systemd

  make
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" install
  sed -i 's|nogroup|nobody|g' "${pkgdir}/etc/proftpd.conf"

  install -Dm644 ../proftpd.logrotate "${pkgdir}/etc/logrotate.d/proftpd"
  install -Dm755 contrib/xferstats.holger-preiss "${pkgdir}/usr/bin/ftpstats"

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -m644 "${srcdir}"/proftpd.service "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}"/proftpd.tmpfiles \
    "${pkgdir}"/usr/lib/tmpfiles.d/proftpd.conf

  # /run is tmpfs
  rmdir "${pkgdir}"/run/{proftpd,}
}
