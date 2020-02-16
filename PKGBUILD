# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='https://arrayfire.com'
pkgver=3.7.0
arch=('x86_64')
pkgrel=3
license=('BSD')
depends=('cblas' 'fftw' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'intel-mkl')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'python' 'ocl-icd' 'cuda' 'cudnn' 'git' 'ninja' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'cudnn: Required for using CUDA backend'
            'opencl-driver: Required for using OpenCL backend')
options=('!buildflags')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
sha512sums=('64f34f742eced91356a96706d5f4846ead90b2618eeb5da90e6b797d62ab70b71dee9f2b2c0d09c09d5868e9c81ebbe4762947e195a37834481d9730e189d1d7')

prepare() {
  mkdir "${srcdir}/arrayfire-full-${pkgver}"/build
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"/build

  export MKLROOT=/usr/include/mkl
  cmake .. \
      -GNinja \
      -DMKL_THREAD_LAYER="GNU OpenMP" \
      -DUSE_CPU_MKL=ON \
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
      -DCUDA_HOST_COMPILER=/usr/bin/gcc \
      -DBoost_NO_BOOST_CMAKE=ON

  ninja
}

check() {
  cd "${srcdir}/arrayfire-full-${pkgver}/build"

  make test
}

package() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd build

  DESTDIR="${pkgdir}/" ninja install
  rm -r "${pkgdir}"/usr/LICENSES
}
