pkgname=mingw-w64-jasper
pkgver=2.0.10
pkgrel=1
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (mingw-w64)"
arch=(any)
url="http://www.ece.uvic.ca/~mdadams/jasper"
license=("custom:JasPer2.0")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-libjpeg-turbo')
options=(staticlibs !strip !buildflags)
source=("https://github.com/mdadams/jasper/archive/version-${pkgver}.tar.gz"
"jasper-1.900.1-fix-filename-buffer-overflow.patch")
sha1sums=('4818a48d370fc04719dc236c4a9405c8e622856c'
          '6708fdd45d57def32d15b1343044b79c370b9584')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/jasper-version-$pkgver"
  patch -p1 -i "${srcdir}/jasper-1.900.1-fix-filename-buffer-overflow.patch"
}

build() {
  cd "$srcdir/jasper-version-$pkgver"
  local options=(
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_BUILD_TYPE=Release
    -DJAS_ENABLE_OPENGL=OFF
    -DJAS_ENABLE_LIBJPEG=ON
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF
  )
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/jasper-version-${pkgver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/jasper-version-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
