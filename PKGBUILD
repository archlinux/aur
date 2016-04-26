# Maintainer: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor:  Andre Wayand <aur-sogo@awayand.sleepmail.com>
pkgbase=sogo2
pkgname=('sogo2'
         'sogo2-openchange'
         'sogo2-activesync')
pkgver=2.3.3a
pkgrel=3
arch=('i686' 'x86_64')
url="http://www.sogo.nu/"
license=('GPL')
makedepends=('gcc-objc'
             'gnustep-base'
             'libwbxml'
             'libmemcached'
             "sope>=${pkgver}")
options=('!strip')
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

package_sogo2() {
pkgdesc="groupware server built around OpenGroupware.org (OGo) and the SOPE application server"
depends=("sope>=${pkgver}" 'gnustep-base' 'libmemcached' 'memcached')
optdepends=(
	'postgresql: run database server for sogo locally'
	'mariadb: run database server for sogo locally'
	'openldap: run directory server for sogo locally'
	'postfix: run smtp server for sogo locally'
	'dovecot: run imap server for sogo locally'
	'courier-imap: run imap server for sogo locally'
	'nginx: webserver to provide web interface locally'
	'apache: webserver to provide web interface locally'
	'lighttpd: webserver to provide web interface locally'
	'funambol: sync mobile devices with sogo contacts, events, tasks via SyncML')
backup=('etc/sogo/sogo.conf'
        'etc/httpd/conf/extra/SOGo.conf'
        'etc/conf.d/sogo')
install=sogo.install
replaces=('sogo')

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
  install -D -m 0644 "${srcdir}"/sogo.confd \
                     "${pkgdir}"/etc/conf.d/sogo
}

package_sogo2-openchange() {
pkgdesc="OpenChange module for SOGo"
depends=("sogo=${pkgver}" 'openchange')
replaces=('sogo-openchange')

  cd "${srcdir}/SOGo-${pkgver}/OpenChange"
  sed 's@-Wall@-Wall -fobjc-exceptions@' -i GNUmakefile
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"
}

package_sogo2-activesync() {
pkgdesc="ActiveSync module for SOGo"
depends=("sogo=${pkgver}" 'libwbxml')
replaces=('sogo-activesync')

  cd "${srcdir}/SOGo-${pkgver}/ActiveSync"
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"
}

sha256sums=('cc0ed55f30ef889d8d7f2d55b48066a501e9285317e0dfc63e0a12235a68382c'
            'e64ea4aa0ddf29785de8d786ab7ab09f940bfe316b6f1deeb8d04d9d16d35db1'
            '0720b9ad35a05d86d794c7adbf18277ecde57ed147e96f6105acca93f19d3b8c'
            '8ee0d1ad77e998ea801053fce175d8c4a1c55dcc5ee1ff78f0a8e3797187a6a7')

