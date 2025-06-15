# Maintainer: Stan Ionascu <s@stashed.xyz>
# Forked from Arch rocblas package + extra patches on
# top, i.e. gfx1103 support

pkgname=rocblas-gfx1103
pkgver=6.4.1
pkgrel=2
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocblas.readthedocs.io/en/latest'
license=('MIT')
depends=(
  'rocm-core'
  'hip-runtime-amd'
  'roctracer'
  'glibc'
  'gcc-libs'
  'openmp'
  'cblas'
)
makedepends=(
  'git'
  'cmake'
  'rocm-cmake'
  'python'
  'python-virtualenv'
  'python-pyaml'
  'python-wheel'
  'python-tensile'
  'python-msgpack'
  'python-joblib'
  'perl-file-which'
  'msgpack-cxx'
  'gcc-fortran'
)
provides=(rocblas)
conflicts=(rocblas)
_rocblas='https://github.com/ROCm/rocBLAS'
_tensile='https://github.com/ROCm/Tensile'
source=("$pkgname-$pkgver.tar.gz::$_rocblas/archive/refs/tags/rocm-$pkgver.tar.gz"
        "$pkgname-tensile-$pkgver.tar.gz::$_tensile/archive/refs/tags/rocm-$pkgver.tar.gz"
        "0001-add-gfx1103-support-for-rocBLAS.patch::https://github.com/stanionascu/rocBLAS/commit/e1bcb6ec63529e1016c3756973646b90ed6cf0fc.patch"
        "0001-fixup-install-of-tensile-output.patch"
	      "0001-enable-gfx1103-for-Tensile.patch"
        "0002-launch-local-tensile-create-library.patch")
sha256sums=('517950ff6b3715dee8b2bcfbdd3968c65e1910e4b8e353e148574ae08aa6dc73'
            'f96fe39fbb0d43e39b258b21d66234abf3248f8cfa6954f922618d4bb7d04c74'
            'e695c3d490c8b7592276ad1ed88b1e3c8cdf7f1dcf05a3019655cbc794ccf398'
            'b859cb3f3e0e0c7f3644d9b1cc323b1ba8113daedae062d9876681da40ed7e8b'
            '908ae49fae679164d157d3414946e1148d9d7795bb2e7ec6356f22a415200f5d'
            '3dbc85ec334394c8966443294ea4406f475a88b44a3acef2b1cef793be8493b8')
options=(!lto)
_dirname="$(basename "$_rocblas")-$(basename "${source[0]}" ".tar.gz")"
_tensile_dir="$(basename "$_tensile")-$(basename "${source[1]}" ".tar.gz")"

prepare() {
  cd ${srcdir}/rocBLAS-rocm-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/0001-add-gfx1103-support-for-rocBLAS.patch"
  patch --forward --strip=1 --input="${srcdir}/0001-fixup-install-of-tensile-output.patch"

  cd ${srcdir}/Tensile-rocm-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/0001-enable-gfx1103-for-Tensile.patch"
  patch --forward --strip=1 --input="${srcdir}/0002-launch-local-tensile-create-library.patch"
}

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"

  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_C_COMPILER=/opt/rocm/lib/llvm/bin/amdclang
    -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
    -D CMAKE_TOOLCHAIN_FILE=toolchain-linux.cmake
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm
    -D amd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
    -D BUILD_FILE_REORG_BACKWARD_COMPATIBILITY=OFF
    -D HIP_PLATFORM=amd
    -D BLAS_LIBRARY=cblas
    -D BUILD_WITH_TENSILE=ON
    -D Tensile_LIBRARY_FORMAT=msgpack
    -D Tensile_TEST_LOCAL_PATH="$srcdir/$_tensile_dir"
    -D Tensile_COMPILER=hipcc
    -D BUILD_WITH_PIP=OFF
    -D BUILD_FORTRAN_CLIENTS=OFF
    -D BUILD_CLIENTS_TESTS_OPENMP=OFF
    -D BUILD_CLIENTS_TESTS=OFF
    -D BUILD_CLIENTS_BENCHMARK=OFF
    -D ROCM_SYMLINK_LIBS=OFF
    -D DISABLE_ROCTRACER=ON
    -D Tensile_ROOT=${srcdir}/Tensile-rocm-6.4.1/Tensile
    # hipblaslt doesn't support all relevant targets
    -D BUILD_WITH_HIPBLASLT=OFF
  )
  cmake "${cmake_args[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
