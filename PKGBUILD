pkgname=mingw-w64-medcoupling
pkgver=9.11.0
pkgrel=1
pkgdesc='Field data manipulation library (mingw-w64)'
arch=('any')
url='https://www.salome-platform.org/downloads'
license=('LGPL')
depends=('mingw-w64-med' 'mingw-w64-metis' 'mingw-w64-scotch' 'mingw-w64-libxml2')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://git.salome-platform.org/gitpub/tools/medcoupling.git#tag=V9_11_0")
md5sums=(SKIP)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/medcoupling"
  rm -rf configuration
  git clone --depth 1 -b V9_11_0 https://git.salome-platform.org/gitpub/tools/configuration.git
  sed -i "s|Ws2_32.lib|ws2_32|g" configuration/cmake/SalomeSetupPlatform.cmake
  sed -i "s|Userenv|userenv|g" configuration/cmake/SalomeSetupPlatform.cmake
  curl -L https://github.com/jschueller/medcoupling/commit/7de0382.patch | patch -p1
}

build() {
  cd "${srcdir}/medcoupling"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DMEDCOUPLING_BUILD_DOC=OFF -DMEDCOUPLING_ENABLE_PYTHON=OFF -DMEDCOUPLING_BUILD_TESTS=OFF \
      -DCONFIGURATION_ROOT_DIR="$srcdir"/medcoupling/configuration -DMEDCOUPLING_USE_64BIT_IDS=OFF -DBOOST_ROOT_DIR=/usr/${_arch} ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/medcoupling/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
