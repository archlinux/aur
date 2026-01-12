# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'ctranslate2'
  'python-ctranslate2'
#  'ctranslate2-docs'
)
pkgbase=ctranslate2
pkgver=4.6.3
pkgrel=1
pkgdesc="A C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://opennmt.net/CTranslate2"
license=('MIT')
makedepends=(
  'cmake'
  'ninja'
#  'cuda'
#  'cudnn'
  'git'
  'intel-oneapi-mkl'
#   'onednn'
  'openblas'
  'pybind11'
  'python-build'
  'python-installer'
#  'python-myst-parser'  ## docs
  'python-setuptools'
#  'python-sphinx'  ## docs
#  'python-sphinx_rtd_theme'  ## docs
  'python-wheel'
)
#checkdepends=(
#  'python-opennmt-tf'  ## TODO
#  'python-numpy'
#  'python-pytest'
#  'python-pytorch'
#  'python-yaml'
#)
#options=('!lto')  ## lto-wrapper fails with CUDA options enabled
source=("git+https://github.com/OpenNMT/CTranslate2.git#tag=v$pkgver"
        'git+https://github.com/jarro2783/cxxopts.git'
        'git+https://github.com/NVIDIA/thrust.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/cpu_features.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/google/ruy.git'
        'git+https://github.com/pytorch/cpuinfo.git'
        'git+https://github.com/NVIDIA/cutlass.git'
        'git+https://github.com/NVIDIA/cub.git')
sha256sums=('84b45680248edeb44887278bdb879bb8abea051392208e7d251e0dcedf20b725'
            'SKIP'
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
  for submodule in cxxopts thrust googletest cpu_features spdlog ruy cutlass; do
    git config submodule."third_party/${submodule}".url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  pushd third_party/ruy
  git submodule init
  git config submodule."cpuinfo".url "$srcdir/cpuinfo"
  git config submodule."googletest".url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
  popd

  pushd third_party/thrust
  git submodule init
  git config submodule."cub".url "$srcdir/cub"
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
    # Only supports up to CUDA 12.4
#    -D WITH_CUDA='ON'
#    -D CUDA_DYNAMIC_LOADING='ON'
#    -D CUDA_ARCH_LIST='Common'
    # hard dependency if enabled, however convolution layers will not be supported on
    # GPU if CUDA is enabled without it
#    -D WITH_CUDNN='ON'
    -D CMAKE_POLICY_VERSION_MINIMUM='3.5'
    -D ENABLE_CPU_DISPATCH='OFF'
#    -D BUILD_TESTS='ON'
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  pushd CTranslate2/python
  CTRANSLATE2_ROOT=.. LIBRARY_PATH="$srcdir/build" python -m build --wheel --no-isolation
  popd

  # AttributeError: 'NoneType' object has no attribute 'endswith'
#  pushd CTranslate2/docs
#  PYTHONPATH="$srcdir/build" python generate.py python
#  sphinx-build . build
#  popd
}

#check() {
#  cd CTranslate2

  # C++ tests, requires BUILD_TESTS='ON'
  # Does not actually build 'ctranslate2_test' to run tests ???
#  ./tests/ctranslate2_test ../tests/data

  # Python tests
#  PYTHONPATH=python pytest python/tests/
#}

package_ctranslate2() {
  pkgdesc="A C++ library for efficient inference with Transformer models."
  depends=(
    # 'onednn'
    'openblas'
    # Implicit
    'gcc-libs'
    'glibc'
  )
#  optdepends=('cuda')
  provides=('libctranslate2.so=4')

  DESTDIR="$pkgdir" cmake --install build

  # Avoid conflict with nlohmann-json
  rm -r "$pkgdir/usr/include/nlohmann"

  install -Dm644 CTranslate2/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-ctranslate2() {
  pkgdesc="A Python library for efficient inference with Transformer models."
  depends=(
    'ctranslate2'
    'python-numpy'
    'python-pytorch'
    'python-setuptools'
    'python-yaml'
    # Implicit
    'python'
    'gcc-libs'
    'glibc'
  )
#  optdepends=('python-pytorch-cuda')

  cd CTranslate2/python
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ctranslate2-docs() {
  pkgdesc+=" (docs)"

  cd CTranslate2
  cp -r docs/build/* "$pkgdir/usr/share/doc/$pkgbase"
}
