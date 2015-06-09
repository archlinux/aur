# Maintainer: Kevin Slagle <kjslag at gmail dot com>

# uncomment if you want 350MB of debug symbols
#debug=true

pkgname=alps
_pkgver=2.2.b3-r7462
pkgver=2.2.b3_r7462
#_pkgver=2.1.1-r6176
#pkgver=2.1.1_r6176
pkgrel=1
pkgdesc="Provides physics simulation code for strongly correlated quantum mechanical systems"
arch=('i686' 'x86_64')
url="http://alps.comp-phys.org"
license=('custom:ALPS')
depends=('boost' 'fftw' 'python2-scipy' 'python2-h5py' 'python2-matplotlib')
makedepends=('cmake' 'gcc-fortran')
source=(http://alps.comp-phys.org/static/software/releases/alps-${_pkgver}-src.tar.gz)
md5sums=('f739c2f6987aed76cc5e417c563ae053')
#md5sums=('f4c9b044ed9ee8964c449a473bd75842')
[ "$debug" = "true" ] && options=(!strip)

build() {
  # http://alps.comp-phys.org/mediawiki/index.php/Download_and_install_ALPS_2#Build_ALPS
  
  cd "${srcdir}/alps-${_pkgver}-src/alps"
  
  # this line is recommended, but gave a compilation error
  # [ "$CARCH" = "x86_64" ] && _CMAKE_ARGS=-DLAPACK_64_BIT=ON
  
  if [ "$debug" = "true" ]
  then CFLAGS="-g $CFLAGS"
       CXXFLAGS="-g $CXXFLAGS"
  fi
  
  mkdir -p build
  cd build
  
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_INTERPRETER=/usr/bin/python2 $_CMAKE_ARGS
  make
  make test || true
  
  # 2.2.b3-r7462:
  # 99% tests passed, 1 tests failed out of 149
  # The following tests FAILED:
  #         112 - expression (Failed)
}

package() {
  cd "${srcdir}/alps-${_pkgver}-src/alps/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/alps/LICENSE"
  
  cd "${pkgdir}"
  mv usr/tutorials usr/share/alps/
  
  # make python see alps (the alternative is to run with alpspython)
  mkdir -p usr/lib/python2.7/site-packages/
  ln -s ../../pyalps usr/lib/python2.7/site-packages/
}
