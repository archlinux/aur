# vim: set et sw=2:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ypserv
pkgver=4.0
pkgrel=3
pkgdesc='Linux NIS Server'
arch=('i686' 'x86_64')
url='https://github.com/thkukuk/ypserv'
license=('GPL2')
makedepends=('libxslt' 'libxml2' 'docbook-xml' 'docbook-xsl')
depends=('gawk' 'yp-tools' 'libsystemd')
backup=('etc/ypserv.conf' 'etc/netgroup' 'etc/securenets' 'etc/yp/Makefile')
source=("$url/archive/$pkgname-$pkgver.tar.gz"
        'ypxfrd.service'
        'yppasswdd.service'
	'ypserv.service'
        'ypserv.conf')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  sed -i -r -e 's,AC_CHECK_HEADERS\(crypt.h\),AC_CHECK_HEADERS([paths.h crypt.h]),' \
      configure.ac
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 etc/netgroup "${pkgdir}"/etc/netgroup
  install -D -m644 etc/ypserv.conf "${pkgdir}"/etc/ypserv.conf
  install -D -m644 etc/securenets "${pkgdir}"/etc/securenets
  install -D -m644 ../ypxfrd.service "${pkgdir}"/usr/lib/systemd/system/ypxfrd.service
  install -D -m644 ../ypserv.service "${pkgdir}"/usr/lib/systemd/system/ypserv.service
  install -D -m644 ../yppasswdd.service "${pkgdir}"/usr/lib/systemd/system/yppasswdd.service
  install -D -m644 "${pkgdir}"/var/yp/Makefile "${pkgdir}"/etc/yp/Makefile
  install -D -m644 ../ypserv.conf "${pkgdir}"/usr/lib/tmpfiles.d/ypserv.conf
  rm -fr "${pkgdir}/var"
}

md5sums=('0b2cf49154881b65d37e44f89e163071'
         '0639cc2e8f667272335649eeede77206'
         '9ff147310a5b83749357b6587cccdf34'
         '89b8b608c81fd01bb81cdb551854833f'
         '9a3d6ce34139003f1188b9e39dd9a8e8')
