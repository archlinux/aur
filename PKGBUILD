# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=arrayfire-git
pkgver=3.8.rc.r458.g787d927
pkgrel=1
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
arch=('i686' 'x86_64')
url='https://arrayfire.com'
license=('BSD')
depends=('cblas' 'fftw' 'lapacke' 'forge' 'freeimage' 'glfw' 'glew' 'intel-oneapi-mkl')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'python' 'ocl-icd' 'cuda' 'cudnn' 'git' 'ninja' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'cudnn: Required for using CUDA backend'
            'opencl-driver: Required for using OpenCL backend'
            'ocl-icd: Required for OpenCL ICD Bindings')
options=('!lto')
provides=('arrayfire' 'forge')
conflicts=('arrayfire' 'forge')
source=(git+https://github.com/arrayfire/arrayfire)
b2sums=('SKIP')


pkgver() {
  cd "arrayfire/"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/arrayfire/"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/arrayfire/"

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
#   cd "${srcdir}/arrayfire"
#
#   # Tests currently broken :(
#   ctest --test-dir build --output-on-failure -E '.*(opencl|cuda)' -j$(nproc)
# }

package() {
  cd "${srcdir}/arrayfire"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR="${pkgdir}/" ninja -C build install
  # rm -r "${pkgdir}"/usr/LICENSES
}
