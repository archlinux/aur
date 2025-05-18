# Maintainer:

_pkgname="python-openai-whisper"
pkgname="$_pkgname-git"
pkgver=20240930.r14.gdd985ac
pkgrel=1
pkgdesc="Robust speech recognition via large-scale weak supervision"
url="https://github.com/openai/whisper"
license=('MIT')
arch=('any')

depends=(
  'ffmpeg'
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
conflicts=("$_pkgname")

_pkgsrc="openai.whisper"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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
    ## Deselect tests that need CUDA
    --deselect 'tests/test_timing.py::test_dtw_cuda_equivalence'
    --deselect 'tests/test_timing.py::test_median_filter_equivalence'

    ## Deselect tests that take too long
    #--deselect 'tests/test_transcribe.py::test_transcribe[tiny.en]'
    --deselect 'tests/test_transcribe.py::test_transcribe[tiny]'
    #--deselect 'tests/test_transcribe.py::test_transcribe[base.en]'
    --deselect 'tests/test_transcribe.py::test_transcribe[base]'
    #--deselect 'tests/test_transcribe.py::test_transcribe[small.en]'
    --deselect 'tests/test_transcribe.py::test_transcribe[small]'
    --deselect 'tests/test_transcribe.py::test_transcribe[medium.en]'
    --deselect 'tests/test_transcribe.py::test_transcribe[medium]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v1]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v2]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v3]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large-v3-turbo]'
    --deselect 'tests/test_transcribe.py::test_transcribe[large]'
    --deselect 'tests/test_transcribe.py::test_transcribe[turbo]'
  )

  cd "$_pkgsrc"
  PYTHONPATH="$PWD" pytest -v -x ${_test_opts[@]}
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
