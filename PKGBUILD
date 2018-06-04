# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org>
pkgname=ovito-git
pkgver=2.9.0.r202.g64b8b784
pkgrel=1
pkgdesc="Scientific visualization and analysis software for atomistic simulation data"
arch=('i686' 'x86_64')
url="http://www.ovito.org/"
license=('GPLv3')
provides=('ovito')
depends=('python' 'zlib' 'tachyon' 'qscintilla-qt5' 'cgal' 'povray' 'hdf5')
makedepends=('git' 'cmake' 'gcc' 'qt5-base' 'qt5-script' 'qt5-svg' 'qt5-imageformats')
conflicts=('ovito')
md5sums=('SKIP')
source=('ovito'::'git+https://gitlab.com/stuko/ovito.git')
_gitname="ovito"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

build() {
  cd $srcdir/$_gitname
  sed -i 's/HDF5 COMPONENTS hdf5 REQUIRED NO_MODULE/HDF5 REQUIRED/g' $srcdir/$_gitname/src/3rdparty/netcdf_integration/CMakeLists.txt
  sed -i 's/CODEC_FLAG_GLOBAL_HEADER/AV_CODEC_FLAG_GLOBAL_HEADER/g' $srcdir/$_gitname/src/core/utilities/io/video/VideoEncoder.cpp

  cmake . \
      -DCMAKE_BUILD_TYPE=Release \
      -DOVITO_BUILD_PLUGIN_PYSCRIPT=on \
      -DOVITO_BUILD_PLUGIN_NETCDF=on \
      -DOVITO_VIDEO_OUTPUT_SUPPORT=on \
      -DOVITO_BUILD_PLUGIN_SCRIPTING=on \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DBoost_PYTHON_LIBRARY_RELEASE=/usr/lib/libboost_python3.so \
      -DCMAKE_EXE_LINKER_FLAGS='-Wl,-rpath,/usr/lib/ovito'
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="${pkgdir}/" install
}
