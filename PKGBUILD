# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=arrayfire
pkgver=3.9.0
pkgrel=18
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
arch=('x86_64')
url='https://arrayfire.com'
license=('BSD')
depends=('cblas' 'fftw' 'lapacke' 'forge' 'glfw' 'glew' 'intel-oneapi-mkl' 'onetbb' 'spdlog')
makedepends=('cmake' 'graphviz' 'doxygen' 'opencl-headers' 'python' 'ocl-icd' 'cuda' 'cudnn' 'git' 'ninja' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'cudnn: Required for using CUDA backend'
            'opencl-driver: Required for using OpenCL backend'
            'ocl-icd: Required for OpenCL ICD Bindings')
options=('!lto')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-full-${pkgver}.tar.bz2"
        'arrayfire-boost-1.76.0.patch'
        '3451-update-toolkit-driver-cuda-12-4.patch'
        '3521-fix-build-failure-with-cudnn.patch'
        'fmt-v11.patch'
        'arrayfire-clblast-cmake4.patch'
        "${pkgname}-3588.patch::https://github.com/arrayfire/arrayfire/pull/3588.patch"
        "${pkgname}-3636.patch::https://github.com/arrayfire/arrayfire/pull/3636.patch"
        'gcc15.patch')
sha512sums=('731995b8a8783e2fbdf04f9c89b31efc888deaa4046f623b932c2fabd83ea3e8d1d779d17148e01a4b30f2be64ba2d850f556129acff2004e3ecd780227fe025'
            '92e34c28e4b6222febef5a3047f4faf64756a50b46a68507931b989984bbc6729aa4d1560dc267650f1890cb1ad7aa0866dd3debc0073f9103f764af7618d795'
            '5a4f252278a9a29f3fe61c54512e1246f602fbf61be1c835cbcaf41c2092b3fa8bfe255d77f181fa636da7045e7e69b529d6d81871d149ddcced17a84e868542'
            'e415c85d41af19a4c896ac196fff84943196d5e5e35362f6b555b08a7446acd0a7c52c723f28a6269ad81bf503cf1abbc72dd8dc128938ba5c89d679cca1f48f'
            'a4e231b38e428fdec28129062d83a7af89bde19b3fefa05ae744744b456c7c4198f42801490531a8394f44a8088c861ef84a8a708d3f08dd1f0815bc172ad9e0'
            '56d2e7704aeb5b6d9000f503c2b6ee5416bea7043ae7ef4544c73750d5cbf8663f961475e229cc3be8340ea397fa119affbce7a7dc81ca95730166e2f4ec06c3'
            '5e1b941767311db031ada922c9ab54aa65718a6e557620380a920442b3db7ef587c55f34d210c92e396770e9fd8578bc9b11fc86a35ec0257272c937afdf99c5'
            'b45bd8bcb925d0889a24fd8d41667f6f29afd41a8ac520af676ebba086f4fc546600e026296e2e8961ef11f70cdcfa585fe3b8070d5ef4402660ead0090680d6'
            '4dce7ca53ce3d0e364c355ad9c10862b3c94de78db17bfe14b0dc0fff39237dbcb7141a9c4b8dc387c4b228c4fda6b60d9ae0703cf73782620dbadb69489a79f')

prepare() {
  cd "${srcdir}/arrayfire-full-v${pkgver}"
  patch -Np1 -i "${srcdir}/arrayfire-boost-1.76.0.patch"
  patch -Np1 -i "${srcdir}/3451-update-toolkit-driver-cuda-12-4.patch"
  patch -Np1 -i "${srcdir}/3521-fix-build-failure-with-cudnn.patch"
  patch -Np1 -i "${srcdir}/fmt-v11.patch"
  patch -Np1 -i "${srcdir}/arrayfire-clblast-cmake4.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-3588.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-3636.patch"
  patch -Np1 -i "${srcdir}/gcc15.patch"

  # forcing C++17 due to Boost.Math requirements
  sed -e 's@CMAKE_CXX_STANDARD 11@CMAKE_CXX_STANDARD 17@g' -i.bak test/CMakeLists.txt
}

build() {
  cd "${srcdir}/arrayfire-full-v${pkgver}"

  # forcing C++17 due to Boost.Math requirements
  cmake \
      -GNinja \
      -Bbuild \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_CUDA_STANDARD=17 \
      -DUSE_CPU_MKL=ON \
      -DGOOGLETEST_VERSION=1.14.0 \
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
      -DCUDA_HOST_COMPILER="$NVCC_CCBIN" \
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
  rm -r "${pkgdir}"/usr/LICENSES
  rm -r "${pkgdir}"/usr/etc
}
