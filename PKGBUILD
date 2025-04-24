pkgname=mingw-w64-libaec
pkgver=1.1.3
pkgrel=2
pkgdesc="Adaptive Entropy Coding library (mingw-w64)"
arch=('any')
url='https://gitlab.dkrz.de/k202009/libaec'
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
_md5=ea0b7d197a950b0c110da8dfdecbb71f
source=("${url}/-/archive/v${pkgver}/libaec-v${pkgver}.tar.bz2")
sha256sums=('46216f9d2f2d3ffea4c61c9198fe0236f7f316d702f49065c811447186d18222')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libaec-v${pkgver}"
  curl -L https://gitlab.dkrz.de/k202009/libaec/-/commit/9fd3b609a3f2a91d2d38b7f0bc79fda637e0bcb5.patch | patch -p1
  sed -i "s|DESTINATION cmake|DESTINATION lib/cmake/libaec|g" CMakeLists.txt
}

build() {
  cd "${srcdir}/libaec-v${pkgver}"
  for _arch in ${_architectures}; do

    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF ..
    make
    popd

    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libaec-v${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "${srcdir}/libaec-v${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
