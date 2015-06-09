# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=ovito-git
pkgver=2.4.4.r43.g58fc2cf
pkgrel=1
pkgdesc="Scientific visualization and analysis software for atomistic simulation data"
arch=('i686' 'x86_64')
url="http://www.ovito.org/"
license=('GPLv3')
provides='ovito'
depends=('python' 'zlib' 'tachyon' 'qscintilla-qt5' 'cgal')
makedepends=('git' 'cmake' 'gcc' 'qt5-base' 'qt5-script' 'qt5-svg' 'qt5-imageformats')
conflicts=('ovito' 'ovito-netcdf-git')
md5sums=('')
source=('ovito'::'git+http://git.code.sf.net/p/ovito/git')
_gitname="ovito"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  sed -i 's/PATH_SUFFIXES qt5/PATH_SUFFIXES qt qt5/g' $srcdir/ovito/cmake/FindQScintilla.cmake
  sed -i 's/Boost_REQUIRED_COMPONENTS python/Boost_REQUIRED_COMPONENTS python3/g' $srcdir/ovito/CMakeLists.txt
  sed -i 's/Boost_PYTHON_LIBRARY/Boost_PYTHON3_LIBRARY/g' $srcdir/ovito/src/plugins/pyscript/CMakeLists.txt
  sed -i 's/c++0x/c++11/g' $srcdir/ovito/CMakeLists.txt
  CC=gcc CXX=g++ cmake ../$_gitname \
            -DCMAKE_BUILD_TYPE=Release \
            -DOVITO_BUILD_PLUGIN_PYSCRIPT=on \
            -DOVITO_BUILD_PLUGIN_NETCDF=on \
            -DOVITO_VIDEO_OUTPUT_SUPPORT=on \
            -DOVITO_BUILD_PLUGIN_SCRIPTING=on \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.4m \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.4m.so \
            -DCMAKE_INSTALL_PREFIX:PATH=/usr \
            -DCMAKE_EXE_LINKER_FLAGS='-Wl,-rpath,/usr/lib/ovito'
  make VERBOSE=yes
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}/" install
} 


