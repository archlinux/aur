# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=metview
pkgver=5.3.0
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=( 'magics++>=3.0.0' mksh openmotif netcdf-cxx-legacy eccodes qtwebkit libxpm libtirpc)
makedepends=('emos>=4.0.5' rpcsvc-proto)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz qtpatch.patch)
noextract=()
md5sums=('9da7bb4f1eaebc5930d83df8afcb3e17'
         '75a0ea34147b5df93ea9442e80878ffd')

build() {
  cd Metview-${pkgver}-Source
  # Fix problem for libc deprived of rpc. I will use tirpc package.
  ln -sf /usr/include/tirpc/rpc src/libMarsClient
  ln -sf /usr/include/tirpc/netconfig.h src/libMarsClient
  # Add an include file.
  patch -p0 -i ${srcdir}/qtpatch.patch
  mkdir -p build && cd build
  cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CC_COMPILER=/usr/bin/gcc \
    -Dmagics_DIR=/usr/share/magics/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_CXX_STANDARD_LIBRARIES="-ltirpc" ..
  # Kludge to fix compilation. Not much time to find real solution.
  sed -i src/PottF/CMakeFiles/PottF.dir/link.txt \
      -e 's!-ltirpc!-ltirpc ../../lib/libMvMars.so!'
  make || return 1
}

package()
{
  cd Metview-${pkgver}-Source/build
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
