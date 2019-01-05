# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>
# contributer: yannleretaille <yleretaille at gmail.com>

_basename=opencv
pkgname=lib32-opencv
pkgver=4.0.1
pkgrel=1
pkgdesc="Open Source Computer Vision Library (32-bit)"
arch=('x86_64')
license=('BSD')
url="https://opencv.org"
depends=('lib32-ffmpeg' 'lib32-gst-plugins-base' 'lib32-gtk3' 'lib32-hdf5' 'lib32-intel-tbb'
        'lib32-jasper' 'lib32-libdc1394' 'lib32-libgphoto2' 'lib32-openexr' 'lib32-tesseract' 'opencv')
makedepends=('cmake' 'eigen' 'hdf5' 'lib32-libaec')
source=("$_basename-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('b79ccdc4797a959c5ab17249a8a302c066248ae070e4d7010e2d77a625fdb30a'
            '0d8acbad4b7074cfaafd906a7419c23629179d5e98894714402090b192ef8237')

prepare() {
    mkdir -p build
}

build() {
    cd build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake ../$_basename-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DWITH_OPENCL=ON \
        -DWITH_OPENGL=ON \
        -DWITH_TBB=ON \
        -DOpenGL_GL_PREFERENCE=GLVND \
        -DBUILD_WITH_DEBUG_INFO=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DINSTALL_C_EXAMPLES=OFF \
        -DBUILD_opencv_python2=OFF \
        -DBUILD_opencv_python3=OFF \
        -DINSTALL_PYTHON_EXAMPLES=OFF \
        -DCPU_BASELINE_DISABLE=SSE3 \
        -DCPU_BASELINE_REQUIRE=SSE2 \
        -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
        -DOPENCV_GENERATE_PKGCONFIG=ON \
        -DOPENCV_ENABLE_NONFREE=ON \
        -DZLIB_LIBRARY_RELEASE="/usr/lib32/libz.so" \
        -DHDF5_C_LIBRARY_hdf5="/usr/lib32/libhdf5.so" \
        -DHDF5_C_LIBRARY_sz="/usr/lib32/libsz.so" \
        -DHDF5_C_LIBRARY_z="/usr/lib32/libz.so" \
        -DHDF5_C_LIBRARY_dl="/usr/lib32/libdl.so" \
        -DJPEG_LIBRARY_RELEASE="/usr/lib32/libjpeg.so" \
        -DWEBP_LIBRARY="/usr/lib32/libwebp.so" \
        -DPNG_LIBRARY_RELEASE="/usr/lib32/libpng.so" \
        -DTIFF_LIBRARY_RELEASE="/usr/lib32/libtiff.so" \
        -DJASPER_LIBRARY_RELEASE="/usr/lib32/libjasper.so" \
        -DOPENEXR_IMATH_LIBRARY="/usr/lib32/libImath.so" \
        -DOPENEXR_ILMIMF_LIBRARY="/usr/lib32/libIlmImf.so" \
        -DOPENEXR_IEX_LIBRARY="/usr/lib32/libIex.so" \
        -DOPENEXR_HALF_LIBRARY="/usr/lib32/libHalf.so" \
        -DOPENEXR_ILMTHREAD_LIBRARY="/usr/lib32/libIlmThread.so"

    make
}

package() {
    cd build

    make DESTDIR="$pkgdir" install

    rm -r "$pkgdir/usr/bin"
    rm -r "$pkgdir/usr/include"
    rm -r "$pkgdir/usr/share"

    install -Dm644 "$srcdir/$_basename-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
