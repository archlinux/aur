# Maintainer(?): Score_Under <seejay.11@gmail.com>

# This is the last thing I want to be maintaining, but as long as arch isn't
# gentoo and as long as hydrus dev still uses ancient technology, it looks like
# this is my lot in life.

# Following upstream package opencv:
#    Maintainer: Ray Rashif <schiv@archlinux.org>
#    Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=opencv-with-python2-support
pkgname=(opencv-with-python2-support opencv-with-python2-support-samples)
pkgver=4.0.0
pkgrel=4
pkgdesc="Open Source Computer Vision Library"
arch=(x86_64)
license=(BSD)
url="http://opencv.org/"
depends=(intel-tbb openexr gst-plugins-base libdc1394 cblas lapack libgphoto2 jasper ffmpeg)
makedepends=(cmake python-numpy python2-numpy python-setuptools python2-setuptools mesa eigen hdf5 lapacke gtk3 vtk glew)
optdepends=('opencv-samples: samples'
            'gtk3: for the HighGUI module'
            'vtk: for the viz module'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python interface')
source=("opencv-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('86fd08fc02893e05e2944fa7b0daa7d02643232450f020b475e1b2f24587b99a'
            '4fb0681414df4baedce6e3f4a01318d6f4fcde6ee14854d761fd4e397a397763')

prepare() {
  mkdir -p build
  case " $CFLAGS $CPPFLAGS $CXXFLAGS " in
    *" -O3 "*|*" -Ofast "*)
      warning "OpenCV takes a very long time to build at high optimisation levels."
      warning "Try building at -O2 or lower, or building with clang."
      ;;
  esac
}

build() {
  cd build
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
    -DOPENCV_GENERATE_PKGCONFIG=ON
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

  # install missing headers https://github.com/opencv/opencv/issues/13201
  for _module in imgcodecs videoio photo; do
    cp -r "$srcdir"/opencv-$pkgver/modules/$_module/include/opencv2/$_module/legacy \
      "$pkgdir"/usr/include/opencv4/opencv2/$_module
  done
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
