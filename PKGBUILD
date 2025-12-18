# Maintainer: David Jetelina <sour.soap5197@jtl.email>
# namcap: ignore deps
pkgname=python-yaucl
pkgver=0.2.0
pkgrel=1
pkgdesc="yet another user config library..."
arch=('any')
url="https://github.com/djetelina/yaucl"
license=('MIT')
depends=('python' 'python-platformdirs')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5092914331c30d03b3426cf0a04e1cbd8d5712e4ed545a8c1e82d67a5862b553')

build() {
  cd "yaucl-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "yaucl-$pkgver"

  # install the built wheel into a temp root
  python -m installer --destdir="$srcdir/check-root" dist/*.whl

  local pyver
  pyver="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"

  export PYTHONPATH="$srcdir/check-root/usr/lib/python$pyver/site-packages"

  pytest -q
}

package() {
  cd "yaucl-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license (recommended)
  install -vDm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" || true
}
