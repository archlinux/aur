# Maintainer: DJ Lucas <dj@linuxfromscratch.org>
# Maintainer: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor:  Andre Wayand <aur-sogo@awayand.sleepmail.com>
pkgbase=sogo
pkgname=('sogo'
         'sogo-openchange'
         'sogo-activesync')
pkgver=2.3.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.sogo.nu/"
license=('GPL')
makedepends=('gcc-objc'
             'gnustep-base'
             'libwbxml'
             'libmemcached'
             'sope>=2.3.0')
options=('!strip')
install=sogo.install
source=(
  http://www.sogo.nu/files/downloads/SOGo/Sources/SOGo-${pkgver}.tar.gz
  sogo_configure.patch
  UI_MailPartViewers_GNUmakefile.patch
  sogo.service
)

prepare() {
  cd "$srcdir/SOGo-${pkgver}"
  patch configure ../sogo_configure.patch
  patch -p1 < ../UI_MailPartViewers_GNUmakefile.patch
}

build() {
  cd "$srcdir/SOGo-${pkgver}"
  ./configure --prefix=$(gnustep-config --variable=GNUSTEP_SYSTEM_ROOT) --disable-debug
  make
}

package_sogo() {
pkgdesc="groupware server built around OpenGroupware.org (OGo) and the SOPE application server"
depends=('sope>=2.3.0' 'gnustep-base' 'libmemcached' 'memcached')
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
backup=(etc/sogo/sogo.conf etc/httpd/conf/extra/SOGo.conf)

  cd "${srcdir}/SOGo-${pkgver}"
  make install DESTDIR="${pkgdir}" GNUSTEP_SYSTEM_ADMIN_TOOLS="/usr/bin"
  install -D -m 0644 "${srcdir}"/sogo.service "${pkgdir}"/usr/lib/systemd/system/sogo.service
  install -D -m 0600 "${srcdir}"/SOGo-${pkgver}/Scripts/sogo.conf "${pkgdir}"/etc/sogo/sogo.conf
  install -D -m 0644 "${srcdir}"/SOGo-${pkgver}/Apache/SOGo.conf "${pkgdir}"/etc/httpd/conf/extra/SOGo.conf
}

package_sogo-openchange() {
pkgdesc="OpenChange module for SOGo"
depends=('sogo=2.3.0' 'openchange')

  cd "${srcdir}/SOGo-${pkgver}/OpenChange"
  sed 's@-Wall@-Wall -fobjc-exceptions@' -i GNUmakefile
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"
}

package_sogo-activesync() {
pkgdesc="ActiveSync module for SOGo"
depends=('sogo=2.3.0' 'libwbxml')

  cd "${srcdir}/SOGo-${pkgver}/ActiveSync"
  make PYTHON=/usr/bin/python2 install DESTDIR="${pkgdir}" GNU_SYSTEM_ADMIN_TOOLS="/usr/bin"
}

sha256sums=('26134eee48b6a42b047fea61a093b7774bf5066778debf02bcff6f6682803e0a'
            'e64ea4aa0ddf29785de8d786ab7ab09f940bfe316b6f1deeb8d04d9d16d35db1'
            'ef6ab2829d35c2abb5529ee8ea9a4cc541913b0a82bc91f4c9fa21c65d44a4aa'
            '62a22aa4231059fd85315795ea735638da4bc71cde4c7da21a71f2559647a4b1')

