# Maintainer:
# Contributor: xiretza
# Contributor: getzze
# Contributor: Ke Liu

_module='ffmpeg-python'
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=5
pkgdesc="(old) Python bindings for FFmpeg with complex filtering support"
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

provides=(
  'python-ffmpeg'
)
conflicts=(
  'python-ffmpeg'
  'python-python-ffmpeg'
)

if [ x"$_pkgname" == x"$pkgname" ] ; then
  # normal package
  _pkgsrc="$_module-$pkgver"

  source+=(
    "$_module-$pkgver.tar.gz"::"https://github.com/kkroening/ffmpeg-python/archive/$pkgver.tar.gz"
  )
  sha256sums+=(
    '01b6b7640f00585a404194a358358bdf7f4050cedcd99f41416ac8b27222c9f1'
  )
else
  # x-git package
  _pkgsrc="$_module"

  makedepends+=('git')

  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  source+=(
    "$_module"::"git+https://github.com/kkroening/ffmpeg-python"
  )
  sha256sums+=(
    'SKIP'
  )

  pkgver() {
    cd "$srcdir/$_pkgsrc"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi

prepare() {
  cd "$srcdir/$_pkgsrc"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py
}

build() {
  cd "$srcdir/$_pkgsrc"
  python -m build --no-isolation --wheel
}

check(){
  cd "$srcdir/$_pkgsrc"
  pytest || true
}

package() {
  cd "$srcdir/$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
