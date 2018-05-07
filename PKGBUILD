# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.6.0
arch=('x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git' 'python' 'ocl-icd' 'cuda' 'nvidia-utils')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
sha512sums=('7d651a29c3ba927a3d6b8d1c461fe21e55bae2a988970c46353a2934855db1c8e150d20763faaccbac2a028b4cb6b19b61bbf3709a1052d8081f34637e686d8b')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  rm -rf build
  mkdir build && cd build

  export CC=gcc-5
  export CXX=g++-5
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

check() {
  cd "${srcdir}/arrayfire-full-${pkgver}/build"

  # Some tests fail :(
  make test
}

package() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build

  make DESTDIR="${pkgdir}/" install
}
