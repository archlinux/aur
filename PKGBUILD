# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow-ui
pkgver=4.5.0
pkgrel=1
pkgdesc="ECMWF GUI client for ecFlow"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/ECFLOW/Getting+Started+with+ecFlowUI"
license=('APACHE')
groups=(science)
depends=(qt5-base qt5-declarative)
makedepends=(cmake boost)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/8650755/ecFlow-${pkgver}-Source.tar.gz ecFlow-ptree.patch)
noextract=()
md5sums=('6b6e0d7a30c65ce1224e18b58f86e1f2' 'bcd6f0c578c4e1165d333e381cc77ae1')

prepare() {
  cd ecFlow-${pkgver}-Source
  patch --verbose -Np1 -i "../ecFlow-ptree.patch"
}

build() {
  cd ecFlow-${pkgver}-Source
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-w -DENABLE_SERVER=off -DENABLE_PYTHON=off -DENABLE_UI=on -DENABLE_GUI=off \
    -DBOOST_ROOT=/usr \
    -DECF_NO_PYTHON=1 ..
  make -j$(grep processor /proc/cpuinfo | wc -l) ecflow_ui.x || return 1
}

package()
{
  cd ecFlow-${pkgver}-Source/build
  echo "$pkgdir"
  make DESTDIR="$pkgdir" install ecflow_ui.x || return 1
  cd ${pkgdir}/usr/bin/
  rm ecflow_logsvr.pl  ecflow_logsvr.sh  ecflow_migrate.py  ecflow_start.sh  ecflow_stop.sh  ecflow_test_ui.sh noconnect.sh
  rm -rf ${pkgdir}/usr/share/ecflow/cmake
}

# vim:set ts=2 sw=2 et:
