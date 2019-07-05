pkgname=mingw-w64-sgpp
pkgver=3.2.0
pkgrel=1
arch=('any')
pkgdesc="A numerical library for adaptive Sparse Grids (mingw-w64)"
url="http://sgpp.sparsegrids.org"
license=('MIT')
depends=('mingw-w64-armadillo')
makedepends=('scons' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/SGpp/SGpp/archive/v3.2.0.tar.gz")
sha256sums=('dab83587fd447f92ed8546eacaac6b8cbe65b8db5e860218c0fa2e42f776962d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/SGpp-${pkgver}"
  # gcc 9.x build failure
  grep -lr 'default(none)' . |xargs sed -i "s| default(none)||g"

  # in-progress :[
  # https://github.com/scons/scons/wiki/CrossCompilingMingw
  curl -fSsLO https://raw.githubusercontent.com/anholt/mesa/master/scons/crossmingw.py
  mv crossmingw.py site_scons
  
  cd "$srcdir/"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r SGpp-${pkgver} build-${_arch}
  done
}

package()
{
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    scons COMPILER=gnu CC=${_arch}-gcc CXX=${_arch}-g++ BOOST_INCLUDE_PATH=/usr/${_arch}/include BOOST_LIBRARY_PATH=/usr/${_arch}/lib GSL_INCLUDE_PATH=/usr/${_arch}/include SG_PYTHON=0 SG_JAVA=0 COMPILE_BOOST_TESTS=0 USE_ARMADILLO=1 USE_EIGEN=1 PREFIX="$pkgdir"/usr/${_arch} -Q install ${MAKEFLAGS}
    mv "$pkgdir"/usr/${_arch}/lib/sgpp/* "$pkgdir"/usr/${_arch}/lib
    popd
  done
}
