# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-jupyter_telemetry
pkgver=0.1.0
pkgrel=3
pkgdesc="Configurable event-logging for Jupyter applications and extensions"
url="https://github.com/jupyter/telemetry"
arch=('any')
license=('BSD-3-Clause')

depends=('python-json-logger' 'python-jsonschema' 'python-ruamel-yaml' 'python-traitlets')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

_pypi=jupyter_telemetry
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'github_pr69.patch::https://patch-diff.githubusercontent.com/raw/jupyter/telemetry/pull/69.patch'
)
sha256sums=(
  '445c613ae3df70d255fe3de202f936bba8b77b4055c43207edf22468ac875314'
  '718458c9ad899e876fc5ab0ffa5e829f60b62e35737052096d4bdbccd8062f58'
)

prepare() {
  cd "$_pypi-$pkgver"
  patch -p2 -i "$srcdir/github_pr69.patch"  # fix for testing with Python 3.12
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver"-*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
