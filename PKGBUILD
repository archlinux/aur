# Maintainer: Simon Hofmann <mail@simon-hofmann.org>
#
# Based on official OpenCV package by:
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=('opencv-contrib' 'opencv-samples-contrib')
pkgver=3.1.0
pkgrel=2
pkgdesc="Open Source Computer Vision Library including additional 'contrib' modules"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
depends=('intel-tbb' 'openexr' 'xine-lib' 'libdc1394' 'gtkglext')
makedepends=('cmake' 'python2-numpy' 'python-numpy' 'mesa' 'eigen')
optdepends=('eigen'
            'libcl: For coding with OpenCL'
            'python-numpy: Python 3.x interface'
            'python2-numpy: Python 2.x interface')

source=("${pkgname%-contrib}-$pkgver::https://github.com/Itseez/opencv/archive/$pkgver.zip"
        "${pkgname%-contrib}-$pkgver-contrib::https://github.com/Itseez/opencv_contrib/archive/$pkgver.zip")

md5sums=('6082ee2124d4066581a7386972bfd52a'
         '0d0bfeabe539542791b465ec1c7c90e6')

_cmakeopts=('-D WITH_OPENCL=ON'
            '-D WITH_OPENGL=ON'
            '-D WITH_TBB=ON'
            '-D WITH_XINE=ON'
            '-D WITH_GSTREAMER=OFF'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=ON'
            '-DBUILD_opencv_python2=ON',
            '-DBUILD_opencv_python3=ON',
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D CMAKE_SKIP_RPATH=ON'
# Settings for neural network module'
            '-D BUILD_opencv_dnn=ON'
            '-D BUILD_LIBPROTOBUF_FROM_SOURCES=ON')


# SSE only available from Pentium 3 onwards (i686 is way older)
[[ "$CARCH" = 'i686' ]] && \
  _cmakeopts+=('-D ENABLE_SSE=OFF'
               '-D ENABLE_SSE2=OFF'
               '-D ENABLE_SSE3=OFF')

# all x64 CPUs support SSE2 but not SSE3
[[ "$CARCH" = 'x86_64' ]] && _cmakeopts+=('-D ENABLE_SSE3=OFF')

build() {
  cd "$srcdir/${pkgname%-contrib}-$pkgver"

  #Add contrib modules
  _cmakeopts+=("-D OPENCV_EXTRA_MODULES_PATH=$srcdir/${pkgname%-contrib}_contrib-${pkgver}/modules $srcdir/${pkgname%-contrib}-$pkgver")

  cmake ${_cmakeopts[@]} .

  make
}

package_opencv-contrib() {
  options=('staticlibs')
  provides=('opencv')
  conflicts=('opencv')

  cd "$srcdir/${pkgname%-contrib}-$pkgver"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir/${pkgname%-contrib}-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname%-contrib}/LICENSE"

  cd "$pkgdir/usr/share"

  # separate samples package; also be -R friendly
  if [[ -d OpenCV/samples ]]; then
    mv OpenCV/samples "$srcdir/${pkgname%-contrib}-samples"
    mv OpenCV ${pkgname%-contrib} # otherwise folder naming is inconsistent
  elif [[ ! -d OpenCV ]]; then
    warning "Directory naming issue; samples package may not be built!"
  fi
}

package_opencv-samples-contrib() {
  pkgdesc+=" (samples)"
  depends=("opencv-contrib=$pkgver") # sample codes change with lib/API
  provides=('opencv-samples')
  conflicts=('opencv-samples')
  unset optdepends

  mkdir -p "$pkgdir/usr/share/opencv"
  cp -r "$srcdir/opencv-samples" "$pkgdir/usr/share/opencv/samples"
  #Copy contrib samples
  cp -rf "$srcdir/${pkgname%-samples-contrib}_contrib-${pkgver}/samples" "$pkgdir/usr/share/opencv/samples"

  # install license file
  install -Dm644 "$srcdir/opencv-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname%-contrib}/LICENSE"
}

# vim:set ts=2 sw=2 et:
