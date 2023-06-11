# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-translate
pkgdesc="JupyterLab language pack translations helper"
url='https://github.com/jupyterlab/jupyterlab-translate'
pkgver=1.3.2
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
  '75dca8f73552b86fb8d33268722630429c8f85a247a93f2ff3097d92a8990eaf'
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
