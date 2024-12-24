# Maintainer: blinry <mail@blinry.org>

_pkgname="whisper"
pkgname="$_pkgname-git"
pkgver=2024.09.30.r6.g90db0de1
pkgrel=2
pkgdesc="General-purpose speech-recognition model by OpenAI"
url="https://github.com/openai/whisper"
license=('MIT')
arch=('any')

depends=(
  'ffmpeg'
  'python'
  'python-more-itertools'
  'python-numba'
  'python-pytorch'
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
optdepends=(
  'triton: CUDA accelerated filters' # AUR
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "pr2409.patch"::"https://github.com/openai/whisper/pull/2409.diff"
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
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v([0-9]{4})([0-9]{2})([0-9]{2})-/\1.\2.\3-r/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
