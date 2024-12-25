# Maintainer:

_pkgname="python-openai-whisper"
pkgname="$_pkgname-git"
pkgver=20240930.r6.g90db0de
pkgrel=1
pkgdesc="Robust speech recognition via large-scale weak supervision"
url="https://github.com/openai/whisper"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-more-itertools'
  'python-numba'
  'python-numpy'
  'python-pytorch'
  'python-regex'
  'python-tiktoken'
  'python-tqdm'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=(
  "$_pkgname"
  'whisper'
)

_pkgsrc="openai.whisper"
source=(
  "$_pkgsrc"::"git+$url.git"
  "pr2409-python-3.13.patch"::"https://github.com/openai/whisper/pull/2409.diff"
)
sha256sums=(
  'SKIP'
  '6d40f73edc4dfcdf1fc5a3205170362aa542be721051f7862f9cff8b562f0e55'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local _test_opts=(
    # Deselect tests that need CUDA
    --deselect 'tests/test_timing.py::test_dtw_cuda_equivalence'
    --deselect 'tests/test_timing.py::test_median_filter_equivalence'

    # Deselect tests that take too long
    --deselect 'tests/test_transcribe.py::test_transcribe[medium.en]'
    --deselect 'tests/test_transcribe.py::test_transcribe[medium]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v1]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v2]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v3]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large]'
  )

  cd "$_pkgsrc"
  PYTHONPATH="$PWD" pytest -v -x ${_test_opts[@]}
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
