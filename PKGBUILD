# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow
pkgver=4.13.0
pkgrel=1
pkgdesc="ecFlow - workflow manager from ECMWF"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/ECFLOW/Getting+Started+with+ecFlowUI"
license=('APACHE')
groups=(science)
depends=()
makedepends=(cmake boost)
provides=()
conflicts=(ecflow-ui)
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/8650755/ecFlow-${pkgver}-Source.tar.gz python.patch iostream.patch)
noextract=()
sha256sums=('c743896e0ec1d705edd2abf2ee5a47f4b6f7b1818d8c159b521bdff50a403e39' 'f957e0f66b3b73df20021a40d3a091071d12b1da83d7bb4d06d8245dbb1678f1' 'f3612a4f1a169ccf18a82ba9021fabc9ee52e60554b67ec45cc7637b6a331679')

prepare() {
  cd ecFlow-${pkgver}-Source
  patch --verbose -Np1 -i "${srcdir}/python.patch"
  patch --verbose -Np1 -i "${srcdir}/iostream.patch"
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
