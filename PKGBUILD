# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pytest-jupyterhub
pkgdesc='Reusable pytest plugin for testing JupyterHub components'
pkgver=0.1.0
pkgrel=1
url='https://pytest-jupyterhub.readthedocs.io/'
license=('BSD')
arch=('any')

depends=('jupyterhub' 'python-pytest')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest-asyncio')

_pypi=pytest_jupyterhub
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'fbbff17d873ff5480631cf2299356fb1beef64eda74130f881189deb71cd0696'
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
