# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-translate
pkgdesc="JupyterLab language pack translations helper"
url='https://github.com/jupyterlab/jupyterlab-translate'
pkgver=1.3.3
pkgrel=2
arch=('any')
license=('BSD')

# python-copier tries to import the git command from python-plumbum, which fails
# if git is not installed. This should be in the dependencies of python-copier,
# but put it here for now until that is fixed.
depends=(
  'git' 'nodejs' 'python-babel' 'python-click' 'python-copier'
  'python-copier-templates-extensions' 'python-crowdin-api-client'
  'python-hatchling' 'python-jinja-time' 'python-polib' 'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  '90bb0a0586e5e317432a05d9fe05918bd869c59ae9356cf3557b8f0f2eddfa45'
)

build() {
  cd "${pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname//-/_}-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="$(pwd)/test-env/bin:$PATH" test-env/bin/python -m pytest -v
}

package() {
  cd "${pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
