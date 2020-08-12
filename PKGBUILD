# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: DJ Lucas <dj_AT_linuxfromscratch_DOT_ort>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor:  Andre Wayand <aur-sogo@awayand.sleepmail.com>
pkgname=sogo
pkgdesc="groupware server built around OpenGroupware.org (OGo) and the SOPE application server"
pkgver=5.0.0
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
         'libwbxml')
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
source=("http://www.sogo.nu/files/downloads/SOGo/Sources/SOGo-${pkgver}.tar.gz"
        "sogo.service"
        "sogo.confd"
        "sogo_configure.patch"
        "gcc10-fix.patch")
sha256sums=('9002554017ac1324672f7e8de5fc68dea0b7d27640b0e54e1c5b9a88cfddff7d'
            '0720b9ad35a05d86d794c7adbf18277ecde57ed147e96f6105acca93f19d3b8c'
            '8ee0d1ad77e998ea801053fce175d8c4a1c55dcc5ee1ff78f0a8e3797187a6a7'
            'e64ea4aa0ddf29785de8d786ab7ab09f940bfe316b6f1deeb8d04d9d16d35db1'
            '3ed561519ad2a635869dd1d961329b557e1fa8fff0b0c4bc7e0b40926a35b13a')

prepare() {
  cd "$srcdir/SOGo-${pkgver}"

  patch configure ../sogo_configure.patch
  patch -Np1 -i ../gcc10-fix.patch
}

build() {
  cd "$srcdir/SOGo-${pkgver}"
  ./configure --prefix=$(gnustep-config --variable=GNUSTEP_SYSTEM_ROOT) --disable-debug
  make
}

package() {
  cd "${srcdir}/SOGo-${pkgver}"
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
