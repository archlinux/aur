# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkgname=ginkgo
pkgbase=ginkgo-hpc-git
pkgname=(ginkgo-hpc{,-docs,-cuda,-hip}-git)
pkgver=r7470.b22b8592e2
pkgrel=1
pkgdesc="Numerical linear algebra software package"
arch=(x86_64)
url=https://ginkgo-project.github.io/
license=(BSD-3-Clause)
depends=(
  gcc-libs
  glibc
  hwloc
  openmpi
)
# FIXME: system 'rapidjson' does not work due to some C++ issues
# (see the 'declared protected here' error in https://github.com/Tencent/rapidjson/issues/1338#issuecomment-449849215 )
makedepends=(
  git
  cmake
  ninja
  nlohmann-json
  gflags  # for benchmarks (not installed yet)
  gtest
  numactl
  doxygen
  graphviz
  texlive-bin
  texlive-latexextra
  # -cuda
  cuda
  # -hip
  hip-runtime-amd
  hipblas
  hipfft
  hiprand
  hipsparse
  rocthrust
  roctracer
)
source=("git+https://github.com/ginkgo-project/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local common_cmake_flags=(
    -S $_pkgname -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DGINKGO_BUILD_REFERENCE=ON
    -DGINKGO_BUILD_OMP=ON
    -DGINKGO_BUILD_MPI=ON
    -DGINKGO_HAVE_GPU_AWARE_MPI=ON
    -DGINKGO_BUILD_BENCHMARKS=ON
    -DGINKGO_BUILD_EXAMPLES=ON
    -DGINKGO_BUILD_DOC=ON
    -DGINKGO_BUILD_TESTS=ON
  )
  local _cuda_archs="All"
  # archs gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102 are not supported: https://github.com/ginkgo-project/ginkgo/issues/1429
  local _amdgpu_archs="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942"

  # base package
  cmake -B build "${common_cmake_flags[@]}" \
    -DGINKGO_BUILD_CUDA=OFF \
    -DGINKGO_BUILD_HIP=OFF \
    -DGINKGO_BUILD_SYCL=OFF
  cmake --build build

  # -cuda package
  cmake -B build-cuda "${common_cmake_flags[@]}" \
    -DGINKGO_CUDA_ARCHITECTURES="$_cuda_archs" \
    -DGINKGO_BUILD_CUDA=ON \
    -DGINKGO_BUILD_HIP=OFF \
    -DGINKGO_BUILD_SYCL=OFF
  cmake --build build-cuda

  # -hip package
  # ginkgo has insufficient auto-detection for HIP_PATH https://github.com/ginkgo-project/ginkgo/issues/1529#issuecomment-2053598746
  export ROCM_PATH=/opt/rocm
  export HIP_PATH="$ROCM_PATH"
  # LTO does not work with HIP
  local _hip_flags="${CXXFLAGS/-flto=auto/}"
  local _cxx_flags="${CXXFLAGS/-flto=auto/}"
  # HIP does not support -fcf-protection
  _hip_flags="${_hip_flags/-fcf-protection/}"
  # Ginkgo does not support _GLIBCXX_ASSERTIONS for device builds https://github.com/ginkgo-project/ginkgo/issues/1143#issuecomment-2036957897
  _hip_flags="${_hip_flags/-Wp,-D_GLIBCXX_ASSERTIONS/}"
  cmake -B build-hip "${common_cmake_flags[@]}" \
    -DCMAKE_CXX_FLAGS="$_cxx_flags" \
    -DCMAKE_HIP_FLAGS="$_hip_flags" \
    -DCMAKE_HIP_ARCHITECTURES="$_amdgpu_archs" \
    -DGINKGO_BUILD_CUDA=OFF \
    -DGINKGO_BUILD_HIP=ON \
    -DGINKGO_BUILD_SYCL=OFF
  cmake --build build-hip
  unset ROCM_PATH
  unset HIP_PATH
}

check() {
  # some tests fail due to capturing stderr and getting different number of mpirun warnings
  # see https://github.com/ginkgo-project/ginkgo/issues/1567
  local excluded_tests="benchmark_.*_distributed"

  # limit parallel execution of tests to 4 threads and 8 processes
  # note that without a GPU we cannot run tests for -cuda and -hip
  (
    export OMP_NUM_THREADS=4
    export CTEST_PARALLEL_LEVEL=8
    export CTEST_OUTPUT_ON_FAILURE=1
    ctest --test-dir build --exclude-regex "$excluded_tests"
  )
}

_package() {
  DESTDIR="$pkgdir" cmake --install build"$1"

  # install the license
  install -vDm 644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # TODO: install the benchmarks and examples: https://github.com/ginkgo-project/ginkgo/issues/1144
}

package_ginkgo-hpc-git() {
  optdepends=(
    'ginkgo-hpc-docs: for documentation'
  )
  conflicts=(ginkgo-hpc)
  provides=(ginkgo-hpc)

  _package ""
}

package_ginkgo-hpc-docs-git() {
  pkgdesc+=" - documentation"
  depends=()
  conflicts=(ginkgo-hpc-docs)
  provides=(ginkgo-hpc-docs)

  # install the documentation
  install -vdm755 "$pkgdir/usr/share/doc/$pkgbase"
  cp -r build/doc/usr "$pkgdir/usr/share/doc/$pkgbase/html"

  # install the license
  install -vDm 644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ginkgo-hpc-cuda-git() {
  pkgdesc+=" (with CUDA)"
  depends+=(cuda)
  optdepends=(
    'ginkgo-hpc-docs: for documentation'
  )
  conflicts=(ginkgo-hpc)
  provides=(ginkgo-hpc)

  _package -cuda
}

package_ginkgo-hpc-hip-git() {
  pkgdesc+=" (with ROCm/HIP)"
  depends+=(
    hip-runtime-amd
    hipblas
    hipfft
    hiprand
    hipsparse
    roctracer
  )
  optdepends=(
    'ginkgo-hpc-docs: for documentation'
  )
  conflicts=(ginkgo-hpc)
  provides=(ginkgo-hpc)

  _package -hip
}

# vim:set ts=2 sw=2 et:
