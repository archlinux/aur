# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow-ui
pkgver=4.13.0
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
source=(https://software.ecmwf.int/wiki/download/attachments/8650755/ecFlow-${pkgver}-Source.tar.gz)
noextract=()
sha256sums=('c743896e0ec1d705edd2abf2ee5a47f4b6f7b1818d8c159b521bdff50a403e39')

build() {
  cd ecFlow-${pkgver}-Source
  awk -i inplace '/AbstractClientEnv.hpp/ { print; print "#include <iostream>"; next }1' Base/src/cts/CtsCmdRegistry.cpp
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-w -DENABLE_SERVER=off -DENABLE_PYTHON=off -DENABLE_UI=on -DENABLE_GUI=off \ #-DENABLE_SSL=on -DENABLE_SECURE_USER=off \
    -DBOOST_ROOT=/usr \
    -DECF_NO_PYTHON=1 ..
}

package()
{
  cd ecFlow-${pkgver}-Source/build
  echo "$pkgdir"
  make DESTDIR="$pkgdir" -j$(grep processor /proc/cpuinfo | wc -l) install ecflow_ui.x || return 1
  cd ${pkgdir}/usr/bin/
  rm ecflow_logsvr.pl  ecflow_logserver.sh ecflow_start.sh  ecflow_stop.sh  ecflow_test_ui.sh noconnect.sh ecflow_fuse.py  ecflow_standalone  ecflow_ui_log  ecflow_ui_log.x  ecflow_ui_node_state_diag.sh
  rm -rf ${pkgdir}/usr/share/ecflow/cmake
}

# vim:set ts=2 sw=2 et:
