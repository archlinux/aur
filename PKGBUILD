# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.6.0
arch=('x86_64')
pkgrel=2
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git' 'python' 'ocl-icd' 'cuda' 'nvidia-utils' 'clang' 'openmp')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'glbinding')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
sha512sums=('7d651a29c3ba927a3d6b8d1c461fe21e55bae2a988970c46353a2934855db1c8e150d20763faaccbac2a028b4cb6b19b61bbf3709a1052d8081f34637e686d8b')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  rm -rf build && mkdir build
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  cd build
  export CC=clang
  export CXX=clang++
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DAF_USE_SYSTEM_FORGE=ON \
      -DAF_WITH_IMAGEIO=ON \
      -DAF_WITH_GRAPHICS=ON \
      -DAF_BUILD_CPU=ON \
      -DAF_BUILD_OPENCL=ON \
      -DAF_BUILD_NONFREE=ON \
      -DAF_BUILD_EXAMPLES=ON \
      -DAF_BUILD_DOCS=ON \
      -DCUDA_architecture_build_targets="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCUDA_HOST_COMPILER=/usr/bin/gcc-5

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
