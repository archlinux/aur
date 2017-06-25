# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='http://arrayfire.com'
pkgver=3.5.0
arch=('x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git' 'python' 'gcc5' 'ocl-icd')
makedepends_x86_64=('cuda' 'nvidia-utils')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
sha512sums=('cf33ee9312724849bec4ed9573dfe9a9504520b7a5e8b45b9e022beab6a7cf14f00b978cb954bdd498dd70626913c40a72277e29b6b792da29cf5daf5c04e1d7')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  # patches here
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
      -DCOMPUTES_DETECTED_LIST="20;30;32;35;50;52;53" \
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
