# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.6.4
arch=('x86_64')
pkgrel=1
license=('BSD')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'boost' 'python' 'ocl-icd' 'cuda' 'git')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2"
        'doc_warn_not_error.patch')
sha512sums=('febda2cd6f4a8d0bba2e5effaf92e93d37ab3283ff71f5fe1bd236fc71f3121c2e58988b20b97e457dee0077f67ea51406f17eac463c378d7655ad8be4aa3e53'
            '63c745da51347fc94e02b031cb0606216f523acc350866658ebed7ac09115217a934285ecb731391f11c2934984f106564153eaca1b9c6d578db2b0904c0741d')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  patch -Np1 -i "${srcdir}/doc_warn_not_error.patch"

  mkdir -p build
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  cd build
  cmake .. \
      -DCMAKE_POLICY_DEFAULT_CMP0063=NEW \
      -DCMAKE_POLICY_DEFAULT_CMP0077=NEW \
      -DGOOGLETEST_VERSION=1.9.0 \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DAF_WITH_IMAGEIO=ON \
      -DAF_BUILD_CPU=ON \
      -DAF_BUILD_OPENCL=ON \
      -DAF_WITH_NONFREE=ON \
      -DAF_BUILD_EXAMPLES=ON \
      -DAF_BUILD_DOCS=ON \
      -DCUDA_architecture_build_targets="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCUDA_HOST_COMPILER=/usr/bin/gcc

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

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd build

  make DESTDIR="${pkgdir}/" install
}
