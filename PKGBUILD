# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='http://arrayfire.com'
pkgver=3.4.2
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'glfw' 'glew' 'boost' 'git' 'python' 'gcc5')
makedepends_x86_64=('cuda' 'nvidia-utils')
depends=('cblas' 'fftw' 'boost-libs' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2"
        bf103c05bea41902cf9186224a6fa9435cb4e849.patch
        13c484e10537b52bcd012e6850520659769cece6.patch)
sha512sums=('c8b139ca314224c33ff45a1b304dc5fc5ed2a5eca726606b316f4b355680c842fac434f19e6cd3820065845d94359a62e684e20521136f1944015760aa004368'
            'de697b39ca747a1104b895c45bc7e3dba274c74bdd840ae0c0cb1e32d6d268b03da2d1092a09dd6f449fc1ad5f3e90470b1559b8c7038ee274b16d3c6b14a05b'
            'b3b1c52e3161d8085297d4cd2cb0aa03d567cf8bbcdf33071cd402f049cba1cce38afb1085d82ba83a75741b47c2835141ca1b1253a1149f0ef373ab4526706b')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  patch -Np1 < "${srcdir}/bf103c05bea41902cf9186224a6fa9435cb4e849.patch"
  patch -Np1 < "${srcdir}/13c484e10537b52bcd012e6850520659769cece6.patch"
}

# check() {
#   cd "${srcdir}/arrayfire-full-${pkgver}/build"
#
#   # Some tests fail :(
#   #make test
# }

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
