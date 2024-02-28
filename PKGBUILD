# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-dask-labextension
pkgdesc='JupyterLab extension for Dask'
url='https://github.com/dask/dask-labextension'
pkgver=7.0.0
pkgrel=1
arch=('any')
license=('BSD-3-Clause')

depends=('jupyterlab' 'python-bokeh' 'python-distributed' 'python-jupyter-server-proxy')
makedepends=('python-build' 'python-hatchling' 'python-hatch-jupyter-builder' 'python-hatch-nodejs-version' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-html')

_pypi=dask_labextension
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'install.json'
)
sha256sums=(
  '45a60bd0ad31c5e425986b7e40a5aa242aa582ea868025ac2b82d0aa16ffcb8a'
  '737a81408211f2e5a6602a04202f31d8210cd5152afcd754302e7ceea4e6a985'
)

prepare() {
  cd "$_pypi-$pkgver"

  # Replace uninstallation instructions with Arch-specific ones.
  cp "$srcdir/install.json" .
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel --skip-dependency-check
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver"*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver"*.whl
  mv "$pkgdir/usr/etc" "$pkgdir/etc"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
