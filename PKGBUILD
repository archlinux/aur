# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=1.1.0
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost-libs' 'python' 'python-matplotlib')
makedepends=('boost' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine'
            'eigen: For an informed sampling technique')
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz)
sha512sums=('ad9331eb79d64ce61132511affc7a713611c55fbbf85c0092fa0ed5a210be3810ce181608f5c278eea56e5227914e24920dc5375e110972f22e6befaf4f199f8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  sed -e 's#\#include <boost/random/mersenne_twister.hpp>#\#include <boost/random/mersenne_twister.hpp>\n\#include <boost/type_traits/ice.hpp>#g' -i src/ompl/util/RandomNumbers.h

  rm -rf build
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DPYTHON_EXEC=/usr/bin/python2 \
    -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION \
    -DOMPL_REGISTRATION=Off ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  #make test
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}
