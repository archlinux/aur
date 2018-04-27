# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski[at]gmail[dot]com>
pkgname=openvas-manager-postgres
_pkgname=openvas-manager
pkgver=7.0.3
pkgrel=1
pkgdesc='A layer between the OpenVAS Scanner and various client applications'
arch=('x86_64')
url='http://www.openvas.org/'
license=('GPL')
depends=('libxslt' 'openvas-libraries' 'rsync' 'postgresql' 'sqlite3')
makedepends=('cmake' 'doxygen' 'xmltoman')
optdepends=('python2: SPLIT_PART_SIZE feature via xml_split script')
provides=('openvas-manager')
groups=(openvas)
install="${pkgname}.install"
# These URLs need to be manually updated on every pkgver upgrade.
# http://wald.intevation.org/frs/?group_id=29
source=("https://github.com/greenbone/gvm/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "https://github.com/greenbone/gvm/releases/download/v${pkgver}/openvas-manager-${pkgver}.tar.gz.sig"
	"postgres-include.patch")
sha512sums=('c382b8791a66cc73c1f0da190a11a4addd22afee93abfe96718aba6c5e4488c3ccf33e17cb0aaf8dc376efe2b0264fef4195d5292d97387d2a24d515e3a4d325'
            'SKIP'
            '916b02ef22c310adbfcbb8e6161c9382baec2c038acd5d0fb6f928e93496d67efe8d29b3e862dc65cab0151a70a8299b20ef18f93891b40c27c3b12aca612859')
validpgpkeys=(
              'C3B468D2288C68B9D526452248479FF648DB4530' # OpenVAS Transfer Integrity
)

prepare() {
  cd gvm-"${pkgver}"
  sed -i '1c#!/usr/bin/python2' tools/extra/xml_split
  patch -p0 -i ../"postgres-include.patch"
}

build() {
  cd gvm-"${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin -DBACKEND=POSTGRESQL \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
}

package() {
  cd "gvm-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
