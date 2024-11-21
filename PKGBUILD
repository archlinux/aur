# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator
pkgdesc="Authenticator for storing users in the JupyterHub database"
pkgver=1.3.0
pkgrel=1
url="https://github.com/jupyterhub/nativeauthenticator"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'jupyterhub'
  'python-bcrypt'
  'python-onetimepass'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'jupyter-notebook'
)

_pyname="${pkgname/-/_}"
source=(
  "https://files.pythonhosted.org/packages/source/j/$pkgname/$_pyname-$pkgver.tar.gz"
)
sha256sums=(
  '67d49d6a04658494a658466dbe4c6418b68ae6577324855afe5fc8abdf86ef89'
)

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Don't package the unit tests.
  rm -rf "$pkgdir/"usr/lib/python*/site-packages/nativeauthenticator/tests
}
