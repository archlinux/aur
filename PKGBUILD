# Maintainer: Kevin Slagle <kjslag at gmail dot com>

# uncomment if you want 350MB of debug symbols
#debug=true

pkgname=alps
_pkgver=2.3.0
pkgver=2.3.0
pkgrel=1
pkgdesc="Provides physics simulation code for strongly correlated quantum mechanical systems"
arch=('i686' 'x86_64')
url="http://alps.comp-phys.org"
license=('custom:ALPS')
depends=('boost' 'fftw' 'python2-scipy' 'python2-h5py' 'python2-matplotlib')
makedepends=('cmake' 'gcc-fortran')
source=(http://alps.comp-phys.org/static/software/releases/alps-${_pkgver}-src.tar.gz)
sha512sums=('3746621ce1a2df03b1d1c2a763e5842a6b4aa82188f6e9847728942db55f8b869d1381cfc1f1394c5f4b97ed14f16f9de2ce912b039b384b4eb1827ba65d2317')
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
