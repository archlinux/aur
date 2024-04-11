# Maintainer:

_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=2.0.11.r0.gc0c4787
pkgrel=1
pkgdesc="Python binding for FFmpeg which provides sync and async APIs"
url="https://github.com/jonghwanhyeon/python-ffmpeg"
license=('MIT')
arch=(any)

depends=(
  'ffmpeg'
  'python'
  'python-pyee'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pytest-runner'
  'python-setuptools'
  'python-wheel'
)

provides=(
  'python-ffmpeg'
)
conflicts=(
  'python-ffmpeg'
  'python-ffmpeg-python'
)

options=(!emptydirs)

_pkgsrc="$_module"

provides+=("$_pkgname=${pkgver%%.r*}")
conflicts+=("$_pkgname")

source=("$_module"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
