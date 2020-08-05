# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow
pkgver=5.5.1
pkgrel=2
pkgdesc="ecFlow - workflow manager from ECMWF"
arch=(i686 x86_64)
url="https://confluence.ecmwf.int/display/ECFLOW"
license=('APACHE 2.0')
groups=(science)
depends=(qt5-base qt5-charts qt5-svg python git)
makedepends=(cmake boost)
provides=()
conflicts=(ecflow-ui ecflow4)
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/8650755/ecFlow-${pkgver}-Source.tar.gz)
noextract=()
sha256sums=('cf5f3588c8f4b7e3785eb25666533710fa2c0b7f0407cb455f84b4ac30a83a3e')

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
