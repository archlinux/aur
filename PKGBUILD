pkgname=mingw-w64-libcmaes
pkgver=0.9.5
pkgrel=1
pkgdesc="High performance blackbox stochastic optimization using the CMA-ES algorithm"
license=('LGPL')
arch=('any')
url="https://github.com/beniz/libcmaes"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-eigen' 'mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("https://github.com/beniz/libcmaes/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libcmaes-$pkgver"

  # AC_CHECK_FILE does not work when cross-compiling
  sed -i "32,33d" configure.ac

  ./autogen.sh
}

build() {
  cd "$srcdir/libcmaes-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    # exports no symbol, so disable shared
    ${_arch}-configure --with-eigen3-include=/usr/${_arch}/include \
      --enable-onlylib  --disable-shared ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/libcmaes-${pkgver}/build-${_arch}
    make DESTDIR="$pkgdir" install
#     ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
