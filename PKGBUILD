# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-opencv
pkgver=3.4.2
pkgrel=1
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-libwebp' 'mingw-w64-lapack' 'mingw-w64-cblas')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-lapacke')
source=("https://github.com/Itseez/opencv/archive/${pkgver}.tar.gz"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/Itseez/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('81dbd5e7e9f8a4c936b94629bf4765745942a1d634ae38ec08bc57b73b28ffc5'
            '45a52764ebd2558fa0b7fd8dc47379b37dd0956d912abbf7c786228374fdf60d')

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
    sed -i "s/\/\/usr\/${_arch}\/lib/\/lib/g" ./unix-install/opencv.pc
    sed -i "s/^Libs.private.*/& -lgdi32 -lcomdlg32/" ./unix-install/opencv.pc
    echo "Requires.private: libjpeg libtiff-4 libpng libwebp lapack cblas" >> ./unix-install/opencv.pc
    install -m644 ./unix-install/opencv.pc "$pkgdir"/usr/${_arch}/lib/pkgconfig/
    rm "$pkgdir"/usr/${_arch}/LICENSE
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/static"
  done
}

# vim: ts=2 sw=2 et:
