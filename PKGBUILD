# Maintainer: Ulysses R. Ribeiro <ulyssesrr@gmail.com>

_pkgname=rocblas
pkgname=rocblas-gfx1010-backend
pkgver=5.6.1
pkgrel=1
pkgdesc='Adds rocBLAS backend libraries for gfx1010'
arch=('x86_64')
url='https://rocblas.readthedocs.io/en/latest'
license=('MIT')
depends=("rocblas")
makedepends=('rocm-cmake' 'python' 'python-virtualenv' 'python-pyaml' 'python-wheel'
             'python-msgpack' 'python-joblib' 'perl-file-which' 'msgpack-cxx' 'gcc-fortran')
_rocblas='https://github.com/ROCmSoftwarePlatform/rocBLAS'
_tensile='https://github.com/ROCmSoftwarePlatform/Tensile'
source=("$_pkgname-$pkgver.tar.gz::$_rocblas/archive/rocm-$pkgver.tar.gz"
        "$_pkgname-tensile-$pkgver.tar.gz::$_tensile/archive/refs/tags/rocm-$pkgver.tar.gz"
        "find-msgpack-5.patch"
        "Tensile-fix-fallback-arch-build.patch")
sha256sums=('73896ebd445162a69af97f9fd462684609b4e0cf617eab450cd4558b4a23941e'
            '3e78c933563fade8781a1dca2079bff135af2f5d2c6eb0147797d2c1f24d006c'
            '3f91bf087e4ea72eaef5acd500e16b61aa69c029cfcca14666799a7c42a0c5aa'
            '65ef3972003a14f864806b82d48e27e839dd59a7fd02be567bdb00bfe9578517')
options=(!lto)
_dirname="$(basename "$_rocblas")-$(basename "${source[0]}" ".tar.gz")"
_tensile_dir="$(basename "$_tensile")-$(basename "${source[1]}" ".tar.gz")"

prepare() {
    cd "$_tensile_dir"
    patch -Np1 -i "$srcdir/find-msgpack-5.patch"
    patch -Np1 -i "$srcdir/Tensile-fix-fallback-arch-build.patch"
}

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/en/latest/reference/rocmcc/rocmcc.html#support-status-of-other-clang-options
  PATH="/opt/rocm/llvm/bin:/opt/rocm/bin:${PATH}" \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DCMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm \
    -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
    -DBUILD_WITH_TENSILE=ON \
    -DTensile_LIBRARY_FORMAT=msgpack \
    -DCMAKE_TOOLCHAIN_FILE=toolchain-linux.cmake \
    -DBUILD_FILE_REORG_BACKWARD_COMPATIBILITY=ON \
    -DTensile_TEST_LOCAL_PATH="$srcdir/$_tensile_dir" \
    -DAMDGPU_TARGETS="gfx1010"
    
  make -C build -j$(nproc) TENSILE_LIBRARY_TARGET
}

package() {
  mkdir -p "$pkgdir/opt/rocm/lib/rocblas/library"
  install -Dm644 build/Tensile/library/TensileLibrary_lazy_gfx* "$pkgdir/opt/rocm/lib/rocblas/library"
  
  #rm "$pkgdir/opt/rocm/lib/rocblas/library/TensileManifest.txt"

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
