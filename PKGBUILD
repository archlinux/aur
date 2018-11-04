# Maintainer: Darcy Hu <hot123tea123@gmail.com>
# Contributor: Joshua Schüler <joshua.schueler at gmail dotcom>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>


############################################
# Here you have the option to use some CPU
# extensions to speed up opencv
# Only change this if you know what you
# are doing!
############################################

# Use `cat /proc/cpuinfo` to see the extensions your CPU supports

_FORCE_SSE=OFF      # always ON on x64
_FORCE_SSE2=OFF     # always ON on x64

# Set to ON on CPUs newer than approx. 2005
_FORCE_SSE3=OFF

# Set to ON on CPUs since Intel Core 2 or newer/AMD Bulldozer/AMD Fusion
_FORCE_SSSE3=OFF    # also known as SSE4

# Set to ON on CPUs since Intel Core 2 Penryn (older than Nehalem or Sandybridge)
# or on AMDs since K10 (approx. 2009)
_FORCE_SSE41=OFF

# Set to ON on nearly all Intel Core i or AMD since Bulldozer
_FORCE_SSE42=OFF

# Set to ON on Sandybridge or newer/Bulldozer or newer
_FORCE_AVX=OFF

# Set to ON on Haswell or newer
_FORCE_AVX2=OFF

############################################

pkgbase=opencv2-opt
pkgname=('opencv2-opt' 'opencv2-opt-samples')
pkgver=2.4.13.6
pkgrel=2
_pkgbase=opencv2
_pkgname=opencv
pkgdesc="Open Source Computer Vision Library (Legacy Version & /opt directory version)"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
depends=('intel-tbb' 'openexr' 'xine-lib' 'libdc1394' 'gtkglext')
makedepends=('cmake' 'python2-numpy' 'mesa' 'eigen2')
optdepends=('opencv2-opt-samples'
            'eigen2'
            'libcl: For coding with OpenCL'
            'python2-numpy: Python 2.x interface')

source=(
  "$_pkgname-$pkgver.zip::https://github.com/Itseez/opencv/archive/$pkgver.zip"
  'fix-java-lib-path.patch'
)
sha512sums=('942a523192ac790bc8184dff3b7652efd92dfe786091402a7686a468ae567e1c09b9205e6c56424602a887057a57c31a0b0e4f4f9ca29c1b1856024b8d9ad990'
            '111d2f8407a3937acabd8c60f7d77408aadf9d8acf621ddb2b4312f39155ce14d6c764e7ac36905c90eb279bf7803e30def39e52807adb7516325b7c3adac65e')

_cmakeopts=('-D WITH_CUDA=OFF' # Disable CUDA for now because GCC 6.1.1 and nvcc don't play along yet
            '-D WITH_OPENCL=ON'
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
            "-D CMAKE_INSTALL_PREFIX=/opt/$_pkgbase"
            '-D CMAKE_SKIP_RPATH=ON')

# SSE only available from Pentium 3 onwards (i686 is way older)
[[ "$CARCH" = 'i686' ]] && \
  _cmakeopts+=("-D ENABLE_SSE=$_FORCE_SSE"
               "-D ENABLE_SSE2=$_FORCE_SSE2"
               "-D ENABLE_SSE3=$_FORCE_SSE3")

# all x64 CPUs support SSE2 but not SSE3
[[ "$CARCH" = 'x86_64' ]] && \
  _cmakeopts+=("-D ENABLE_SSE3=$_FORCE_SSE3"
               "-D ENABLE_SSSE4=$_FORCE_SSSE3" #(sic!)
               "-D ENABLE_SSE41=$_FORCE_SSE41"
               "-D ENABLE_SSE42=$_FORCE_SSE42"
               "-D ENABLE_AVX=$_FORCE_AVX"
               "-D ENABLE_AVX2=$_FORCE_AVX2")

prepare() {
  cd $_pkgname-$pkgver
# https://stackoverflow.com/questions/46884682/error-in-building-opencv-with-ffmpeg
  sed "1i\#define AVFMT_RAWPICTURE 0x0020" -i modules/highgui/src/cap_ffmpeg_impl.hpp
  sed "1i\#define CODEC_FLAG_GLOBAL_HEADER AV_CODEC_FLAG_GLOBAL_HEADER" -i modules/highgui/src/cap_ffmpeg_impl.hpp
  sed "1i\#define AV_CODEC_FLAG_GLOBAL_HEADER (1 << 22)" -i modules/highgui/src/cap_ffmpeg_impl.hpp
  patch -Np1 -i ${srcdir}/fix-java-lib-path.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p build
  cd build

  cmake ${_cmakeopts[@]} ..
  make
}
package_opencv2-opt() {
  options=('staticlibs')
  provides=(opencv2)

  cd "$srcdir/$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 $pkgdir/usr/lib/pkgconfig
  cd $pkgdir/usr/lib/pkgconfig
  ln -s /opt/$_pkgbase/lib/pkgconfig/opencv.pc opencv2.pc
  ln -s /opt/$_pkgbase/lib/pkgconfig/opencv.pc opencv2-opt.pc

  cd "$pkgdir/opt/$_pkgbase/share"
  # separate samples package; also be -R friendly
  if [[ -d OpenCV/samples ]]; then
    mkdir -p $_pkgbase
    mv OpenCV/samples "$srcdir/$_pkgbase-samples"
    mv OpenCV/* $_pkgbase # otherwise folder naming is inconsistent
  elif [[ ! -d OpenCV ]]; then
    warning "Directory naming issue; samples package may not be built!"
  fi
}
package_opencv2-opt-samples() {
  pkgdesc+=" (samples)"
  depends=("opencv2-opt=$pkgver") # sample codes change with lib/API
  unset optdepends
  provides=(opencv2-samples)

  cd "$srcdir/$_pkgname-$pkgver/build"
  install -dm755 "$pkgdir/opt/$_pkgbase"
  cp -r samples "$pkgdir/opt/$_pkgbase"

  # install license file
  install -Dm644 "../LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
