pkgname=mingw-w64-hmat-oss
pkgver=1.8.1
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library (mingw-w64)"
license=('GPL')
arch=('any')
url="https://github.com/jeromerobert/hmat-oss"
depends=('mingw-w64-cblas' 'mingw-w64-lapacke')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha256sums=('59bf742ed13f313c622b0710b565098a4de60a38e0700f63842c576bd398b941')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd hmat-oss-$pkgver
}

build() {
  cd "$srcdir/hmat-oss-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DHMAT_GIT_VERSION=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/hmat-oss-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
