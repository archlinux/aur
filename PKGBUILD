# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_name=sentencepiece
pkgbase="${_name}"
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=0.2.0
pkgrel=5
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache-2.0')
makedepends=('git' 'cmake'
             'abseil-cpp' 'gperftools' 'protobuf'
             'python' 'python-build' 'python-setuptools' 'python-wheel' 'python-installer')
checkdepends=('python-pytest')
_tag='17d7580d6407802f85855d2cc9190634e2c95624' # git rev-parse "v${pkgver}"
source=(
  "${_name}::git+${url}.git#tag=${_tag}"
  "fix-crash-in-unigram-model-training.patch::${url}/commit/d19ac45c919602cb041a86599d0593d24a150ac2.patch"
  "bump-cmake-minimum-required-version.patch::${url}/commit/e2127b9b932ba00811d5023c5ea69a12a857b244.patch"
  "add-missing-cstdint.patch::${url}/commit/c4221363d1f004f85f9cc4096e601d6b1fbfaa84.patch"
)
sha512sums=(
  'SKIP'
  '644bc47fb3b90f2447ae9aac5ff2939fa6c9b3b0dc33550828b8517656f33fb1b41b2ebf9443e4b39a64bb963533c8d7a323b100d0b37671b070b7368f6fb1c7'
  'a4749510e7a4e5c72c60e67e903201d5f6b2224752059481613cb6e0e01c901d0bdbd83553ecc0b916f551e6f37342bab6bf298dfcdd5234129b1645299775b9'
  'b40a61a3185b12d4acd93f854c0ffdd14e13950f1bd860899959e53051bb15f9a11dd0dc635166fd97f706ca41d3d7b1007c44a6d837ce3db94320cf3bfa2c79'
)

pkgver() {
  git -C "${_name}" describe --tags | sed 's/^v//'
}

prepare() {
  cd "${_name}"

  git clean -dfx

  # See https://github.com/google/sentencepiece/pull/1088
  # Should fix test for v0.2.0
  git apply --verbose ../fix-crash-in-unigram-model-training.patch

  # Fix build for CMake 4.0.0+
  git apply --verbose ../bump-cmake-minimum-required-version.patch

  # Fix build for GCC 15
  git apply --verbose ../add-missing-cstdint.patch

  # Use shared libs for python module
  sed -i 's/libsentencepiece.a/libsentencepiece.so/g' python/setup.py
  sed -i 's/libsentencepiece_train.a/libsentencepiece_train.so/g' python/setup.py
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
  depends=('gcc-libs' 'glibc' 'abseil-cpp' 'gperftools' 'protobuf')
  provides=('libsentencepiece.so' 'libsentencepiece_train.so')

  DESTDIR="${pkgdir}" cmake --install "${_name}/build"
}

package_python-sentencepiece() {
  pkgdesc="Python wrapper for SentencePiece"
  depends=("${pkgbase}=${pkgver}-${pkgrel}" 'gcc-libs' 'glibc' 'python')
  optdepends=('python-protobuf')

  cd "${_name}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
