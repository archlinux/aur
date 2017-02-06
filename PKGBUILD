pkgname=mingw-w64-opencv
pkgver=3.2.0
pkgrel=2
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-jasper' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-openexr' 'mingw-w64-libwebp')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
source=("https://github.com/Itseez/opencv/archive/${pkgver}.tar.gz"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/Itseez/opencv_contrib/archive/$pkgver.tar.gz")
md5sums=('a43b65488124ba33dde195fea9041b70'
         'd7d50c70c31df3b31310f548f31fd2a2')

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

  # error: ‘DBL_EPSILON’ was not declared in this scope
  grep -lr LDBL_EPSILON .| grep -v gch$ | xargs sed -i "s|LDBL_EPSILON|1.08420217248550443401e-19L|g"
  grep -lr DBL_EPSILON . | grep -v gch$ | xargs sed -i "s|DBL_EPSILON|2.2204460492503131E-16|g"
  grep -lr FLT_EPSILON . | grep -v gch$ | xargs sed -i "s|FLT_EPSILON|1.19209290E-07F|g"

}

build() {
  cd "$srcdir/opencv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${_cmakeopts[@]} \
      -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
      ..
    make
    popd
#     mkdir -p build-${_arch}-static && pushd build-${_arch}-static
#     ${_arch}-cmake ${_cmakeopts[@]} \
#       -DBUILD_SHARED_LIBS=OFF \
#       ..
#     make
#     popd
  done
}

package() {
  for _arch in ${_architectures}; do
#     cd "$srcdir/opencv-$pkgver/build-${_arch}-static"
#     make DESTDIR="$pkgdir" install
    cd "$srcdir/opencv-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share/
    install -d "$pkgdir"/usr/${_arch}/lib/pkgconfig
    install -m644 "$srcdir"/opencv-$pkgver/build-${_arch}/unix-install/opencv.pc \
      "$pkgdir"/usr/${_arch}/lib/pkgconfig/
    rm "$pkgdir"/usr/${_arch}/LICENSE
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

