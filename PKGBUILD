# vim: set et sw=2:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=ypbind-mt
pkgname=ypbind-mt-git
pkgver=2.7.2.r0.g044299c
pkgrel=1
pkgdesc='Linux NIS daemon'
url="https://github.com/thkukuk/$_pkgname"
license=('GPL2')
arch=('i686' 'x86_64')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('yp-tools' 'libsystemd')
makedepends=('git' 'libxslt' 'libxml2' 'docbook-xml' 'docbook-xsl')
backup=('etc/yp.conf')
source=("$pkgname::git+$url"
        'ypbind.service'
        'ypbind.conf')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -D -m644 etc/yp.conf "${pkgdir}"/etc/yp.conf
  install -D -m644 ../ypbind.service "${pkgdir}"/usr/lib/systemd/system/ypbind.service
  install -D -m644 ../ypbind.conf "${pkgdir}"/usr/lib/tmpfiles.d/ypbind.conf
}

md5sums=('SKIP'
         '8318400dbf455d5f8e63d4aeea68b29f'
         '3d6a8eb44771f81abb47d14d9e4f301d')
