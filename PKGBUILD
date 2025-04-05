# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkgname=ginkgo
pkgbase=ginkgo-hpc-git
pkgname=(ginkgo-hpc{,-docs,-cuda,-hip}-git)
pkgver=r8482.cea1be7fbd
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
  yaml-cpp  # for tests
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
source=(
  "git+https://github.com/ginkgo-project/$_pkgname.git"
  split_cuda_library.patch
)
b2sums=('SKIP'
        '1d7c35edb141a4d9cf5aa1ca51aec6e923e09c5353d7ef05bdb576fc1b4fceb59204162f66b3c63a550a682c953922ee4ae9b24bf87ba9ba7555465a1b3c53ec')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Ginkgo is too big to build all CUDA archs into a single library, we need to split it
  # https://github.com/ginkgo-project/ginkgo/issues/1734#issuecomment-2517784197
  patch --directory=$_pkgname -Np1 < split_cuda_library.patch
}

build() {
  local common_cmake_flags=(
    -S $_pkgname
    -G Ninja
    -Wno-dev
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
  # In general, we want to list all real archs (sm_XX) and the latest virtual arch (compute_XX) for future PTX compatibility.
  # Valid values can be discovered from nvcc --help
  local cuda_archs="50;52;53;60;61;62;70;72;75;80;86;87;89;90;90a;100;100a;101;101a;120;120a;120-virtual"
  # archs gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102 are not supported: https://github.com/ginkgo-project/ginkgo/issues/1429
  local amdgpu_archs="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942"

  # base package
  cmake -B build "${common_cmake_flags[@]}" \
    -DGINKGO_BUILD_CUDA=OFF \
    -DGINKGO_BUILD_HIP=OFF \
    -DGINKGO_BUILD_SYCL=OFF
  cmake --build build

  # -cuda package
  cmake -B build-cuda "${common_cmake_flags[@]}" \
    -DCMAKE_CUDA_ARCHITECTURES="$cuda_archs" \
    -DGINKGO_BUILD_CUDA=ON \
    -DGINKGO_BUILD_HIP=OFF \
    -DGINKGO_BUILD_SYCL=OFF
  cmake --build build-cuda

  # -hip package
  # LTO does not work with HIP
  export HIPFLAGS="${CXXFLAGS/-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
  # HIP does not support -fcf-protection
  export HIPFLAGS="${HIPFLAGS/-fcf-protection/}"
  # Ginkgo does not support _GLIBCXX_ASSERTIONS for device builds https://github.com/ginkgo-project/ginkgo/issues/1143#issuecomment-2036957897
  export HIPFLAGS="${HIPFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
  # Compile source code for supported GPU archs in parallel
  export HIPFLAGS="$HIPFLAGS -parallel-jobs=$(nproc)"
  cmake -B build-hip "${common_cmake_flags[@]}" \
    -DCMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++ \
    -DCMAKE_HIP_ARCHITECTURES="$amdgpu_archs" \
    -DGINKGO_BUILD_CUDA=OFF \
    -DGINKGO_BUILD_HIP=ON \
    -DGINKGO_BUILD_SYCL=OFF
  cmake --build build-hip
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
