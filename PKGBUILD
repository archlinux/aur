# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=arrayfire
pkgver=3.9.0
pkgrel=2
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
arch=('x86_64')
url='https://arrayfire.com'
license=('BSD')
depends=('cblas' 'fftw' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'intel-oneapi-mkl' 'intel-oneapi-tbb')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'python' 'ocl-icd' 'cuda' 'cudnn' 'git' 'ninja' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'cudnn: Required for using CUDA backend'
            'opencl-driver: Required for using OpenCL backend'
            'ocl-icd: Required for OpenCL ICD Bindings')
options=('!lto')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-full-${pkgver}.tar.bz2"
        'arrayfire-boost-1.76.0.patch')
sha512sums=('731995b8a8783e2fbdf04f9c89b31efc888deaa4046f623b932c2fabd83ea3e8d1d779d17148e01a4b30f2be64ba2d850f556129acff2004e3ecd780227fe025'
            '92e34c28e4b6222febef5a3047f4faf64756a50b46a68507931b989984bbc6729aa4d1560dc267650f1890cb1ad7aa0866dd3debc0073f9103f764af7618d795')

prepare() {
  cd "${srcdir}/arrayfire-full-v${pkgver}"
  patch -Np1 -i "${srcdir}/arrayfire-boost-1.76.0.patch"
}

build() {
  cd "${srcdir}/arrayfire-full-v${pkgver}"

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
      -DCUDA_architecture_build_targets="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.7;8.9;9.0;9.0+PTX" \
      -DCMAKE_BUILD_TYPE=None \
      -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc \
      -DBoost_NO_BOOST_CMAKE=ON

  ninja -C build
}

# Disable these for now as they do appear to become stuck easily.
# check() {
#   cd "${srcdir}/arrayfire-full-${pkgver}"
#
#   # Tests currently broken :(
#   ctest --test-dir build --output-on-failure -E '.*(opencl|cuda)' -j$(nproc)
# }

package() {
  cd "${srcdir}/arrayfire-full-v${pkgver}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR="${pkgdir}/" ninja -C build install
  # rm -r "${pkgdir}"/usr/LICENSES
}
