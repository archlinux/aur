# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: DJ Lucas <dj_AT_linuxfromscratch_DOT_ort>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor:  Andre Wayand <aur-sogo@awayand.sleepmail.com>
pkgname=sogo
pkgdesc="groupware server built around OpenGroupware.org (OGo) and the SOPE application server"
pkgver=5.5.1
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
         'libzip')
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
source=("https://packages.inverse.ca/SOGo/sources/SOGo-${pkgver}.tar.gz"
        "sogo.service"
        "sogo.confd")
sha256sums=('acde56d070c301f35d4893ec1824a18527bf00f0220ec14cd7cc5c9475b5e830'
            '7565a09d2b9daebaf2814a2bb55bf5bcae4cd3c72426f14a7ad6cd07e337c68b'
            '8ee0d1ad77e998ea801053fce175d8c4a1c55dcc5ee1ff78f0a8e3797187a6a7')

build() {
  cd "SOGo-${pkgver}"
  ./configure --prefix=$(gnustep-config --variable=GNUSTEP_SYSTEM_ROOT) --disable-debug
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
  install    -m 0755 "${srcdir}"/SOGo-${pkgver}/Scripts/sql-update-2.2.17_to_2.3.0{,-mysql}.sh \
                      "${pkgdir}"/usr/lib/sogo/scripts/
  install    -m 0755 "${srcdir}"/SOGo-${pkgver}/Scripts/sql-update-3.0.0-to-combined{,-mysql}.sh \
                      "${pkgdir}"/usr/lib/sogo/scripts/
  install    -m 0755 "${srcdir}"/SOGo-${pkgver}/Scripts/sql-update-3.2.10_to_4.0.0{,-mysql}.sh \
                      "${pkgdir}"/usr/lib/sogo/scripts/
  install -D -m 0644 "${srcdir}"/sogo.confd \
                     "${pkgdir}"/etc/conf.d/sogo
  cd "${srcdir}/SOGo-${pkgver}/ActiveSync"
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"
}
