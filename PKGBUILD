# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pytorch-tokenizers
_pkgname=tokenizers
pkgver=1.5.0
pkgrel=1
pkgdesc='Common C++ and Python tokenizers for the PyTorch ecosystem'
arch=('x86_64')
url='https://github.com/meta-pytorch/tokenizers'
license=('BSD-3-Clause')
options=('!debug')
depends=(
  'abseil-cpp'
  'glibc'
  'libgcc'
  'libstdc++'
  'python'
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
  'pybind11'
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
_pcre2_commit=2e03e323339ab692640626f02f8d8d6f95bff9c6
_sljit_commit=98802d939be3f0ccc2c538d611ec4c728564e8cf
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "json-$_json_commit.tar.gz::https://github.com/nlohmann/json/archive/$_json_commit.tar.gz"
  "pcre2-$_pcre2_commit.tar.gz::https://github.com/PCRE2Project/pcre2/archive/$_pcre2_commit.tar.gz"
  "sljit-$_sljit_commit.tar.gz::https://github.com/zherczeg/sljit/archive/$_sljit_commit.tar.gz"
  'use-system-pybind11-and-gtest.patch'
  'Use-declared-system-build-dependencies.patch'
  'use-system-sentencepiece.patch'
  'test-system-libraries.patch'
)
sha256sums=(
  '6ecd53de4d595f8072e66bfd58e6f4728237ac03bceee190dd07f80771d29837'
  '0b0fdb7f3065b1bd2c34a6faf369f8e4a19b60832298bab498456dd0a832a730'
  'd2bab343b55525fdfe322db020720bd84afc8233d5d428165eec4135aad85761'
  '5e91c146ab328fd915a03198d6b88a74a696e4ac17abedee34a90bea516e708a'
  'de31ec275842ff39a2405a6d3d6461094f21baab7935c20945cdfac6b18bd54b'
  'b419022b3e1e0b0632b2ae0107125efe36694660c595a072d5c1f37f3796cf57'
  'f20f96ce2964b22414555d0ad105495cea3bfce6c8f8f2c1192fd959d09510f2'
  'a6635d00306c4bfa25407dd8770cb95f05145d0291923798b24f38b666454fd2'
)

prepare() {
  cd "$_pkgname-$pkgver"

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
  cd "$_pkgname-$pkgver"
  export CMAKE_GENERATOR=Ninja
  python -m build --wheel --no-isolation
}

check() {
  local _source_dir="$srcdir/$_pkgname-$pkgver"
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
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
