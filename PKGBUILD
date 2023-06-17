# Maintainer:
# Contributor: reggiiie

_module="ffmpeg-python"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.2.0.r41.gdf129c7
pkgrel=1
pkgdesc="Python bindings for FFmpeg with complex filtering support"
arch=(any)
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache')
options=(!emptydirs)
depends=(
  'ffmpeg'
  'python-future'
  'python-graphviz'
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
  'python-pytest-mock'
)

provides=(
  "$_pkgname"
  'python-ffmpeg'
)
conflicts=(
  ${provides[@]}
  'python-python-ffmpeg'
)

source=(
  "$_module"::"git+https://github.com/kkroening/ffmpeg-python"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_module"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_module"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py
}

build() {
  cd "$srcdir/$_module"
  python -m build --no-isolation --wheel
}

check(){
  cd "$srcdir/$_module"
  pytest || true
}

package() {
  cd "$srcdir/$_module"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
