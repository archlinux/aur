# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-translate
pkgdesc="JupyterLab language pack translations helper"
url='https://github.com/jupyterlab/jupyterlab-translate'
pkgver=1.3.5
pkgrel=1
arch=('any')
license=('BSD-3-Clause')

depends=(
  'nodejs' 'python-babel' 'python-click' 'python-copier'
  'python-copier-templates-extensions' 'python-crowdin-api-client'
  'python-hatchling' 'python-polib' 'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  '4954fb5fb928ae272d33facd81e30e3aab48a569b00596e82775b5850a7c4c89'
)

prepare() {
  cd "${pkgname//-/_}-$pkgver"
  sed -i '/pydantic<2.0.0/d' pyproject.toml
  sed -i '/jinja2-time/d' pyproject.toml
}

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
