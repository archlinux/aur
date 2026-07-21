# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_name=sentencepiece
pkgbase="${_name}"
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=0.2.2
pkgrel=2
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache-2.0')
makedepends=(
  'git'
  'cmake'
  # For sentencepiece
  'abseil-cpp'
  'gperftools'
  'protobuf'
  # For python-sentencepiece
  'python'
  'python-build'
  'python-setuptools'
  'python-wheel'
  'pybind11'
  'python-installer'
)
checkdepends=(
  'python-pytest'
  'python-protobuf'
)
source=(
  "${_name}::git+${url}.git#tag=v${pkgver}"
  'dont-include-data-files-in-python-pkg.patch'
)
sha512sums=(
  '8a1b21e382b7e4649e406ed6d9cc2121df12c4c8b3e35524eaedc794539d1031afbd06e826aa25463ceb71ed556b2a4cd804253c4eb012b6ceca9ba79e644f42'
  '6fd675cf0187c2ddc0919e7c1aeb47768d4e3a0d7d8613215896678d489fb815de8473f6e6d6b611b4c269f135f7feca5c70b69c9e331123026caa3cd1afd871'
)

prepare() {
  cd "${_name}"

  git clean -dfx

  # Make sure we use system packages
  rm -rf src/builtin_pb third_party/{abseil-cpp,protobuf-lite}

  # The base pkg includes data already
  git apply --verbose ../dont-include-data-files-in-python-pkg.patch

  # Use shared libs for python module
  sed -i 's/libsentencepiece.a/libsentencepiece.so/g' python/setup.py
  sed -i 's/libsentencepiece_train.a/libsentencepiece_train.so/g' python/setup.py
}

build() {
  cd "${_name}"

  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DSPM_BUILD_TEST=ON \
    -DSPM_ENABLE_TCMALLOC=ON \
    -DSPM_ENABLE_SHARED=ON \
    -DSPM_DISABLE_EMBEDDED_DATA=OFF \
    -DSPM_PROTOBUF_PROVIDER=package \
    -DSPM_ABSL_PROVIDER=package \
    -Wno-dev
  cmake --build build --parallel "$(nproc)"

  mkdir build/root
  DESTDIR=build/root cmake --install build --prefix /
  cd python
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"

  ctest --test-dir build --output-on-failure

  (
    cd python
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${srcdir}/${_name}/build/root/lib"
    pytest test/
  )
}

package_sentencepiece() {
  depends=('libgcc' 'libstdc++' 'glibc' 'abseil-cpp' 'gperftools' 'protobuf')
  provides=('libsentencepiece.so' 'libsentencepiece_train.so')

  DESTDIR="${pkgdir}" cmake --install "${_name}/build"
}

package_python-sentencepiece() {
  pkgdesc="Python wrapper for SentencePiece"
  depends=("${pkgbase}=${pkgver}-${pkgrel}" 'libgcc' 'libstdc++' 'glibc' 'python')
  optdepends=(
    'python-numpy'
    'python-protobuf'
  )

  cd "${_name}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
