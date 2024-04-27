# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pyname=nbgitpuller
pkgname=jupyter-$_pyname
pkgdesc="Jupyter server extension to sync a git repository one-way to a local path"
url="https://github.com/jupyterhub/nbgitpuller"
pkgver=1.2.1
pkgrel=2
license=(BSD-3-Clause)
arch=(any)
depends=(jupyter-server git)
makedepends=(python-build python-installer python-setuptools python-jupyter-packaging npm)
checkdepends=(python-pytest python-pytest-cov jupyter-notebook)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6808fadcf57ace9da967aca441a397e764f20adb0b5fffd2cac62e769cd655a2')

prepare() {
  cd $_pyname-$pkgver
  # nbgitpuller assumes notebook<7 for compatibility tests
  # `jupyter serverextension` is a legacy command, use `jupyter server extension`
  sed -i 's|"serverextension"|"server", "extension"|' tests/test_api.py
}

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # NOTE: system-wide jupyter does not find nbgitpuller installed in the venv
  test-env/bin/pip install --no-dependencies --force-reinstall jupyter-core jupyter-server notebook

  # NOTE: the venv must be activated for the tests to run jupyter from the venv
  source test-env/bin/activate
  test-env/bin/python -m pytest -v
  deactivate
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"{/usr,}/etc

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
