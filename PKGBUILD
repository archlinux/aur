# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=ginkgo-hpc-git
_pkgname=ginkgo
pkgver=r5861.ca2a213368
pkgrel=1
pkgdesc="Numerical linear algebra software package"
arch=('x86_64')
url=https://ginkgo-project.github.io/
license=('BSD')
# TODO system 'rapidjson' does not work due to some C++ issues
# (see the 'declared protected here' error in https://github.com/Tencent/rapidjson/issues/1338#issuecomment-449849215 )
depends=('cuda' 'gflags' 'hwloc' 'numactl' 'openmpi')
makedepends=('git' 'cmake' 'ninja' 'doxygen' 'graphviz' 'texlive-bin' 'texlive-latexextra' 'gtest')
checkdepends=('openssh')  # openssh is needed for mpirun to run some tests
source=("git+https://github.com/ginkgo-project/$_pkgname.git")
md5sums=('SKIP')

# LTO does not work with nvcc
options+=(!lto)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGINKGO_CUDA_ARCHITECTURES="All" \
    -DGINKGO_BUILD_REFERENCE=ON \
    -DGINKGO_BUILD_OMP=ON \
    -DGINKGO_BUILD_MPI=ON \
    -DGINKGO_BUILD_CUDA=ON \
    -DGINKGO_BUILD_BENCHMARKS=ON \
    -DGINKGO_BUILD_EXAMPLES=ON \
    -DGINKGO_BUILD_DOC=ON \
    -DGINKGO_BUILD_TESTS=ON
  cmake --build build
}

check() {
  # limit parallel execution of tests to 4 threads and 4 processes
  (
    export OMP_NUM_THREADS=4
    export CTEST_PARALLEL_LEVEL=4
    export CTEST_OUTPUT_ON_FAILURE=1
    # FIXME: some tests fail: https://github.com/ginkgo-project/ginkgo/issues/1143
    cmake --build build --target test || true
  )
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install the license
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install the documentation
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -r "build/doc/usr" "$pkgdir/usr/share/doc/$pkgname/html"

  # TODO: install the benchmarks and examples: https://github.com/ginkgo-project/ginkgo/issues/1144
}

# vim:set ts=2 sw=2 et:
