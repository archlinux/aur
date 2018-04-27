# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski@gmail.com>
# This package provides proper systemd service files that will not conflict with openvas-systemd package
pkgname=openvas-scanner-systemd
_pkgname=openvas-scanner
pkgver=5.1.2
pkgrel=1
pkgdesc='The OpenVAS scanning Daemon with proper systemd service files'
arch=('x86_64')
url='http://www.openvas.org/'
license=('GPL')
depends=( 'openvas-libraries' 'redis' 'openvas-systemd' )
makedepends=('cmake' 'xmltoman' 'doxygen')
provides=('openvas-scanner')
groups=(openvas)
# These URLs need to be manually updated on every pkgver upgrade.
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/openvas-scanner/archive/v${pkgver}.tar.gz"
        "https://github.com/greenbone/openvas-scanner/releases/download/v${pkgver}/openvas-scanner-${pkgver}.tar.gz.sig")
md5sums=('2c09d11acdc2189a976cd1433a211197'
         'SKIP')
validpgpkeys=(
              'C3B468D2288C68B9D526452248479FF648DB4530' # OpenVAS Transfer Integrity
)

build() {
  cd "${_pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
  make doc
  make doc-full
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
