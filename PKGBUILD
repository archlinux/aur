# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-fudgeo
pkgdesc='OGC GeoPackage support via Python and SQLite'
url='https://github.com/realiii/fudgeo'
pkgver=1.5.7
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
  '90d0fca99b04d6e570deefee1348b2e0f6c01b4bacf9ece8f58609ba2a3e4e66'
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
    -k 'not test_copy_feature_class and not test_explode_feature_class and not test_add_remove_index'
}

package() {
  cd fudgeo
  python -m installer --destdir="$pkgdir" "dist/fudgeo-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
