# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_ort>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor:  Andre Wayand <aur-sogo@awayand.sleepmail.com>
pkgname=sogo
pkgdesc="groupware server built around OpenGroupware.org (OGo) and the SOPE application server"
pkgver=3.1.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.sogo.nu/"
license=('GPL')
options=('!strip')
depends=("sope>=${pkgver}" 
         'gnustep-base'
         'libmemcached'
         'memcached'
         'libwbxml')
makedepends=('libmemcached'
             "sope>=${pkgver}")
optdepends=(
        'postgresql: run database server for sogo locally'
        'mariadb: run database server for sogo locally'
        'openldap: run directory server for sogo locally'
        'postfix: run smtp server for sogo locally'
        'dovecot: run imap server for sogo locally'
        'courier-imap: run imap server for sogo locally'
        'nginx: webserver to provide web interface locally'
        'apache: webserver to provide web interface locally'
        'lighttpd: webserver to provide web interface locally')
replaces=('sogo2'
          'sogo-activesync'
          'sogo2-activesync')
conflicts=('sogo-openchange'
           'sogo2-openchange')
backup=('etc/sogo/sogo.conf'
        'etc/httpd/conf/extra/SOGo.conf'
        'etc/conf.d/sogo')
install=sogo.install
replaces=('sogo-activesync'
          'sogo2'
          'sogo2-activesync')
conflicts=('sogo-openchange'
           'sogo2-openchange')
source=(
  http://www.sogo.nu/files/downloads/SOGo/Sources/SOGo-${pkgver}.tar.gz
  sogo_configure.patch
  sogo.service
  sogo.confd
)

prepare() {
  cd "$srcdir/SOGo-${pkgver}"
  patch configure ../sogo_configure.patch
}

build() {
  cd "$srcdir/SOGo-${pkgver}"
  ./configure --prefix=$(gnustep-config --variable=GNUSTEP_SYSTEM_ROOT) --disable-debug
  make
}

package() {

  cd "${srcdir}/SOGo-${pkgver}"
  make install DESTDIR="${pkgdir}" GNUSTEP_SYSTEM_ADMIN_TOOLS="/usr/bin"
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
  install -D -m 0644 "${srcdir}"/sogo.confd \
                     "${pkgdir}"/etc/conf.d/sogo
  cd "${srcdir}/SOGo-${pkgver}/ActiveSync"
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"

}

sha256sums=('57e331874b0720fba4a98b887e100da6d7263e946c85388574806a1551c5b863'
            'e64ea4aa0ddf29785de8d786ab7ab09f940bfe316b6f1deeb8d04d9d16d35db1'
            '0720b9ad35a05d86d794c7adbf18277ecde57ed147e96f6105acca93f19d3b8c'
            '8ee0d1ad77e998ea801053fce175d8c4a1c55dcc5ee1ff78f0a8e3797187a6a7')

