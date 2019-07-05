pkgname=sgpp
pkgver=3.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A numerical library for adaptive Sparse Grids"
url="http://sgpp.sparsegrids.org"
license=('MIT')
depends=('armadillo' 'python')
makedepends=('scons' 'swig' 'eigen')
source=("https://github.com/SGpp/SGpp/archive/v3.2.0.tar.gz")
sha256sums=('dab83587fd447f92ed8546eacaac6b8cbe65b8db5e860218c0fa2e42f776962d')

prepare() {
  cd "$srcdir/SGpp-${pkgver}"
  # gcc 9.x build failure
  grep -lr 'default(none)' . |xargs sed -i "s| default(none)||g"
}

package()
{
  cd "$srcdir/SGpp-${pkgver}"
  scons SG_JAVA=0 COMPILE_BOOST_TESTS=0 RUN_PYTHON_TESTS=0 USE_ARMADILLO=1 USE_EIGEN=1 PREFIX="$pkgdir"/usr/ -Q install ${MAKEFLAGS}
  install -d "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
  cp -Lr lib/pysgpp "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
  mv "$pkgdir"/usr/lib/sgpp/* "$pkgdir"/usr/lib
}
