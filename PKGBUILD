# Maintainer:

_pkgname="spleeter"
pkgname="$_pkgname-git"
pkgver=2.3.0.r57.g0b26dec
pkgrel=1
pkgdesc="Fast and efficient music source separation tool and Deezer library with pretrained models"
# https://research.deezer.com/projects/spleeter.html
url="https://github.com/deezer/spleeter"
arch=('any')
license=('MIT')

depends=(
  'python-httpx'
  'python-numpy'
  'python-pandas'
  'python-tensorflow'
  'python-typer'

  # AUR
  'python-ffmpeg'
  'python-norbert'
  'python-musdb'
      # python-soundfile
      # python-stempeg
  'python-museval'
      # python-musdb
      # python-soundfile
      # python-stempeg
          # python-soundfile
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)

provides=(
  "$_pkgname"
  'spleeter2'
)
conflicts=(${provides[@]})

options=("!strip")

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install LICENSE
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # remove incorrectly installed LICENSE file
  _pyver=$(python --version | sed -E 's@^Python\ ([0-9]+\.[0-9]+)(\.[0-9]+)?$@\1@')
  rm -f "$pkgdir/usr/lib/python$_pyver/site-packages/LICENSE"
} 
