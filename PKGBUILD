# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=openpose
pkgver=1.7.0
pkgrel=2
pkgdesc='OpenPose: Real-time multi-person keypoint detection library for body, face, hands, and foot estimation'
arch=('x86_64')
url='https://github.com/CMU-Perceptual-Computing-Lab/openpose'
license=("ACADEMIC OR NON-PROFIT ORGANIZATION NONCOMMERCIAL RESEARCH USE ONLY")
depends=('caffe' 'libgl' 'glu' 'glut' 'qt5-base')
makedepends=('cmake' 'doxygen' 'graphviz' 'wget' 'boost')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('178876507c11dab3da2fcd68c748d90b')

prepare() {
  mkdir -p openpose-$pkgver
  cd openpose-$pkgver
  find ./ -name "*.hpp" | xargs -n1 sed -i "s|models/|/usr/lib/OpenPose/models/|g"
}

build() {
  cd "${pkgname}-${pkgver}"
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
    -DCaffe_INCLUDE_DIRS:PATH="/usr/include" \
    -DCaffe_LIBS:PATH="/usr/lib/libcaffe.so" \
    -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" \
    ..
  make
}

package() {
  # Install libraries
  cd "${pkgname}-${pkgver}/build"
  make install

  # Install the examples
  _destdir="${pkgdir}/usr/share/OpenPose/examples"
  mkdir -p "${_destdir}"
  find "./examples" -type f -executable \
    -not -path './examples/tests/*' \
    -not -path './examples/openpose/*' \
    -exec install -D -m755 '{}' "${_destdir}" ';'

  # Install main executable
  _destdir="${pkgdir}/usr/bin"
  mkdir -p "${_destdir}"
  install -D -m755 \
    "./examples/openpose/openpose.bin" \
    "${_destdir}/openpose"
  cd ..

  # Install documentation
  _destdir="${pkgdir}/usr/share/doc/OpenPose"
  mkdir -p "$(dirname "${_destdir}")"
  cp -r "./doc/doxygen/html" "${_destdir}"
  find "${_destdir}" -type f -exec chmod 644 '{}' ';'

  # Install the models
  _destdir="${pkgdir}/usr/lib/OpenPose"
  cp -r "models" "${_destdir}"
  find "${_destdir}" -type f -exec chmod 644 '{}' ';'
}
