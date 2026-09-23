# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=python-pyslm
_name=pyslm
pkgver=0.6.1
pkgrel=1
pkgdesc="Python library for additive manufacturing and 3D printing development (slicing, hatching, support generation)"
arch=('any')
url="https://github.com/drlukeparry/pyslm"
license=('LGPL-2.1-only')
depends=('python' 'python-matplotlib' 'python-networkx' 'python-numpy' 'python-pyclipr'
         'python-rtree' 'python-scikit-image' 'python-scipy' 'python-shapely'
         'python-trimesh')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-requests')
checkdepends=('python-pytest')
optdepends=('python-manifold3d: support structure generation (mesh boolean operations)'
            'python-mapbox-earcut: support structure generation (polygon triangulation)'
            'python-triangle: support structure generation (constrained triangulation)'
            'python-vispy: support structure generation (OpenGL depth rendering)'
            'python-pyqt5: vispy rendering backend')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('98a4582924d4a8dab5b9281a58421d9a6a649d6a81faab67ca294f34200fab5a')

prepare() {
  cd "$_name-$pkgver"
  # Upstream's wheel include list drops examples/, models/ and docs/ into the top level
  # of site-packages; ship only the pyslm package (examples go to /usr/share/doc)
  sed -i '/^\[tool.hatch.build.targets.wheel\]/,/^\]/c\[tool.hatch.build.targets.wheel]\npackages = ["pyslm"]' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  local _site="$PWD/test-site"
  rm -rf "$_site"
  python -m installer --destdir="$_site" dist/*.whl
  local _pydir=$(python -c 'import site; print(site.getsitepackages()[0])')
  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 PYTHONPATH="$_site$_pydir" python -m pytest -p no:cacheprovider tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r --no-preserve=ownership examples models README.rst CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
