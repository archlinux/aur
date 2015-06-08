pkgname=mingw-w64-coin-or-qpoases
pkgver=3.1.0
pkgrel=1
pkgdesc="COIN-OR QP solver with online active set strategy (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/qpOASES/"
license=(LGPL2.1)
groups=(coin-or)
_name=qpOASES
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
checkdepends=('wine')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/${_name}/${_name}-$pkgver.tgz")
sha1sums=('7e14ec6f2c2c39814e985cdeaffe002dee92e47c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/${_name}-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE="Release" ..
    make
    popd
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/${_name}-$pkgver/build-${_arch}
    cp /usr/${_arch}/bin/lib{gcc,stdc++,winpthread}*.dll .
    wine bin/example1.exe
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/${_name}-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir"/ install
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
