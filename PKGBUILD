pkgname=mingw-w64-hmat-oss
pkgver=1.7.1
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library (mingw-w64)"
license=('GPL')
arch=('any')
url="https://github.com/jeromerobert/hmat-oss"
depends=('mingw-w64-cblas' 'mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha256sums=('8ff641ec6b1ae290ee8d67ba5880fb636659c5f150e84daa826d93140500b3ed')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd hmat-oss-$pkgver
  curl -L https://github.com/jeromerobert/hmat-oss/pull/80.patch | patch -p1
  curl -L https://github.com/jeromerobert/hmat-oss/pull/81.patch | patch -p1
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
