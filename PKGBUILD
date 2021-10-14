# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=tnl-git
_pkgname=tnl-dev
pkgver=r5801.83e102af6
pkgrel=1
pkgdesc="An efficient C++ library providing parallel algorithms and data structures for high-performance computing on GPUs, multicore CPUs and distributed clusters"
arch=('x86_64')
url=https://tnl-project.org/
license=('MIT')
depends=('gcc-libs' 'openmpi' 'zlib' 'tinyxml2' 'dcmtk')
makedepends=('git' 'cmake' 'ninja' 'doxygen' 'graphviz'
             'cuda' 'python' 'python-numpy' 'pybind11')
optdepends=('cuda: for tools, benchmarks and examples built with CUDA'
            'python: for Python bindings'
            'python-numpy: for Python bindings')
source=("git+https://mmg-gitlab.fjfi.cvut.cz/gitlab/tnl/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # TODO: BUILD_DOC=yes executes CUDA examples due to WITH_CUDA=yes, which fails on systems without a GPU
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_OPENMP=yes \
    -DWITH_MPI=yes \
    -DWITH_CUDA=yes \
    -DWITH_CUDA_ARCH="3.5 Maxwell Pascal Turing Volta Ampere" \
    -DBUILD_TESTS=no \
    -DBUILD_MATRIX_TESTS=no \
    -DBUILD_DOC=no \
    -DWITH_COVERAGE=no \
    -DBUILD_BENCHMARKS=yes \
    -DBUILD_EXAMPLES=yes \
    -DBUILD_TOOLS=yes \
    -DBUILD_PYTHON=yes
  ninja -C build all
}

check() {
  # check if the build system has a GPU where CUDA tests could be executed
  local WITH_CUDA=no
  if nvidia-smi --list-gpus >/dev/null; then
    WITH_CUDA=yes
  fi

  cmake -B build-tests -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_OPENMP=yes \
    -DWITH_MPI=yes \
    -DWITH_CUDA=$WITH_CUDA \
    -DWITH_CUDA_ARCH=auto \
    -DBUILD_TESTS=yes \
    -DBUILD_MATRIX_TESTS=yes \
    -DBUILD_DOC=no \
    -DWITH_COVERAGE=no \
    -DBUILD_BENCHMARKS=no \
    -DBUILD_EXAMPLES=no \
    -DBUILD_TOOLS=no \
    -DBUILD_PYTHON=no
  ninja -C build-tests all
  ninja -C build-tests test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # install the license
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install the documentation
  # TODO
}

# vim:set ts=2 sw=2 et:
