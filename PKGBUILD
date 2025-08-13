# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_name=sentencepiece
pkgbase="${_name}"
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=0.2.1
pkgrel=1
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache-2.0')
makedepends=('git' 'cmake'
             'abseil-cpp' 'gperftools' 'protobuf'
             'python' 'python-build' 'python-setuptools' 'python-wheel' 'python-installer')
checkdepends=('python-pytest')
_tag='31646a467d2051eb904e0b45de3a73e91fe1c1e3' # git rev-parse "v${pkgver}"
source=(
  "${_name}::git+${url}.git#tag=${_tag}"
  'fix-parse-command-line-flags-test.patch'
  'dont-include-data-files-in-python-pkg.patch'
)
sha512sums=(
  'SKIP'
  '7329caa5e824b873e931fd10134e07b8c6bbb0612e5355be0ddf8478677d2cd4e2d725485c51173142fcc35b6c12b869aecca6949291b869f537f4d6c048cc55'
  '86443111c23d1d0f7db27673d8bb34e1a5d7e49e301b0e0978bb32b29cde51a924ff95bd079923f993c8e1180400b4268c39fa500102c99925daaaffeefe90ff'
)

pkgver() {
  git -C "${_name}" describe --tags | sed 's/^v//'
}

prepare() {
  cd "${_name}"

  git clean -dfx

  # https://github.com/google/sentencepiece/issues/1137
  git apply --verbose ../fix-parse-command-line-flags-test.patch

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
