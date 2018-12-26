# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-opencv
pkgver=4.0.1
pkgrel=1
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-libwebp' 'mingw-w64-lapack' 'mingw-w64-cblas')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-lapacke')
source=("opencv-$pkgver.zip::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('b79ccdc4797a959c5ab17249a8a302c066248ae070e4d7010e2d77a625fdb30a'
            '0d8acbad4b7074cfaafd906a7419c23629179d5e98894714402090b192ef8237')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

_cmakeopts=('-DCMAKE_SKIP_RPATH=ON'
            '-DBUILD_TESTS=OFF'
            '-DBUILD_PERF_TESTS=OFF'
            '-DBUILD_DOCS=OFF'
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
            '-DWITH_OPENEXR=OFF'
            '-DWITH_JASPER=OFF'
            '-DWITH_DSHOW=OFF')

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
      ..
    make
    popd

    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-cmake ${_cmakeopts[@]} \
      -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
      -DLAPACK_LIBRARIES="/usr/${_arch}/bin/liblapack.dll;/usr/${_arch}/bin/libblas.dll;/usr/${_arch}/bin/libcblas.dll" \
      -DLAPACK_CBLAS_H="/usr/${_arch}/include/cblas.h" \
      -DLAPACK_LAPACKE_H="/usr/${_arch}/include/lapacke.h" \
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
    # fix paths
    sed -i "s/\/\/usr\/${_arch}\/lib/\/lib/g" ./unix-install/opencv4.pc
    # fix static builds. To be able to static build lapack.pc should be fixed too
    # adding Libs.private: -lgfortran -lquadmath
    sed -i "s/^Libs.private.*/& -lgdi32 -lcomdlg32/" ./unix-install/opencv4.pc
    echo "Requires.private: libjpeg libtiff-4 libpng libwebp lapack cblas" >> ./unix-install/opencv4.pc
    # remove nonexistent include dir
    sed -i "/^Cflags.*/ s/-I\${includedir_old}//g" ./unix-install/opencv4.pc
    install -m644 ./unix-install/opencv4.pc "$pkgdir"/usr/${_arch}/lib/pkgconfig/
    rm "$pkgdir"/usr/${_arch}/LICENSE
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/static"
  done
}

# vim: ts=2 sw=2 et:
