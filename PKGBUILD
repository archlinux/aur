# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'ctranslate2'
  'python-ctranslate2'
#  'ctranslate2-docs'
)
pkgbase=ctranslate2
pkgver=4.6.0
pkgrel=3
pkgdesc="A C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://opennmt.net/CTranslate2"
license=('MIT')
makedepends=(
  'cmake'
  'cuda'
#  'cudnn'
  'gcc14'
  'git'
  'intel-oneapi-mkl'
  'onednn'
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
options=('!lto')  ## lto-wrapper fails with CUDA options enabled
source=("git+https://github.com/OpenNMT/CTranslate2.git#tag=v$pkgver"
        'git+https://github.com/jarro2783/cxxopts.git'
        'git+https://github.com/NVIDIA/thrust.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/cpu_features.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/google/ruy.git'
        'git+https://github.com/pytorch/cpuinfo.git'
        'git+https://github.com/NVIDIA/cub.git')
sha256sums=('78111a078f17b809274c3adf00ffa33c35c729f82bde17c64e091ebc5bd1b400'
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
  for submodule in cxxopts thrust googletest cpu_features spdlog ruy; do
    git config submodule.src/third_party/${submodule}.url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  pushd third_party/ruy
  git submodule init
  git config submodule.src/third_party/cpuinfo.url "$srcdir/cpuinfo"
  git config submodule.src/third_party/googletest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
  popd

  pushd third_party/thrust
  git submodule init
  git config submodule.dependencies/cub.url "$srcdir/cub"
  git -c protocol.file.allow=always submodule update
  popd
}

build() {

  ## WITH_CUDNN='ON'
  # hard dependency if enabled, however convolution layers will not be supported on
  # GPU if CUDA is enabled without it

  cmake -B build -S CTranslate2 \
    -DCMAKE_C_COMPILER='gcc-14' \
    -DCMAKE_CXX_COMPILER='g++-14' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DOPENMP_RUNTIME='COMP' \
    -DWITH_MKL='OFF' \
    -DWITH_DNNL='OFF' \
    -DWITH_OPENBLAS='ON' \
    -DOPENBLAS_INCLUDE_DIR='/usr/include/openblas' \
    -DWITH_RUY='ON' \
    -DWITH_CUDA='ON' \
    -DCUDA_DYNAMIC_LOADING='ON' \
    -DCUDA_ARCH_LIST='Common' \
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5' \
    -DENABLE_CPU_DISPATCH='OFF' \
    -Wno-dev
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
    'nlohmann-json'
    'onednn'
    'openblas'
  )
  optdepends=('cuda')
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
  )
  optdepends=('python-pytorch-cuda')

  cd CTranslate2/python
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

#package_ctranslate2-docs() {
#  pkgdesc+=" (docs)"

#  cd CTranslate2
#  cp -r docs/build/* "$pkgdir/usr/share/doc/$pkgbase"
#}
