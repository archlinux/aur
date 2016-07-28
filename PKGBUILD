pkgname=sgpp
pkgver=2.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="spatially adaptive sparse grids"
depends=('armadillo' 'eigen' 'python2')
makedepends=('scons' 'swig')
license=('MIT')
url="http://sgpp.sparsegrids.org"
source=("http://sgpp.sparsegrids.org/downloads/sgpp_${pkgver}.tar.gz")
sha1sums=('ba82e9cc9cf97ba27bdc1ab96ce35c7d24c6f23d')

prepare() {
  cd "$srcdir/sgpp-${pkgver}"
  sed -i "s|python pysgpp/doxy2swig|python2 pysgpp/doxy2swig|g" site_scons/ModuleHelper.py
}

build()
{
  cd "$srcdir/sgpp-${pkgver}"
  export SCONSFLAGS="$MAKEFLAGS"
  scons SG_JAVA=0 DOC=0 COMPILE_BOOST_TESTS=0 RUN_PYTHON_TESTS=0 USE_ARMADILLO=1 USE_EIGEN=1
}

package()
{
  cd "$srcdir/sgpp-${pkgver}"
  # FIXME: scons install PREFIX="$pkgdir"/usr
  install -d "$pkgdir"/usr/{lib,include}
  install -m 644 lib/sgpp/lib*.so "$pkgdir"/usr/lib
  for subdir in combigrid solver quadrature optimization pde datadriven base
  do
    cp -r $subdir/src/sgpp "$pkgdir"/usr/include
  done
  install -m644 */src/*.hpp "$pkgdir"/usr/include/sgpp
  find "$pkgdir"/usr/include/sgpp -name "*.cpp"|xargs rm
  find "$pkgdir"/usr/include/sgpp -name "*.lint"|xargs rm
  find "$pkgdir"/usr/include/sgpp -name "*.os"|xargs rm
  install -d "$pkgdir"/usr/lib/python2.7/site-packages
  cp -R lib/pysgpp "$pkgdir"/usr/lib/python2.7/site-packages
}
