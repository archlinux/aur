# vim: set et sw=2:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ypserv
pkgver=4.2
pkgrel=1
pkgdesc='Linux NIS Server'
arch=('i686' 'x86_64')
url='https://github.com/thkukuk/ypserv'
license=('GPL2')
makedepends=('libxslt' 'libxml2' 'docbook-xml' 'docbook-xsl')
depends=('gawk' 'yp-tools' 'libsystemd' 'gdbm')
backup=('etc/ypserv.conf' 'etc/netgroup' 'etc/securenets' 'etc/yp/Makefile')
source=("$url/releases/download/v$pkgver/ypserv-$pkgver.tar.xz"
        'ypxfrd.service'
        'ypserv.service'
        'yppasswdd.service'
        'ypxfr_1perday.service'
        'ypxfr_1perday.timer'
        'ypxfr_1perhour.service'
        'ypxfr_1perhour.timer'
        'ypxfr_2perday.service'
        'ypxfr_2perday.timer'
        'ypserv.conf')

prepare() {
  cd $pkgname-$pkgver
  sed -i -r -e '/AM_CFLAGS/s/ -Werror//' lib/Makefile.am
  sed -i -r -e 's,AC_CHECK_HEADERS\(crypt.h\),AC_CHECK_HEADERS([paths.h crypt.h]),' \
      configure.ac
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 etc/netgroup "${pkgdir}"/etc/netgroup
  install -D -m644 etc/ypserv.conf "${pkgdir}"/etc/ypserv.conf
  install -D -m644 etc/securenets "${pkgdir}"/etc/securenets
  install -D -m644 ../ypxfrd.service "${pkgdir}"/usr/lib/systemd/system/ypxfrd.service
  install -D -m644 ../ypserv.service "${pkgdir}"/usr/lib/systemd/system/ypserv.service
  install -D -m644 ../yppasswdd.service "${pkgdir}"/usr/lib/systemd/system/yppasswdd.service
  install -D -m644 ../ypxfr_1perday.service "${pkgdir}"/usr/lib/systemd/system/ypxfr_1perday.service
  install -D -m644 ../ypxfr_1perday.timer "${pkgdir}"/usr/lib/systemd/system/ypxfr_1perday.timer
  install -D -m644 ../ypxfr_1perhour.service "${pkgdir}"/usr/lib/systemd/system/ypxfr_1perhour.service
  install -D -m644 ../ypxfr_1perhour.timer "${pkgdir}"/usr/lib/systemd/system/ypxfr_1perhour.timer
  install -D -m644 ../ypxfr_2perday.service "${pkgdir}"/usr/lib/systemd/system/ypxfr_2perday.service
  install -D -m644 ../ypxfr_2perday.timer "${pkgdir}"/usr/lib/systemd/system/ypxfr_2perday.timer
  install -D -m644 "${pkgdir}"/var/yp/Makefile "${pkgdir}"/etc/yp/Makefile
  install -D -m644 ../ypserv.conf "${pkgdir}"/usr/lib/tmpfiles.d/ypserv.conf
  rm -fr "${pkgdir}/var"
}

md5sums=('7c1c6d042acefd74a6665233e4ad22c9'
         '0639cc2e8f667272335649eeede77206'
         '3428dcc728b2ac6c4edda9f43e834238'
         '9ff147310a5b83749357b6587cccdf34'
         'e774794de8a3d4aae4a07d23fcbe7075'
         'bbc9b0eca0027f30f7c662be293d214c'
         '921dce0c6735971f2526cf9ebff2805d'
         '742e15be6c75fffe6bd133176c6c6362'
         '19eb24bbe7c4fe6a877f489ab9dfdcb3'
         '0c232eb939198fc300f40159ba99f73a'
         'ee375afa24cdb5ffbf83c39aa2f08e54')
