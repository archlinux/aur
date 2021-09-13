# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv-cuda
pkgver=4.5.3
pkgrel=2
provides=(opencv opencv-samples)
conflicts=(opencv opencv-samples)
pkgdesc="Open Source Computer Vision Library with CUDA support"
arch=(x86_64)
license=(BSD)
url="http://opencv.org/"
options=(staticlibs)
depends=(intel-tbb openexr gst-plugins-base libdc1394 cblas lapack libgphoto2 jasper cuda cudnn)
makedepends=(cmake python-numpy python2-numpy mesa ninja eigen hdf5 lapacke gtk3 nvidia-sdk)
optdepends=('opencv-samples: samples'
            'gtk3: for the HighGUI module'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python 3 interface'
            'python2-numpy: Python 2 interface')
source=("opencv-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz"
	"https://raw.githubusercontent.com/archlinux/svntogit-packages/29adf974618f75894f9b03e1519281a5e0c8824e/trunk/opencv-lapack-3.10.patch")
sha256sums=('a61e7a4618d353140c857f25843f39b2abe5f451b018aab1604ef0bc34cd23d5'
            '73da052fd10e73aaba2560eaff10cc5177e2dcc58b27f8aedf7c649e24c233bc'
            'f83c64f2731a39910d0d4a48898dd04e4aca5c22f746b7b0ead003992ae11199')

prepare() {
  msg2 "Patching sources for CUDA v10"
  sed -i 's|nvcuvid.h|nvidia-sdk/nvcuvid.h|' opencv_contrib-$pkgver/modules/cud*/src/*.hpp

  # See https://github.com/opencv/opencv/issues/19846
  msg2 "Patching sources for lapack 3.10.0"
  patch -d opencv-$pkgver -p1 < opencv-lapack-3.10.patch

  mkdir -p build
}

build() {
  cd build

  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cmake ../opencv-$pkgver \
    -GNinja \
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
    -DWITH_NVCUVID=ON \
    -DWITH_CUDA=ON \
    -DWITH_CUDNN=ON \
    -DCUDA_FAST_MATH=ON \
    -DWITH_CUBLAS=ON \
    -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DOPENCV_SKIP_PYTHON_LOADER=ON \
    -DEIGEN_INCLUDE_PATH=/usr/include/eigen3 \
    -DOPENCV_PYTHON3_INSTALL_PATH=$_pythonpath \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    -DOPENCV_GENERATE_PKGCONFIG=ON
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install

  # install license file
  install -Dm644 "$srcdir"/opencv-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  cd "$pkgdir"/usr/share

  # separate samples package; also be -R friendly
  if [[ -d opencv4/samples ]]; then
    mv opencv4 $pkgname # otherwise folder naming is inconsistent
  elif [[ ! -d opencv4 ]]; then
    warning "Directory naming issue; samples package may not be built!"
  fi
}
