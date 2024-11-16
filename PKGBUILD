# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-fudgeo
pkgdesc='OGC GeoPackage support via Python and SQLite'
url='https://github.com/realiii/fudgeo'
pkgver=0.8.1
pkgrel=1
arch=('any')
license=('MIT')

depends=(
  'python-bottleneck'
  'python-numpy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

source=(
  "fudgeo-$pkgver.tar.gz::https://github.com/realiii/fudgeo/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '92afda8f33fa1a86403a6123387f52154659422e9524a139c6c0fef757443cea'
)

build() {
  cd "fudgeo-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "fudgeo-$pkgver/tests"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "../dist/fudgeo-$pkgver"*.whl
  test-env/bin/python -m pytest --ignore geometry/test_geometry.py
}

package() {
  cd "fudgeo-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/fudgeo-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
