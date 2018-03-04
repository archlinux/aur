pkgname=mingw-w64-opencv
pkgver=3.4.1
pkgrel=1
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-jasper' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-openexr' 'mingw-w64-libwebp')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
source=("https://github.com/Itseez/opencv/archive/${pkgver}.tar.gz"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/Itseez/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('f1b87684d75496a1054405ae3ee0b6573acaf3dad39eaf4f1d66fdd7e03dc852'
            '298c69ee006d7675e1ff9d371ba8b0d9e7e88374bb7ba0f9d0789851d352ec6e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

_cmakeopts=('-DCMAKE_SKIP_RPATH=ON'
            '-DCMAKE_BUILD_TYPE=Release'
            '-DBUILD_TESTS=OFF'
            '-DBUILD_PERF_TESTS=OFF'
            '-DBUILD_DOCS=OFF'
            '-DBUILD_opencv_apps=OFF'
            '-DWITH_FFMPEG=OFF'
            '-DWITH_GSTREAMER=OFF'
            '-DWITH_OPENCL=OFF'
            '-DINSTALL_C_EXAMPLES=OFF'
            '-DINSTALL_PYTHON_EXAMPLES=OFF'
            '-DBUILD_ZLIB=OFF'
            '-DBUILD_TIFF=OFF'
            '-DBUILD_JASPER=OFF'
            '-DBUILD_JPEG=OFF'
            '-DBUILD_PNG=OFF'
            '-DBUILD_OPENEXR=OFF'
            '-DWITH_VTK=OFF'
            '-DWITH_IPP=OFF'
            '-DWITH_DSHOW=OFF')

prepare() {
  cd "$srcdir/opencv-$pkgver"
}

build() {
  cd "$srcdir/opencv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${_cmakeopts[@]} \
      -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
      -DLAPACK_LIBRARIES="/usr/${_arch}/lib/liblapack.dll.a;/usr/${_arch}/lib/libblas.dll.a;/usr/${_arch}/lib/libcblas.dll.a" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/opencv-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir"/usr/${_arch}/lib/pkgconfig
    install -m644 ./unix-install/opencv.pc "$pkgdir"/usr/${_arch}/lib/pkgconfig/
    rm "$pkgdir"/usr/${_arch}/LICENSE
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

