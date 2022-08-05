# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-opencv
pkgver=4.6.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-libwebp' 'mingw-w64-lapack' 'mingw-w64-cblas' 'mingw-w64-openjpeg2')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-lapacke')
source=("opencv-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.tar.gz"
  "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz"
  "0105-wechat-iconv-dependency.patch"
  "0012-make-header-usable-with-C-compiler.patch"
  "0008-mingw-w64-cmake-lib-path.patch"
  "0010-find-libpng-header.patch")
sha256sums=('1ec1cba65f9f20fe5a41fda1586e01c70ea0c9a6d7b67c9e13edf0cfe2239277'
  '1777d5fd2b59029cf537e5fd6f8aa68d707075822f90bde683fcde086f85f7a7'
  '3cf6a17b234ddf4f20e042acce329823e970aa06873d63652fa132c46ee56739'
  '9f918a974e9d5227fce3702b1f38716a7fb79586dda9256b5df44dcc0f858c3b'
  '7398e66f80be37382bd427b5eb3a1201a23113c14e71435a44df8779ea1b8a34'
  'd6ad5a0865eefe662ca4c7aceb6aa7b1fd5fcd27e1e65ca839d442f054095e69')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

_cmakeopts=('-DCMAKE_SKIP_RPATH=ON'
            '-DBUILD_TESTS=OFF'
            '-DBUILD_PERF_TESTS=OFF'
            '-DBUILD_DOCS=OFF'
            '-DBUILD_WITH_DEBUG_INFO=OFF'
            '-DBUILD_opencv_apps=OFF'
            '-DWITH_FFMPEG=OFF'
            '-DWITH_GSTREAMER=OFF'
            '-DWITH_OPENCL=OFF'
            '-DWITH_QT=OFF'
            '-DINSTALL_C_EXAMPLES=OFF'
            '-DINSTALL_PYTHON_EXAMPLES=OFF'
            '-DBUILD_ZLIB=OFF'
            '-DBUILD_TIFF=OFF'
            '-DBUILD_JASPER=OFF'
            '-DBUILD_JPEG=OFF'
            '-DBUILD_PNG=OFF'
            '-DBUILD_WEBP=OFF'
            '-DBUILD_OPENEXR=OFF'
            '-DWITH_VTK=OFF'
            '-DWITH_IPP=OFF'
            '-DWITH_DSHOW=OFF'
            '-DWITH_EIGEN=ON'
            '-DOPENCV_GENERATE_PKGCONFIG=ON'
            '-DOPENCV_GENERATE_SETUPVARS=OFF')

prepare() {
  patch -d $srcdir/opencv-$pkgver -p1 < 0008-mingw-w64-cmake-lib-path.patch
  patch -d $srcdir/opencv-$pkgver -p1 < 0010-find-libpng-header.patch 
  patch -d $srcdir/opencv-$pkgver -p1 < 0012-make-header-usable-with-C-compiler.patch 
  patch -d $srcdir/opencv_contrib-$pkgver -p1 < 0105-wechat-iconv-dependency.patch 
}

build() {
  cd "$srcdir/opencv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
    ${_arch}-cmake ${_cmakeopts[@]} \
      -DBUILD_SHARED_LIBS=OFF \
      -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
      -DLAPACK_LIBRARIES="/usr/${_arch}/bin/liblapack.dll;/usr/${_arch}/bin/libblas.dll;/usr/${_arch}/bin/libcblas.dll" \
      -DLAPACK_CBLAS_H="/usr/${_arch}/include/cblas.h" \
      -DLAPACK_LAPACKE_H="/usr/${_arch}/include/lapacke.h" \
      -DEIGEN_INCLUDE_PATH="/usr/${_arch}/include/eigen3" \
      ..
    make
    popd

    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-cmake ${_cmakeopts[@]} \
      -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
      -DLAPACK_LIBRARIES="/usr/${_arch}/bin/liblapack.dll;/usr/${_arch}/bin/libblas.dll;/usr/${_arch}/bin/libcblas.dll" \
      -DLAPACK_CBLAS_H="/usr/${_arch}/include/cblas.h" \
      -DLAPACK_LAPACKE_H="/usr/${_arch}/include/lapacke.h" \
      -DEIGEN_INCLUDE_PATH="/usr/${_arch}/include/eigen3" \
      -DOPENCV_GENERATE_PKGCONFIG=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/opencv-$pkgver/build-${_arch}-shared"
    make DESTDIR="$pkgdir" install
    make -C "$srcdir/opencv-$pkgver/build-${_arch}-static" DESTDIR="$pkgdir/static" install
    mv "$pkgdir/static/usr/${_arch}/lib/"*.a "$pkgdir/usr/${_arch}/lib/"
 
    install -d "$pkgdir"/usr/${_arch}/lib/pkgconfig
    install -d "$pkgdir"/usr/${_arch}/lib/cmake/opencv4
    install -m644 ./unix-install/opencv4.pc "$pkgdir"/usr/${_arch}/lib/pkgconfig/
    # fix paths
    sed -i "s/\/\/usr\/${_arch}\/lib/\/lib/g" ./unix-install/opencv4.pc
    # fix static builds. To be able to static build lapack.pc should be fixed too
    # adding Libs.private: -lgfortran -lquadmath
    sed -i "s/^Libs.private.*/& -lgdi32 -lcomdlg32/" ./unix-install/opencv4.pc
    echo "Requires.private: libjpeg libtiff-4 libpng libwebp lapack cblas" >> ./unix-install/opencv4.pc
    rm "$pkgdir"/usr/${_arch}/LICENSE
    # fix cmake INSTALL_PATH
    sed -i "s/^get_filename_component(OpenCV_INSTALL_PATH.*/get_filename_component(OpenCV_INSTALL_PATH \"\$\{OpenCV_CONFIG_PATH\}\/..\/..\/..\/\" REALPATH)/g" ./unix-install/OpenCVConfig.cmake
    install -m644 ./unix-install/OpenCVConfig.cmake "$pkgdir"/usr/${_arch}/lib/cmake/opencv4
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/static"
  done
}

# vim: ts=2 sw=2 et:
