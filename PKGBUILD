# Contributor: reggiiie <reggiiie@tutanota.de>

_gitname="ffmpeg-python"
_pkgname="python-ffmpeg"
pkgname="$_pkgname-git"
pkgver=0.2.0.r41.gdf129c7
pkgrel=1
pkgdesc="Python bindings for FFmpeg - with complex filtering support"
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
  'python-pytest-runner'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py

  for p in "$srcdir"/*.patch ; do
    if [ -e "$p" ] ; then
      patch -Np1 -F100 -i "$p"
    fi
  done
}

build() {
  cd "$srcdir/$_gitname"
  python -m build --no-isolation --wheel
}

check(){
  cd "$srcdir/$_gitname"
  pytest || true
}

package() {
  cd "$srcdir/$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
