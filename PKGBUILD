# Maintainer: blinry <mail@blinry.org>

_pkgname="whisper"
pkgname="$_pkgname-git"
pkgver=r115.248b6cb
pkgrel=1
pkgdesc="General-purpose speech recognition model by OpenAI"
arch=('any')
url="https://github.com/openai/whisper"
license=('MIT')
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

provides=("$_pkgname")
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/whisper"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/whisper"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
