pkgname=mingw-w64-coin-or-csdp
pkgver=6.2.0
pkgrel=1
pkgdesc="A C library for Semidefinite Programming (mingw-w64)"
arch=(any)
url="https://projects.coin-or.org/Csdp"
license=(EPL)
depends=(mingw-w64-lapack)
makedepends=(mingw-w64-cmake)
options=('!buildflags' '!strip' 'staticlibs')
groups=(mingw-w64-coin-or)
source=("https://www.coin-or.org/download/source/Csdp/Csdp-$pkgver.tgz" CMakeLists.txt)
sha256sums=('7f202a15f33483ee205dcfbd0573fdbd74911604bb739a04f8baa35f8a055c5b' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd Csdp-$pkgver
  # https://github.com/coin-or/Csdp/pull/7
  cp "$srcdir"/CMakeLists.txt .
}

build() {
  cd Csdp-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Csdp-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
