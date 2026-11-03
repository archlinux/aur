# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pytorch-tokenizers
_pkgname=tokenizers
pkgver=1.6.0
# Upstream release/1.6.0 and v1.6.0-rc2 point here. No final v1.6.0 tag exists.
_commit=f54baeab00d5b664bfc4a977b884ff679fd3f15a
_source_dir=$_pkgname-$_commit
pkgrel=1
pkgdesc='Common C++ and Python tokenizers for the PyTorch ecosystem'
arch=('x86_64' 'aarch64')
url='https://github.com/meta-pytorch/tokenizers'
license=('BSD-3-Clause')
# Preserve native wheel bytes and their installed RECORD hashes.
options=('!strip' '!debug')
depends=(
  'abseil-cpp'
  'glibc'
  'libgcc'
  'libstdc++'
  'python>=3.11'
  'python-sentencepiece'
  'python-tiktoken'
  'python-tokenizers'
  're2'
  'sentencepiece'
)
makedepends=(
  'cmake'
  'ninja'
  'pkgconf'
  'pybind11>=3.1.0'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'gtest'
  'python-pytest'
)
optdepends=(
  'python-mistral-common: reference interoperability checks for Tekken tokenizers'
)
_json_commit=e6cafa573aac6ed9227f752a5371c0b3f436307d
_pcre2_commit=7978954dbd2efc6f2196869290553cf1871b4ce6
_sljit_commit=de0259c7aaf36aa40cba8014f3fad3edde9307f9
source=(
  "$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "json-$_json_commit.tar.gz::https://github.com/nlohmann/json/archive/$_json_commit.tar.gz"
  "pcre2-$_pcre2_commit.tar.gz::https://github.com/PCRE2Project/pcre2/archive/$_pcre2_commit.tar.gz"
  "sljit-$_sljit_commit.tar.gz::https://github.com/zherczeg/sljit/archive/$_sljit_commit.tar.gz"
  'use-system-pybind11-and-gtest.patch'
  'Use-declared-system-build-dependencies.patch'
  'use-system-sentencepiece.patch'
  'test-system-libraries.patch'
)
sha256sums=(
  '78a5aabce9e8f478b95095ca22b7faa6e770fc69b349fb41cfb6e043ba64f7ab'
  '0b0fdb7f3065b1bd2c34a6faf369f8e4a19b60832298bab498456dd0a832a730'
  '694f0cd702ea5e1ac2862c75809db6ff22153333d4b1e768b2f9b36c17a2a065'
  '256b50b4e96c806fd13fc9b630f6c1ba41b777e7cedfcf406651d062d8260611'
  'fb6c706c0a728ac3cb9c5751335776d489533568286f7c8be7532452dc80c1ba'
  '88af3b4cacb62c16028e278bd3c161ffd81634eb3a5dba8e03b29e4d96a826d6'
  'f20f96ce2964b22414555d0ad105495cea3bfce6c8f8f2c1192fd959d09510f2'
  'a6635d00306c4bfa25407dd8770cb95f05145d0291923798b24f38b666454fd2'
)

prepare() {
  cd "$_source_dir"

  rm -rf \
    third-party/json \
    third-party/pcre2
  mkdir -p third-party
  cp -a "$srcdir/json-$_json_commit" third-party/json
  cp -a "$srcdir/pcre2-$_pcre2_commit" third-party/pcre2
  rm -rf third-party/pcre2/deps/sljit
  mkdir -p third-party/pcre2/deps
  cp -a "$srcdir/sljit-$_sljit_commit" third-party/pcre2/deps/sljit

  patch -Np1 --fuzz=0 -i "$srcdir/use-system-pybind11-and-gtest.patch"
  patch -Np1 --fuzz=0 -i "$srcdir/Use-declared-system-build-dependencies.patch"
  patch -Np1 --fuzz=0 -i "$srcdir/use-system-sentencepiece.patch"
  patch -Np1 --fuzz=0 -i "$srcdir/test-system-libraries.patch"
}

build() {
  cd "$_source_dir"
  export CMAKE_GENERATOR=Ninja
  python -m build --wheel --no-isolation
}

check() {
  local _source_dir="$srcdir/$_source_dir"
  local _cpp_build="$srcdir/cpp-tests"
  local _test_root="$srcdir/test-work"
  local _test_venv="$srcdir/test-venv"

  rm -rf "$_cpp_build" "$_test_root" "$_test_venv"
  cmake -S "$_source_dir/test" -B "$_cpp_build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "$_cpp_build"
  ctest --test-dir "$_cpp_build" --output-on-failure

  mkdir -p "$_test_root"
  cp -a "$_source_dir/test" "$_test_root/test"
  python -m venv --system-site-packages "$_test_venv"
  "$_test_venv/bin/python" -m installer "$_source_dir"/dist/*.whl
  cd "$_test_root"
  PYTHONDONTWRITEBYTECODE=1 "$_test_venv/bin/python" -m pytest -vv \
    test/test_python_bindings.py \
    test/test_tiktoken.py \
    test/test_tekken_python.py
}

package() {
  cd "$_source_dir"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
