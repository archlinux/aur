# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'ctranslate2'
  'python-ctranslate2'
#  'ctranslate2-docs'
)
pkgbase=ctranslate2
pkgver=3.24.0
pkgrel=1
pkgdesc="A C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://opennmt.net/CTranslate2"
license=('MIT')
makedepends=(
  'cmake'
#  'cuda'
#  'cudnn'
  'git'
  'intel-oneapi-mkl'
  'onednn'
#  'openblas'
  'pybind11'
  'python-build'
  'python-installer'
#  'python-myst-parser'
  'python-setuptools'
#  'python-sphinx'
#  'python-sphinx_rtd_theme'
  'python-wheel'
)
#checkdepends=(
#  'python-opennmt-tf'  # TODO
#  'python-numpy'
#  'python-pytest'
#  'python-pytorch'
#  'python-yaml'
#)
_commit=c95fd4e4f8c775e6a8248fea9f7ab313c170e8dd  # tags/3.24.0^0
source=("git+https://github.com/OpenNMT/CTranslate2.git#commit=$_commit"
        'git+https://github.com/jarro2783/cxxopts.git'
        'git+https://github.com/NVIDIA/thrust.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/cpu_features.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/google/ruy.git'
        'git+https://github.com/pytorch/cpuinfo.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd CTranslate2
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd CTranslate2
  git submodule init
  for submodule in cxxopts thrust googletest cpu_features spdlog ruy; do
    git config submodule.src/third_party/"$submodule".url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update

  cd third_party/ruy
  git submodule init
  git config submodule.src/third_party/cpuinfo.url "$srcdir/cpuinfo"
  git config submodule.src/third_party/googletest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {

  ## WITH_CUDA='ON'
  ## CUDA_DYNAMIC_LOADING='ON'
  ## CUDA_ARCH_LIST='Common'
  ## WITH_CUDNN='ON'
  # v12 not supported, fails to build
  # https://github.com/OpenNMT/CTranslate2/issues/1250

  ## WITH_OPENBLAS='ON'
  # CMake Error at CMakeLists.txt:396 (message):
  # OpenBLAS include directory not found

  cmake -B build -S CTranslate2 \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DOPENMP_RUNTIME='COMP' \
    -DWITH_MKL='ON' \
    -DWITH_DNNL='ON' \
    -DWITH_RUY='ON' \
    -Wno-dev
  cmake --build build

  pushd CTranslate2/python
  CTRANSLATE2_ROOT=.. LIBRARY_PATH="$srcdir/build" python -m build --wheel --no-isolation
  popd

#  pushd CTranslate2/docs
#  PYTHONPATH="$srcdir/build" python generate.py python
#  sphinx-build . build
#  popd
}

#check() {
#  cd CTranslate2
#  PYTHONPATH=python pytest python/tests/
#}

package_ctranslate2() {
  pkgdesc="A C++ library for efficient inference with Transformer models."
  depends=('nlohmann-json' 'onednn')
  provides=('libctranslate2.so=3')

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

  cd CTranslate2/python
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

#package_ctranslate2-docs() {
#  pkgdesc+=" (docs)"

#  cd CTranslate2
#  cp -r docs/build/* "$pkgdir/usr/share/doc/$pkgbase"
#}
