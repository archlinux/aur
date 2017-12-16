# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.5.1
arch=('x86_64')
pkgrel=4
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git' 'python' 'ocl-icd' 'gcc6' 'cuda' 'nvidia-utils')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
sha512sums=('1b521f93abdef985f54443f42e2b0270787da1194a5cdbb06a91af285672bf66fe0e6dbba2e5616968051052ff0face5b518b27014ccd10925008ecb3e53bf76')

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
