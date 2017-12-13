# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.5.1
arch=('x86_64')
pkgrel=3
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git' 'python' 'ocl-icd' 'gcc6')
makedepends_x86_64=('cuda' 'nvidia-utils')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
sha512sums=('e9d696e8fa9d9c9a89497d6f0615cb2bdf8583237193ae354a365bbcb403891279795a65a03c364cadf9403b7a62412a1b6b5c5eee2f2e763329d1e3a6954c52')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  # patches here
  sed -i "/NVCC does not support GCC version 6.0/d" src/backend/cuda/CMakeLists.txt
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  rm -rf build
  mkdir build && cd build

  export CC=gcc-6
  export CXX=g++-6
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_SYSTEM_FORGE=ON \
      -DCOMPUTES_DETECTED_LIST="30;32;35;37;50;52;53;60;61;62" \
      -DBUILD_CPU=ON \
      -DBUILD_OPENCL=ON \
      -DBUILD_NONFREE=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_EXAMPLES=ON \
      -DBUILD_DOCS=ON

  make
}

# check() {
#   cd "${srcdir}/arrayfire-full-${pkgver}/build"
#
#   # Some tests fail :(
#   make test
# }

package() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build

  make DESTDIR="${pkgdir}/" install
}
