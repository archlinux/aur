pkgname=mingw-w64-flann
pkgver=1.8.4
pkgrel=1
pkgdesc="FLANN is a library for performing fast approximate nearest neighbor searches in high dimensional spaces (mingw-w64)"
arch=('any')
url='http://www.cs.ubc.ca/~mariusm/index.php/FLANN/FLANN'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
#source=("http://people.cs.ubc.ca/~mariusm/uploads/FLANN/flann-${pkgver}-src.zip")
#md5sums=('a0ecd46be2ee11a68d2a7d9c6b4ce701')
source=(flann-${pkgver}-src::git+https://github.com/mariusmuja/flann.git)
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "$srcdir/flann-${pkgver}-src"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_PYTHON_BINDINGS=OFF \
      -DBUILD_MATLAB_BINDINGS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_TESTS=OFF \
      -DBUILD_DOC=OFF \
      -DPYTHON_EXECUTABLE=0 \
      ..
    make 
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/flann-$pkgver-src/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  
}

