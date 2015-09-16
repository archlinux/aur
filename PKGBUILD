pkgname=mingw-w64-opencv
pkgver=3.0.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-jasper' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-openexr' 'mingw-w64-libwebp')
makedepends=('mingw-w64-cmake')
source=("https://github.com/Itseez/opencv/archive/${pkgver}.tar.gz")
md5sums=('e6c72f54f7127161b371ef798f34d5c9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

_cmakeopts=('-DCMAKE_SKIP_RPATH=ON'
            '-DENABLE_SSE=0'
            '-DENABLE_SSE2=0'
            '-DCMAKE_BUILD_TYPE=Release'
            '-DBUILD_TESTS=OFF'
            '-DBUILD_DOCS=OFF'
            '-DWITH_FFMPEG=OFF'
            '-DWITH_OPENCL=OFF'
            '-DINSTALL_C_EXAMPLES=0'
            '-DINSTALL_PYTHON_EXAMPLES=0'
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

  # no clue how to fix this one properly
  grep -lr LDBL_EPSILON . | xargs sed -i "s|LDBL_EPSILON|1.08420217248550443401e-19L|g"
  grep -lr DBL_EPSILON . | xargs sed -i "s|DBL_EPSILON|2.2204460492503131E-16|g"
  grep -lr FLT_EPSILON . | xargs sed -i "s|FLT_EPSILON|1.19209290E-07F|g"

}

build() {
  cd "$srcdir/opencv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${_cmakeopts[@]} ..
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
    install -d "$pkgdir"/usr/${_arch}/share/opencv
    install -m644 "$pkgdir"/usr/${_arch}/*.cmake "$pkgdir"/usr/${_arch}/share/opencv
    install -m644 "$pkgdir"/usr/${_arch}/LICENSE "$pkgdir"/usr/${_arch}/share/opencv
    install -d "$pkgdir"/usr/${_arch}/lib/pkgconfig
    install -m644 "$srcdir"/opencv-$pkgver/build-${_arch}/unix-install/opencv.pc \
      "$pkgdir"/usr/${_arch}/lib/pkgconfig/
    rm "$pkgdir"/usr/${_arch}/LICENSE
    rm "$pkgdir"/usr/${_arch}/*.cmake
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

