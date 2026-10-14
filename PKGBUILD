# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=(
  'ctranslate2'
  'python-ctranslate2'
)
pkgbase=ctranslate2
pkgver=4.8.3
pkgrel=1
pkgdesc="A C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
makedepends=(
  'cmake'
  'ninja'
  'git'
  'openblas'
  'pybind11'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+https://github.com/OpenNMT/CTranslate2.git#tag=v$pkgver"
        'git+https://github.com/jarro2783/cxxopts.git'
        'git+https://github.com/google/cpu_features.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/google/ruy.git'
        'git+https://github.com/pytorch/cpuinfo.git')
sha256sums=('b9261d99550030a626a2bb4bb12dd66d832c1e04da7f0f7032cf641de0794433'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd CTranslate2
  for submodule in cxxopts cpu_features spdlog ruy; do
    git submodule init "third_party/${submodule}"
    git config submodule."third_party/${submodule}".url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  pushd third_party/ruy
  git submodule init third_party/cpuinfo
  git config submodule."cpuinfo".url "$srcdir/cpuinfo"
  git -c protocol.file.allow=always submodule update
  popd

  git clean python -dfx

  # Relax pybind11 version
  sed -i 's/pybind11==[0-9.]*/pybind11/' python/pyproject.toml

  # Remove the /usr/local RUNPATH from the Python extension
  sed -i '/-Wl,-rpath/d' python/setup.py
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
    -D CMAKE_POLICY_VERSION_MINIMUM='3.5'
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  pushd CTranslate2/python
  CTRANSLATE2_ROOT=.. LIBRARY_PATH="$srcdir/build" python -m build --wheel --no-isolation
  popd
}

package_ctranslate2() {
  pkgdesc="A C++ library for efficient inference with Transformer models."
  depends=(
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

package_python-ctranslate2() {
  pkgdesc="A Python library for efficient inference with Transformer models."
  depends=(
    'ctranslate2'
    'python-numpy'
    'python-yaml'
    'python'
    'libgcc'
    'glibc'
    'libstdc++'
  )
  optdepends=(
    'python-pytorch: model converters'
    'python-transformers: Hugging Face model converter'
  )

  cd CTranslate2/python
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
