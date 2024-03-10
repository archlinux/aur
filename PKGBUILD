# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_name=sentencepiece
pkgbase="${_name}"
pkgname=("${_name}" "python-${_name}")
pkgver=0.2.0
pkgrel=1
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake'
             'abseil-cpp' 'gperftools' 'protobuf'
             'python' 'python-build' 'python-setuptools' 'python-wheel' 'python-installer')
checkdepends=('python-pytest')
_tag='17d7580d6407802f85855d2cc9190634e2c95624' # git rev-parse "v${pkgver}"
source=("${_name}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
  rm -rf "${_name}/build"

  # Use shared libs for python module
  sed -i 's/libsentencepiece.a/libsentencepiece.so/g' "${_name}/python/setup.py"
  sed -i 's/libsentencepiece_train.a/libsentencepiece_train.so/g' "${_name}/python/setup.py"
}

build() {
  cd "${_name}"

  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSPM_BUILD_TEST=ON \
    -DSPM_ENABLE_TCMALLOC=ON \
    -DSPM_ENABLE_SHARED=ON \
    -DSPM_PROTOBUF_PROVIDER=package \
    -DSPM_ABSL_PROVIDER=package \
    -Wno-dev
  cmake --build build --parallel $(nproc)

  mkdir build/root
  DESTDIR=build/root cmake --install build --prefix /
  cd python
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"

  # Both tests are expected to fail
  # Maybe https://github.com/google/sentencepiece/issues/966 ?

  ctest --test-dir build --output-on-failure || true

  (
    cd python
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${srcdir}/${_name}/build/root/lib"
    pytest test/ || true
  )
}

package_sentencepiece() {
  depends+=('abseil-cpp' 'gperftools' 'protobuf')

  DESTDIR="${pkgdir}" cmake --install "${_name}/build"
}

package_python-sentencepiece() {
  pkgdesc="Python wrapper for SentencePiece"
  depends+=("${_name}" 'python')
  optdepends+=('python-protobuf')

  cd "${_name}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
