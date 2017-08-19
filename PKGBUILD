# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Christophe Gueret <christophe.gueret@dans.knaw.nl>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano DOT torromeo AT google mail service>

pkgname=virtuoso6
pkgver=6.1.8
_pkgname=virtuoso
pkgrel=2
arch=('i686' 'x86_64')
url='http://virtuoso.openlinksw.com/wiki/main/Main/'
license=('GPL')
pkgdesc='Virtuoso is a scalable cross-platform server that combines Relational,\
 Graph, and Document Data Management with Web Application Server and Web \
 Services Platform functionality. This is currently the latest version available for i686 architecture.'
depends=('libldap' 'imagemagick' 'java-environment' 'openssl-1.0')
makedepends=('bison' 'flex' 'gperf' 'net-tools' 'optipng')
replaces=('virtuoso-base')
provides=('virtuoso-base')
install=virtuoso.install
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-opensource-${pkgver}.tar.gz" virtuoso.service)
md5sums=('94ef4f93cad915f73bee547fe95db725'
         '4dc007d22588c5933650984a7863d4d0')

prepare() {
  cd ${_pkgname}-opensource-${pkgver}

  optipng -quiet -force -fix appsrc/ODS-Wiki/http/images/opts_16.png
}

build() {
  
  cd ${_pkgname}-opensource-${pkgver}
  CFLAGS="-I/usr/include/openssl-1.0" LDFLAGS="-L/usr/lib/openssl-1.0" \
     ./configure --with-layout=debian \
                 --program-transform-name='s/isql$$/isql-vt/;s/isqlw/isqlw-vt/' \
                 --with-readline
  
  make
}

package() {

  cd ${_pkgname}-opensource-${pkgver}
  make DESTDIR="${pkgdir}" install

  # rename to avoid conflicts with unixodbc
  for bin in isql isqlw; do
    install -Dm755 "${srcdir}"/${_pkgname}-opensource-${pkgver}/binsrc/tests/$bin \
      "${pkgdir}"/usr/bin/virtuoso-$bin
  done

  # install service
  install -Dm644 ../virtuoso.service "${pkgdir}/usr/lib/systemd/system/virtuoso.service"

  # remove renamed binaries
  rm "${pkgdir}/usr/bin/isql"
  rm "${pkgdir}/usr/bin/isqlw-vt"
  
  # rename daemon
  mv "${pkgdir}/usr/bin/virtuoso-t" "${pkgdir}/usr/bin/virtuosod"

  # move configuration file
  mkdir -p "${pkgdir}/etc/virtuoso"
  mv "${pkgdir}/var/lib/virtuoso/db/virtuoso.ini" "${pkgdir}/etc/virtuoso"

  # set owner
  chown -R 2000:2000 "${pkgdir}/var/lib/virtuoso" &>/dev/null
}
