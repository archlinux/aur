# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: DJ Lucas <dj_AT_linuxfromscratch_DOT_ort>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor:  Andre Wayand <aur-sogo@awayand.sleepmail.com>
pkgname=sogo
pkgdesc="groupware server built around OpenGroupware.org (OGo) and the SOPE application server"
pkgver=5.8.2
pkgrel=1
arch=('x86_64')
url="http://www.sogo.nu/"
license=('GPL')
options=('!strip')
replaces=('sogo2')
install=sogo.install
makedepends=('gcc-objc'
             'gnustep-make')
depends=("sope>=${pkgver}"
         'gnustep-base'
         'libmemcached'
         'memcached'
         'libwbxml>=0.11.7-2'
         'mariadb-libs'
         'postgresql-libs'
         'inetutils'
         'libsodium'
         'libytnef'
         'libzip'
         'oath-toolkit')
optdepends=('postgresql: run database server for sogo locally'
            'mariadb: run database server for sogo locally'
            'openldap: run directory server for sogo locally'
            'postfix: run smtp server for sogo locally'
            'dovecot: run imap server for sogo locally'
            'courier-imap: run imap server for sogo locally'
            'nginx: webserver to provide web interface locally'
            'apache: webserver to provide web interface locally'
            'lighttpd: webserver to provide web interface locally')
backup=('etc/sogo/sogo.conf'
        'etc/httpd/conf/extra/SOGo.conf'
        'etc/conf.d/sogo')
source=("https://packages.sogo.nu/sources/SOGo-${pkgver}.tar.gz"
        "sogo.service"
        "sogo.confd")
sha512sums=('d3dbe7f2595d02f9b7f8865eb5c3f73a35c2ad3882d3228a89f2c48d74c3affbf1dcd063b6e65b37d1cee12202adc84291cdc263c42e9635ea3186ed950733c8'
            '73de6719ba3c17fb03dba4c7390f1e99ac4adff4c3413b6031ebb807fcef8a3f5eb0b8e3767a9560c2106b2f3470447b52803f5bd2f562b382e99c6382be2879'
            '51803a53f5ae32017281e3c891ae21c126a6adc10529669bd659cc4bffaeaae46a59db34c0c97bbc83e9e3be5e619e4ced170e18b31c1267d3c14ce20b54ccf4')

build() {
  cd "SOGo-${pkgver}"
  ./configure --prefix=$(gnustep-config --variable=GNUSTEP_SYSTEM_ROOT) --disable-debug --enable-mfa
  make
}

package() {
  cd "SOGo-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -D -m 0644 "${srcdir}"/sogo.service \
                     "${pkgdir}"/usr/lib/systemd/system/sogo.service
  install -D -m 0600 "${srcdir}"/SOGo-${pkgver}/Scripts/sogo.conf \
                     "${pkgdir}"/etc/sogo/sogo.conf
  install -D -m 0644 "${srcdir}"/SOGo-${pkgver}/Apache/SOGo.conf \
                     "${pkgdir}"/etc/httpd/conf/extra/SOGo.conf
  install -D -m 0644 "${srcdir}"/SOGo-${pkgver}/Scripts/logrotate \
                     "${pkgdir}"/etc/logrotate.d/sogo
  install -d -m 0755 "${pkgdir}"/usr/lib/sogo/scripts
  install    -m 0755 "${srcdir}"/SOGo-${pkgver}/Scripts/sql-*.sh \
                      "${pkgdir}"/usr/lib/sogo/scripts/
  install -D -m 0644 "${srcdir}"/sogo.confd \
                     "${pkgdir}"/etc/conf.d/sogo
  cd "${srcdir}/SOGo-${pkgver}/ActiveSync"
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"
}
