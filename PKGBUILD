# Maintainer:
# Contributor: reggiiie

_module='ffmpeg-python'
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.2.0.r41.gdf129c7
pkgrel=2
pkgdesc="(old) Python bindings for FFmpeg with complex filtering support"
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache-2.0')
arch=(any)

depends=(
  'ffmpeg'
  'python'
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
  'python-pytest-runner'
)

options=(!emptydirs)

provides+=("$_pkgname")
conflicts+=(
  "$_pkgname"
  'python-python-ffmpeg'
)

_pkgsrc="$_module"
source=("$_pkgsrc"::"git+https://github.com/kkroening/ffmpeg-python")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

check(){
  cd "$_pkgsrc"
  pytest || true
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
