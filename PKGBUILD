# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

# Set in ~/.makepkg.conf to build for your GPU only, e.g. '8.6;8.9'
: ${_cuda_arch_list:='7.5;8.0;8.6;8.9;9.0+PTX'}

pkgname=(
  'ctranslate2-cuda'
  'python-ctranslate2-cuda'
)
pkgbase=ctranslate2-cuda
pkgver=4.8.2
pkgrel=1
pkgdesc="A C++ and Python library for efficient inference with Transformer models (with CUDA)."
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
makedepends=(
  'cmake'
  'ninja'
  'cuda'
  'git'
  'openblas'
  'pybind11'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
# LTO merges nvcc objects; each defines fatbinData, so lto-wrapper fails
options=('!lto')
source=("git+https://github.com/OpenNMT/CTranslate2.git#tag=v$pkgver"
        'git+https://github.com/jarro2783/cxxopts.git'
        'git+https://github.com/NVIDIA/cccl.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/cpu_features.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/google/ruy.git'
        'git+https://github.com/pytorch/cpuinfo.git'
        'git+https://github.com/NVIDIA/cutlass.git')
sha256sums=('3ebe3d22a615f1b04710e19aa7d94c26c704bdd1e3ed3b3d31f7f7e77dfc2ebd'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd CTranslate2
  git submodule init
  git config submodule."third_party/thrust".url "$srcdir/cccl"
  for submodule in cxxopts googletest cpu_features spdlog ruy cutlass; do
    git config submodule."third_party/${submodule}".url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  pushd third_party/ruy
  git submodule init
  git config submodule."cpuinfo".url "$srcdir/cpuinfo"
  git config submodule."googletest".url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
  popd

  git clean python -dfx

  # Relax pybind11 version
  sed -i 's/pybind11==2.11.1/pybind11/g' python/pyproject.toml

  # Include cstdint
  pushd third_party/cxxopts
  git cherry-pick -X theirs -n 63d1b65a694cfceafc20863afa75df49dfbe6b2a
  popd
}

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S CTranslate2
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D OPENMP_RUNTIME='COMP'
    -D WITH_MKL='OFF'
    -D WITH_DNNL='OFF'
    -D WITH_OPENBLAS='ON'
    -D OPENBLAS_INCLUDE_DIR='/usr/include/openblas'
    -D WITH_RUY='ON'
    # CUDA 13 dropped archs below sm_75, so 'Common' fails
    # FindCUDA does not parse 10.0 and up; 9.0 PTX JIT covers those
    -D WITH_CUDA='ON'
    -D CUDA_ARCH_LIST="$_cuda_arch_list"
    -D CMAKE_POLICY_VERSION_MINIMUM='3.5'
    -D ENABLE_CPU_DISPATCH='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  pushd CTranslate2/python
  CTRANSLATE2_ROOT=.. LIBRARY_PATH="$srcdir/build" python -m build --wheel --no-isolation
  popd
}

package_ctranslate2-cuda() {
  pkgdesc="A C++ library for efficient inference with Transformer models (with CUDA)."
  provides=("ctranslate2=$pkgver")
  conflicts=('ctranslate2')
  depends=(
    'cuda'
    'openblas'
    'libgcc'
    'libstdc++'
    'libgomp'
    'glibc'
  )

  DESTDIR="$pkgdir" cmake --install build

  # Avoid conflict with nlohmann-json
  rm -r "$pkgdir/usr/include/nlohmann"

  install -Dm644 CTranslate2/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-ctranslate2-cuda() {
  pkgdesc="A Python library for efficient inference with Transformer models (with CUDA)."
  provides=("python-ctranslate2=$pkgver")
  conflicts=('python-ctranslate2')
  depends=(
    'ctranslate2-cuda'
    'python-numpy'
    'python-yaml'
    'python'
    'libgcc'
    'glibc'
    'libstdc++'
  )
  optdepends=('python-pytorch: model converters')

  cd CTranslate2/python
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
