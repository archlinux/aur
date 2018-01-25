# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Official Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

# Based on the official opencv PKGBUILD

pkgname=opencv-java
_pkgbase=opencv
pkgver=3.4.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library - Java bindings"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
depends=(
    "opencv>=$pkgver"
    'java-runtime'
    )
makedepends=(
    'cmake'
    'python-numpy'
    'python2-numpy'
    'mesa'
    'eigen'
    # Needed for the Java binding
    'apache-ant'
    'java-environment'
)
optdepends=(
    'opencv-samples'
)
# Sources and checksums section
source=(
    "${_pkgbase}-${pkgver}.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.tar.gz"
    "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz"
)
sha256sums=('678cc3d2d1b3464b512b084a8cca1fad7de207c7abdf2caa1fed636c13e916da'
            '699ab3eee7922fbd3e8f98c68e6d16a1d453b20ef364e76172e56466dc9c16cd')

# CMake flags
_cmakeopts=('-D WITH_OPENCL=ON'
            '-D WITH_OPENGL=ON'
            '-D WITH_TBB=ON'
            '-D WITH_XINE=ON'
            '-D WITH_GSTREAMER=OFF'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=ON'
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D CMAKE_INSTALL_LIBDIR=lib'
            '-D CMAKE_SKIP_RPATH=ON'
            )

# SSE only available from Pentium 3 onwards (i686 is way older)
[[ "$CARCH" = 'i686' ]] && _cmakeopts+=('-D CPU_BASELINE_DISABLE=SSE2')
[[ "$CARCH" = 'x86_64' ]] && _cmakeopts+=('-D CPU_BASELINE_DISABLE=SSE3 -D CPU_BASELINE_REQUIRE=SSE2')

# prepare() and build() are the official ones
prepare() {
    # Setting JAVA_HOME
    msg2 "Setting JAVA_HOME variable"
    export JAVA_HOME="/usr/lib/jvm/default"
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ${_cmakeopts[@]} \
        -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
        -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
        -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
        -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    ../$_pkgbase-$pkgver

    # Build everything, we will fix things in package step
    make
}

# Changed in order to save just Java files
# It's a bit dirty, but it works
package() {

    # Entering in the source directory
    cd "$srcdir/build"

    # Making a fake install
    mkdir -p "$srcdir/temp"
    make DESTDIR="$srcdir/temp" install

    # Creating the package structure
    mkdir -p "$pkgdir/usr/share/opencv/java"
    # Installing the built files
    cp -r "$srcdir/temp/usr/share/OpenCV/java" "$pkgdir/usr/share/opencv"

    # Create a symbolic link in /usr/share/java as Java apps written for Ubuntu may be looking there
    mkdir -p "$pkgdir/usr/share/java/"
    # Get the number in the Jar filename
    _number=$(echo $pkgver | sed 's/\.//g')
    #_number=$(echo $pkgver | sed 's/\.[0-9]$//' | sed 's/\.//g')
    ln -s "/usr/share/opencv/java/opencv-$_number.jar" "$pkgdir/usr/share/java/opencv.jar"
}
