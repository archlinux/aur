# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=arrayfire
pkgver=3.8.0
pkgrel=15
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
arch=('x86_64')
url='https://arrayfire.com'
license=('BSD')
depends=('cblas' 'fftw' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'intel-mkl')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'python' 'ocl-icd' 'cuda' 'cudnn' 'git' 'ninja' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'cudnn: Required for using CUDA backend'
            'opencl-driver: Required for using OpenCL backend'
            'ocl-icd: Required for OpenCL ICD Bindings')
options=('!buildflags')
source=("http://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-full-${pkgver}.tar.bz2"
        'arrayfire-boost-1.76.0.patch')
sha512sums=('f36bee89a0f1a0a48ca2cae3a7b2527d63830e3070cb31174ff7f5c42f065aad6981d5142a8b7af7215a3c7dbf67ae13d1ea3543cd94eb70cff509c8cb95c739'
            '92e34c28e4b6222febef5a3047f4faf64756a50b46a68507931b989984bbc6729aa4d1560dc267650f1890cb1ad7aa0866dd3debc0073f9103f764af7618d795')

prepare() {
  cd "${srcdir}/arrayfire-full-${pkgver}"
  patch -Np1 -i "${srcdir}/arrayfire-boost-1.76.0.patch"
}

build() {
  cd "${srcdir}/arrayfire-full-${pkgver}"

  cmake \
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
      -DCUDA_architecture_build_targets="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.6+PTX" \
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
