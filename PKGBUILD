# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pyname=nbgitpuller
pkgname=jupyter-$_pyname
pkgdesc="Jupyter server extension to sync a git repository one-way to a local path"
url="https://github.com/jupyterhub/nbgitpuller"
pkgver=1.2.0
pkgrel=2
license=('BSD')
arch=('any')
depends=(jupyter-server git)
makedepends=(python-build python-installer python-setuptools python-jupyter-packaging npm)
checkdepends=(python-pytest python-pytest-cov jupyter-notebook)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jupyterhub/$_pyname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5610a50d3fbe53fe4568620a3de225ad33fcdc698f05af83a1f7c1ee2a8b45f5')

prepare() {
  cd "$_pyname-$pkgver"
  # nbgitpuller assumes notebook<7 for compatibility tests
  # `jupyter serverextension` is a legacy command, use `jupyter server extension`
  sed -i 's|"serverextension"|"server", "extension"|' tests/test_api.py

#  sed -i "s|print(f'path: {remote.path}')|print(f'path: {remote.path}');print(remote.git('log'))|" tests/test_api.py
#  sed -i "s|assert r.code == 200|import builtins; builtins.input()|g" tests/test_api.py
}

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pyname-$pkgver"
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
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"{/usr,}/etc

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
