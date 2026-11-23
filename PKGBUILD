# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=proftpd
pkgname="${_pkgname}"-git
pkgver=1.3.10rc6.r61.g4614e3475
pkgrel=1
pkgdesc='High-performance, scalable FTP server'
arch=('x86_64' 'i686' 'aarch64')
url='http://www.proftpd.org/'
license=('GPL-2.0-only')
depends=('perl' 'libsodium' 'mariadb-libs' 'postgresql-libs' 'hiredis')
optdepends=('logrotate: automatically rotate Xfer log file')
makedepends=('git')
backup=('etc/proftpd/proftpd.conf' 'etc/proftpd/blacklist.dat' 'etc/proftpd/dhparams.pem')
options=('!emptydirs')
source=("git+https://github.com/${_pkgname}/${_pkgname}.git"
        'proftpd.logrotate' 'proftpd.service' 'proftpd.tmpfiles'
        'proftpd.conf.patch')
sha256sums=('SKIP'
            'eaacf8df09c3d267cb08e962910af9cab50d1d5b007b232eb79b5240d8c5a721'
            '3a4558773ed747ab66b51551b6fc1732148e30908edc010f00a5e8675c817e64'
            '359cb8f5b30e66627929f7c50cbdd7dcc6919f7261f36eb617045210caf90abb'
            '6e4f5277feeb8ef2852010c6f935017a2ad83e3a3b1187963a7df3ceef77014b')

pkgver(){
    cd ${_pkgname}
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd ${_pkgname}

    ./configure \
      --with-modules=mod_facl:mod_ldap:mod_sql:mod_sql_mysql:mod_sql_postgres:mod_dynmasq:mod_sftp:mod_tls:mod_tls_shmcache:mod_quotatab:mod_quotatab_file:mod_quotatab_sql:mod_digest \
      --enable-ctrls \
      --prefix=/usr \
      --sysconfdir=/etc/proftpd \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib/proftpd \
      --localstatedir=/run/proftpd \
      --enable-openssl \
      --enable-sodium \
      --enable-auth-pam \
      --enable-nls \
      --enable-redis \
      --enable-facl \
      --with-systemd

    make
}

package() {
    cd ${_pkgname}

    make DESTDIR="${pkgdir}" install

    install -Dm755 contrib/xferstats.holger-preiss "${pkgdir}"/usr/bin/ftpstats

    install -Dm644 ../proftpd.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ../proftpd.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/proftpd.conf

    install -Dm644 ../proftpd.logrotate "${pkgdir}"/etc/logrotate.d/proftpd

    cd "${pkgdir}"
    patch -p1 < "${srcdir}"/proftpd.conf.patch
}
