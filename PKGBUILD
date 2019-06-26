# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=metview
pkgver=5.5.3
pkgrel=2
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=( 'magics++>=3.0.0' mksh openmotif netcdf-cxx-legacy eccodes qt5-webkit libxpm libtirpc)
makedepends=('emos>=4.0.5' rpcsvc-proto)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz)
noextract=()
md5sums=('efcdd55136df50c6d5a64fe499307bd7')

build() {
  cd Metview-${pkgver}-Source
  # Fix problem for libc deprived of rpc. I will use tirpc package.
  ln -sf /usr/include/tirpc/rpc mars-client/src
  ln -sf /usr/include/tirpc/netconfig.h mars-client/src
  mkdir -p build && cd build
  cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CC_COMPILER=/usr/bin/gcc \
    -DCMAKE_EXE_LINKER_FLAGS="-llapack" \
    -Dmagics_DIR=/usr/share/magics/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_CXX_STANDARD_LIBRARIES="-ltirpc" ..
  make || return 1
}

package()
{
  cd Metview-${pkgver}-Source/build
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
