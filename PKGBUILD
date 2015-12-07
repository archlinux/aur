# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='http://arrayfire.com'
pkgver=3.2.0
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git')
makedepends_x86_64=('cuda' 'nvidia-utils')
depends=('cblas' 'fftw' 'boost-libs' 'lapack' 'forge' 'freeimage' 'glfw' 'glew')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
source=(http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2)
md5sums=('0dc2dd8188b0cd60baeeef214cbe68c4')

check() {
  cd "${srcdir}/arrayfire-full-${pkgver}/build"

  #make test
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}/"

  rm -rf build
  mkdir build && cd build

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_SYSTEM_FORGE=ON \
      -DCOMPUTES_DETECTED_LIST="20;30;32;35;50;52;53" \
      -DBUILD_CPU=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_EXAMPLES=ON \
      -DBUILD_DOCS=ON

  make
}

package() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build

  make DESTDIR="${pkgdir}/" install
}
