# $Id$
# Maintainer: Y. <theYinYeti@yalis.fr>, based on the work of:
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Mateusz Paluszkiewcz <aifam96 at gmail dot com>
# Contributor: Christopher Reimer <vdr4arch at creimer dot net>

pkgname=poco178
pkgver=1.7.8_p3
_pkgver=${pkgver/_/}
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition with debug libraries"
arch=('i686' 'x86_64')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('libmariadbclient' 'openssl' 'unixodbc')
makedepends=('cmake')
source=("http://pocoproject.org/releases/poco-${_pkgver%p?}/poco-${_pkgver}-all.tar.bz2")
sha256sums=('23f2ae2dd373cade48b393b6e440ebc75ecff50f4d37c0cfa80b7723904386b6')

build() {
  cd "${srcdir}/poco-${_pkgver}-all"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "${srcdir}/poco-${_pkgver}-all"/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 '../LICENSE' "${pkgdir}/usr/share/licenses/poco/LICENSE"

  # Old version! Do not conflict with the current version
  cd "${pkgdir}"
  for old in usr/bin/* usr/include/Poco usr/lib/cmake/Poco usr/share/licenses/poco; do
    mv $old{,-$_pkgver}
  done
  rm -f usr/lib/*.so
}
