# Maintainer: blinry <mail@blinry.org>

_pkgname="whisper"
pkgname="$_pkgname-git"
pkgver=2023.11.17.r2.gba3f3cd5
pkgrel=1
pkgdesc="General-purpose speech-recognition model by OpenAI"
url="https://github.com/openai/whisper"
license=('MIT')
arch=('any')

depends=(
  'python-more-itertools'
  'python-numba'
  'python-pytorch'
  'python-tqdm'

  # AUR
  'python-tiktoken'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  # AUR
  'triton: CUDA accelerated filters'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v([0-9]{4})([0-9]{2})([0-9]{2})-/\1.\2.\3-r/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  depends+=(
    'ffmpeg'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
