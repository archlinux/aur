# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=tnl-git
_pkgname=tnl
pkgver=r7577.4a3d9321c
pkgrel=1
pkgdesc="An efficient C++ library providing parallel algorithms and data structures for high-performance computing on GPUs, multicore CPUs and distributed clusters"
arch=(x86_64)
url=https://tnl-project.org/
license=(MIT)
depends=('gcc-libs' 'openmpi' 'zlib' 'tinyxml2' 'metis' 'libpng' 'libjpeg' 'dcmtk' 'blas-openblas' 'onetbb')
makedepends=('git' 'cmake' 'ninja' 'doxygen' 'graphviz' 'texlive-binextra' 'texlive-latexextra' 'texlive-fontsrecommended'
             'cuda' 'hypre' 'python' 'python-numpy' 'python-matplotlib' 'cgal')
optdepends=('cuda: for tools, benchmarks and examples built with CUDA'
            'hypre: for Hypre wrappers')
source=("git+https://gitlab.com/tnl-project/$_pkgname.git")
sha256sums=('SKIP')

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
    -DCMAKE_CUDA_ARCHITECTURES="all"
  cmake --build build --target benchmarks examples tools

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
    -DCMAKE_CUDA_ARCHITECTURES=native
  cmake --build build-doc --target documentation
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
    -DCMAKE_CUDA_ARCHITECTURES=native
  cmake --build build-tests --target tests

  # TNL has ctest options set in the preset, but ctest does not allow to override the build directory
  # https://gitlab.kitware.com/cmake/cmake/-/issues/23982
  sed 's|\"binaryDir\": \"${sourceDir}/build\",|\"binaryDir\": \"${sourceDir}\",|' $_pkgname/CMakePresets.json > build-tests/CMakePresets.json
  cd build-tests
  ctest --preset all-tests #--test-dir build-tests
}

package() {
  # we built only some components, cmake can't install them all with a single command
  DESTDIR="$pkgdir" cmake --install build --component headers
  DESTDIR="$pkgdir" cmake --install build --component benchmarks
  DESTDIR="$pkgdir" cmake --install build --component examples
  DESTDIR="$pkgdir" cmake --install build --component tools
  DESTDIR="$pkgdir" cmake --install build-doc --component documentation

  # move documentation to correct package location
  mv "$pkgdir"/usr/share/doc/{$_pkgname,$pkgname}

  # install the license
  install -vDm 644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
