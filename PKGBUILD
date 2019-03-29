# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow
pkgver=4.14.0
pkgrel=1
pkgdesc="ecFlow - workflow manager from ECMWF"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/ECFLOW/Getting+Started+with+ecFlowUI"
license=('APACHE')
groups=(science)
depends=(qt5-base qt5-charts qt5-svg python git)
makedepends=(cmake boost)
provides=()
conflicts=(ecflow-ui)
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/8650755/ecFlow-${pkgver}-Source.tar.gz)
noextract=()
sha256sums=('d8f10a903456ed94f22e33d838a3dd29e2ac34cbe2f25100789f14a5ab82f2c7')

prepare() {
  cd ecFlow-${pkgver}-Source
}

build() {
  cd ecFlow-${pkgver}-Source
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-w -DENABLE_SERVER=on -DENABLE_PYTHON=on -DENABLE_UI=on -DENABLE_GUI=off \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DBOOST_ROOT=/usr \
    ..
  make -j$(grep processor /proc/cpuinfo | wc -l) || return 1
}

package()
{
  cd ecFlow-${pkgver}-Source/build
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
