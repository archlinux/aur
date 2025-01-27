# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=nbgitpuller
pkgname=jupyter-$_name
pkgver=1.2.2
pkgrel=1
pkgdesc="Jupyter server extension to sync a git repository one-way to a local path"
arch=(any)
url="https://github.com/jupyterhub/nbgitpuller"
license=(BSD-3-Clause)
depends=(
  git
  jupyter-server
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-jupyter-packaging
  npm
)
checkdepends=(
  python-pytest
  python-pytest-cov
  jupyter-notebook
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('f4bb8bf19ad80adf9fa8213768bd72a720e9d1f5b21281a1fbff5c7ac9c7d5e0399ff6671545d29dcdd61bf34e52b2f5fd028096d4ae703ed837d7128ccbfb77')

prepare() {
  cd $_name-$pkgver
  # nbgitpuller assumes notebook<7 for compatibility tests
  # `jupyter serverextension` is a legacy command, use `jupyter server extension`
  sed -i 's|"serverextension"|"server", "extension"|' tests/test_api.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_name-$pkgver
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
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"{/usr,}/etc

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
