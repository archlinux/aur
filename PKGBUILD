# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=arrayfire
pkgver=3.7.2
pkgrel=2
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
arch=('x86_64')
url='https://arrayfire.com'
license=('BSD')
depends=('cblas' 'fftw' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'intel-mkl')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'python' 'ocl-icd' 'cuda' 'cudnn' 'git' 'ninja' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'cudnn: Required for using CUDA backend'
            'opencl-driver: Required for using OpenCL backend')
options=('!buildflags')
# source=("http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgver}.tar.bz2")
source=("http://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-full-${pkgver}.tar.bz2")
sha512sums=('733f5931cca9397dd45945fde05d887207d11891fcc5ff0d2b5f30ac6bd4881240c595bd24d1d7b8f89c74e249b3fe16a15c2640586940bf101cd0fbaec998a6')

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  cmake . \
      -GNinja \
      -Bbuild \
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
      -DCUDA_architecture_build_targets="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCUDA_HOST_COMPILER=/usr/bin/gcc \
      -DBoost_NO_BOOST_CMAKE=ON

  ninja -C build
}

check() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  # Tests currently broken :(
  # ninja -C build test
}

package() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR="${pkgdir}/" ninja -C build install
  rm -r "${pkgdir}"/usr/LICENSES
}
