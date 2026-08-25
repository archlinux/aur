pkgname=python-asyncinotify
pkgver=4.4.4
pkgrel=1
pkgdesc='A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features'
arch=(any)
url='https://github.com/ProCern/asyncinotify'
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-flit-core'
)
source=(
  "https://pypi.io/packages/source/a/asyncinotify/asyncinotify-$pkgver.tar.gz"
  patch
  "https://github.com/ProCern/asyncinotify/raw/refs/tags/v$pkgver/test.py"
)
sha256sums=(
  'a8afc92bec6666807ca50524156fca22655325cba6e2b51d842b8ec0d399c708'
  'f33b30bbe31549d91bb6a2d6df8f16afef1d3050c08c8a51772f8edd244c65e4'
  'a6f55b0beae227918a08e1414660565ff753aaf004a88f3fd2b1ac915a2d292d'
)

build() {
  cd "$srcdir/asyncinotify-$pkgver"
  patch -p0 < "$srcdir/patch"
  python -m build --no-isolation --wheel
}

check() {
  cd "$srcdir/asyncinotify-$pkgver"
  rm -rf ./test-install || true
  python -m installer --destdir=./test-install "./dist/"*".whl"
  PYTHONPATH="./test-install/usr/lib/python$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages" python "$srcdir/test.py"
}

package() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
