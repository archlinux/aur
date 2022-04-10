# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Markus Näther <naether.markus@gmail.com>
pkgname=rocblas
pkgver=5.1.1
pkgrel=1
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocblas.readthedocs.io/en/latest'
license=('MIT')
depends=('hip' 'openmp')
makedepends=('cmake' 'git' 'python' 'python-virtualenv' 'python-pyaml'
             'perl-file-which' 'msgpack-c' 'rocm-cmake' 'gcc-fortran')
_rocblas='https://github.com/ROCmSoftwarePlatform/rocBLAS'
source=("$pkgname-$pkgver.tar.gz::$_rocblas/archive/rocm-$pkgver.tar.gz")
sha256sums=('8a59c6f1ca36ccaf793bada022641a26da568249c776bd319d0d5bac6a8a809a')
_dirname="$(basename "$_rocblas")-$(basename "${source[0]}" ".tar.gz")"

build() {
  local cmake_args=(-DCMAKE_INSTALL_PREFIX=/opt/rocm
                    -DCMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm
                    -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
                    -DBUILD_WITH_TENSILE=ON
                    -DBUILD_WITH_TENSILE_HOST=ON
                    -DTensile_LIBRARY_FORMAT=yaml
                    -DTensile_COMPILER=hipcc
                    -DTensile_LOGIC=asm_full
                    -DTensile_CODE_OBJECT_VERSION=V3
                    -DBUILD_CLIENTS_TESTS=OFF
                    -DBUILD_CLIENTS_BENCHMARKS=OFF
                    -DBUILD_CLIENTS_SAMPLES=OFF
                    -DBUILD_TESTING=OFF)
  if [[ -n "$AMDGPU_TARGETS" ]]; then
      cmake_args+=(-DAMDGPU_TARGETS="$AMDGPU_TARGETS")
  fi
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-5.0.x/docs/markdown/clang_options.md
  PATH="/opt/rocm/llvm/bin:${PATH}" \
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        "${cmake_args[@]}"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocblas.conf" << EOF
/opt/rocm/rocblas/lib
EOF
  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
