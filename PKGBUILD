# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=tnl-git
_pkgname=tnl
pkgver=r6773.b654af06f
pkgrel=1
pkgdesc="An efficient C++ library providing parallel algorithms and data structures for high-performance computing on GPUs, multicore CPUs and distributed clusters"
arch=('x86_64')
url=https://tnl-project.org/
license=('MIT')
depends=('gcc-libs' 'openmpi' 'zlib' 'tinyxml2' 'metis' 'libpng' 'libjpeg' 'dcmtk')
# Note: openssh is required for mpirun (when running examples for doc): https://github.com/open-mpi/ompi/issues/3625
makedepends=('git' 'cmake' 'ninja' 'doxygen' 'graphviz' 'texlive-bin' 'texlive-latexextra'
             'cuda' 'hypre' 'python' 'python-numpy' 'python-matplotlib' 'cgal' 'openssh')
optdepends=('cuda: for tools, benchmarks and examples built with CUDA'
            'hypre: for Hypre wrappers')
source=("git+https://gitlab.com/tnl-project/$_pkgname.git")
md5sums=('SKIP')

# LTO does not work with nvcc
options+=(!lto)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTNL_USE_MARCH_NATIVE_FLAG=OFF \
    -DTNL_USE_OPENMP=ON \
    -DTNL_USE_MPI=ON \
    -DTNL_USE_CUDA=ON \
    -DCMAKE_CUDA_ARCHITECTURES="all" \
    -DTNL_BUILD_BENCHMARKS=ON \
    -DTNL_BUILD_EXAMPLES=ON \
    -DTNL_BUILD_TOOLS=ON \
    -DTNL_BUILD_TESTS=OFF \
    -DTNL_BUILD_MATRIX_TESTS=OFF \
    -DTNL_BUILD_COVERAGE=OFF \
    -DTNL_BUILD_DOC=OFF
  ninja -C build all

  # TNL_BUILD_DOC=ON executes the built examples, so we need to check if the build
  # system has a GPU to disable building CUDA samples
  local TNL_USE_CUDA=OFF
  if nvidia-smi --list-gpus >/dev/null; then
    TNL_USE_CUDA=ON
  fi

  # build documentation samples in a separate builddir
  cmake -B build-doc -S "$_pkgname" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTNL_USE_MARCH_NATIVE_FLAG=OFF \
    -DTNL_USE_OPENMP=ON \
    -DTNL_USE_MPI=ON \
    -DTNL_USE_CUDA=$TNL_USE_CUDA \
    -DCMAKE_CUDA_ARCHITECTURES=native \
    -DTNL_BUILD_DOC=ON
  ninja -C build-doc all

  # build the documentation itself
  (
    cd "$_pkgname/Documentation"
    export PROJECT_NUMBER="version $pkgver"
    export OUTPUT_DIRECTORY="$srcdir/build-doc"
    export OUTPUT_SNIPPETS_PATH="$srcdir/build-doc/output_snippets"
    doxygen
  )
}

check() {
  # check if the build system has a GPU where CUDA tests could be executed
  local TNL_USE_CUDA=OFF
  if nvidia-smi --list-gpus >/dev/null; then
    TNL_USE_CUDA=ON
  fi

  cmake -B build-tests -S "$_pkgname" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTNL_USE_MARCH_NATIVE_FLAG=OFF \
    -DTNL_USE_OPENMP=ON \
    -DTNL_USE_MPI=ON \
    -DTNL_USE_CUDA=$TNL_USE_CUDA \
    -DCMAKE_CUDA_ARCHITECTURES=native \
    -DTNL_BUILD_BENCHMARKS=OFF \
    -DTNL_BUILD_EXAMPLES=OFF \
    -DTNL_BUILD_TOOLS=OFF \
    -DTNL_BUILD_TESTS=ON \
    -DTNL_BUILD_MATRIX_TESTS=ON \
    -DTNL_BUILD_COVERAGE=OFF \
    -DTNL_BUILD_DOC=OFF
  ninja -C build-tests all

  # limit parallel execution of tests to 4 threads and 4 processes
  (
    export OMP_NUM_THREADS=4
    export CTEST_PARALLEL_LEVEL=4
    export CTEST_OUTPUT_ON_FAILURE=1
    ninja -C build-tests test
  )
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # install the license
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install the documentation
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -r "build-doc/html" "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
