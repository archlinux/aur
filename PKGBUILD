# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname="openpose"
pkgver="1.3.0"
pkgrel="1"
pkgdesc="OpenPose represents the first real-time multi-person system to jointly detect human body, hand, and facial keypoints (in total 135 keypoints) on single images."
arch=("any")
url="https://github.com/CMU-Perceptual-Computing-Lab/openpose"
license=("ACADEMIC OR NON-PROFIT ORGANIZATION NONCOMMERCIAL RESEARCH USE ONLY")
depends=("caffe" "intel-mkl" "libgl" "glu" "lilv" "boost")
makedepends=("cmake" "doxygen" "graphviz" "wget")
source=(
  "https://github.com/CMU-Perceptual-Computing-Lab/openpose/archive/v${pkgver}.tar.gz"
  "GLU.patch"
  "models.patch"
)
sha256sums=(
  "5ef834e603dc207c249f49ba672c8bd1895e5a2ffc0ff5548037402a80398bd0"
  "d2e3ad3dd350e494d1e90d595f6b0d4daa76ed9744f7730c22b1803390f1f021"
  "6dfa55f1876778950ed04cbf98f032c4b4129c56c396209837403398e9815f31"
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "${srcdir}/GLU.patch"
  patch -p1 -i "${srcdir}/models.patch"
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DBUILD_CAFFE:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=ON \
    -DBUILD_DOCS:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DDOWNLOAD_BODY_25_MODEL:BOOL=ON \
    -DDOWNLOAD_BODY_COCO_MODEL:BOOL=ON \
    -DDOWNLOAD_BODY_MPI_MODEL:BOOL=ON \
    -DDOWNLOAD_FACE_MODEL:BOOL=ON \
    -DDOWNLOAD_HAND_MODEL:BOOL=ON \
    -DGPU_MODE:STRING=CPU_ONLY \
    -DWITH_3D_RENDERER:BOOL=ON \
    -DCMAKE_CXX_FLAGS:STRING="-I/opt/intel/compilers_and_libraries_2018.3.222/linux/mkl/include" \
    -DCMAKE_C_FLAGS:STRING="-I/opt/intel/compilers_and_libraries_2018.3.222/linux/mkl/include" \
    -DCaffe_INCLUDE_DIRS:PATH="/usr/include" \
    -DCaffe_LIBS:PATH="/usr/lib/libcaffe.so" \
    -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
    ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"

  # Install libraries.
  make install

  # Install the examples.
  _destdir="$pkgdir/usr/share/OpenPose/examples"
  mkdir -p "$_destdir"
  find "./examples" -type f -executable \
    -not -path './examples/tests/*' \
    -not -path './examples/openpose/*' \
    -exec install -D -m755 '{}' "$_destdir" ';'

  # Install main executable.
  _destdir="$pkgdir/usr/bin"
  mkdir -p "$_destdir"
  install -D -m755 \
    "./examples/openpose/openpose.bin" \
    "$_destdir/openpose"

  cd ..

  # Install documentation.
  _destdir="$pkgdir/usr/share/doc/OpenPose"
  mkdir -p "$(dirname "$_destdir")"
  cp -r "./doc/doxygen/html" "$_destdir"
  find "$_destdir" -type f -exec chmod 644 '{}' ';'

  # Install the models.
  _destdir="$pkgdir/usr/lib/OpenPose"
  cp -r "models" "$_destdir"
  find "$_destdir" -type f -exec chmod 644 '{}' ';'
}
