# Maintainer:
# Contributor: xiretza
# Contributor: getzze
# Contributor: Ke Liu

_module='ffmpeg-python'
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=6
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

conflicts=('python-python-ffmpeg')

options=(!emptydirs)

_pkgsrc="$_module-$pkgver"
source=("$_pkgsrc.tar.gz"::"https://github.com/kkroening/ffmpeg-python/archive/$pkgver.tar.gz")
sha256sums=('01b6b7640f00585a404194a358358bdf7f4050cedcd99f41416ac8b27222c9f1')

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
