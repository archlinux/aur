# Maintainer(?): Score_Under <seejay.11@gmail.com>
# Following upstream package opencv:
#    Maintainer: Ray Rashif <schiv@archlinux.org>
#    Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=opencv-with-python2-support
pkgname=(opencv-with-python2-support opencv-with-python2-support-samples)
pkgver=4.1.0
pkgrel=2
pkgdesc="Open Source Computer Vision Library"
arch=(x86_64)
license=(BSD)
url="https://opencv.org/"
depends=(intel-tbb openexr gst-plugins-base libdc1394 cblas lapack libgphoto2 jasper ffmpeg)
makedepends=(cmake python-numpy python2-numpy python-setuptools python2-setuptools mesa eigen hdf5 lapacke gtk3 vtk glew ant java-environment)
optdepends=('opencv-samples: samples'
            'gtk3: for the HighGUI module'
            'vtk: for the viz module'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python interface'
            'java-runtime: Java interface')
source=("opencv-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz"
        opencv-includedir.patch)
sha256sums=('2c75b129da2e2c8728d168b7bf14ceca2da0ebe938557b109bae6742855ede13'
            'e7d775cc0b87b04308823ca518b11b34cc12907a59af4ccdaf64419c1ba5e682'
            'a96e35c9592e655b21a62cfe04e864a10e21535ad900e5de67356b9e9f40ca10')

prepare() {
  mkdir -p build

  cd opencv-$pkgver
  patch -p1 -i ../opencv-includedir.patch # Fix wrong include patch in pkgconfig file

  case " $CFLAGS $CPPFLAGS $CXXFLAGS " in
    *" -O3 "*|*" -Ofast "*)
      warning "OpenCV takes a very long time to build at high optimisation levels."
      warning "Try building at -O2 or lower, or building with clang."
      ;;
  esac
}

build() {
  cd build
  export JAVA_HOME="/usr/lib/jvm/default"
  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  _python3path=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  _python2path=`python2 -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cmake ../opencv-$pkgver \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCPU_BASELINE_DISABLE=SSE3 \
    -DCPU_BASELINE_REQUIRE=SSE2 \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DOPENCV_SKIP_PYTHON_LOADER=ON \
    -DOPENCV_PYTHON3_INSTALL_PATH=$_python3path \
    -DOPENCV_PYTHON2_INSTALL_PATH=$_python2path \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DOPENCV_JNI_INSTALL_PATH=lib
  make
}

package_opencv-with-python2-support() {
  conflicts=(opencv)
  provides=("opencv=$pkgver")

  cd build
  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir"/opencv-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/opencv

  # separate samples package
  cd "$pkgdir"/usr/share
  mv opencv4/samples "$srcdir"/opencv-samples
}

package_opencv-with-python2-support-samples() {
  pkgdesc+=" (samples)"
  depends=("opencv=$pkgver")
  conflicts=(opencv-samples)
  provides=("opencv-samples=$pkgver")
  unset optdepends

  mkdir -p "$pkgdir"/usr/share/opencv
  cp -r "$srcdir"/opencv-samples "$pkgdir"/usr/share/opencv/samples
  # fix permissions
  chmod 755 "$pkgdir"/usr/share/opencv/samples/*

  # install license file
  install -Dm644 "$srcdir"/opencv-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/opencv-samples
}
