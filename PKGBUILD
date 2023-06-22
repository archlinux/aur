# Maintainer:

_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=2.0.4
pkgrel=2
pkgdesc="Python binding for FFmpeg which provides sync and async APIs"
arch=(any)
url="https://github.com/jonghwanhyeon/python-ffmpeg"
license=('MIT')
options=(!emptydirs)
depends=(
  'ffmpeg'
  'python'
  'python-pyee'
  'python-typing_extensions'
)
makedepends=(
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

if [ x"$_pkgname" == x"$pkgname" ] ; then
  # normal package
  _pkgsrc="$_module-$pkgver"

  source+=(
    "$_module-$pkgver.tar.gz"::"https://github.com/jonghwanhyeon/python-ffmpeg/archive/v$pkgver.tar.gz"
  )
  sha256sums+=(
    'a7977cc3d8658f94a33cd15c5710e008c9e5442df32f57e7df8cbb4ad38a97f3'
  )
else
  # x-git package
  _pkgsrc="$_module"

  makedepends+=('git')

  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  source=(
    "$_module"::"git+https://github.com/jonghwanhyeon/python-ffmpeg"
  )
  sha256sums=(
    'SKIP'
  )

  pkgver() {
    cd "$srcdir/$_pkgsrc"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi

build() {
  cd "$srcdir/$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
