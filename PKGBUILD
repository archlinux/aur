# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-jupyter_telemetry
pkgver=0.1.0
pkgrel=2
pkgdesc="Configurable event-logging for Jupyter applications and extensions"
url="https://github.com/jupyter/telemetry"
arch=('any')
license=('BSD')

depends=('python-json-logger' 'python-jsonschema' 'python-ruamel-yaml' 'python-traitlets')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

_pypi=jupyter_telemetry
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '445c613ae3df70d255fe3de202f936bba8b77b4055c43207edf22468ac875314'
)

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
