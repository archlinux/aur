# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-fudgeo
pkgdesc='OGC GeoPackage support via Python and SQLite'
url='https://github.com/realiii/fudgeo'
pkgver=1.5.9
pkgrel=1
arch=('any')
license=('MIT')

depends=(
  'python-bottleneck'
  'python-numpy'
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
  'python-shapely'
)

source=(
  "git+https://github.com/realiii/fudgeo.git#tag=v$pkgver"
)
sha256sums=(
  '5d04c05a93a783a9bac1c7ded6d3ce691de3996b0c2498a506c159fab81338c0'
)

build() {
  cd fudgeo
  python -m build --no-isolation --wheel
}

check() {
  cd fudgeo/tests
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "../dist/fudgeo-$pkgver"*.whl
  test-env/bin/python -m pytest \
    --ignore geometry/test_geometry.py \
    -k 'not test_copy_feature_class and not test_explode_feature_class and not test_add_remove_index and not test_performance and not test_create_feature_with_spatial_index_empty_qgis'
}

package() {
  cd fudgeo
  python -m installer --destdir="$pkgdir" "dist/fudgeo-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
