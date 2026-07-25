# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_pyname=okta-jwt-verifier
_upstream_name=okta-jwt-verifier-python
_whl_name=${_pyname//-/_}
pkgname="python-${_pyname}"
pkgver=0.5.0
pkgrel=1
pkgdesc='Okta JWT Verifier for Python'
arch=('any')
license=('Apache-2.0')
url="https://github.com/okta/okta-jwt-verifier-python"

depends=(
  'python'
  'python-acachecontrol'
  'python-pyjwt'
  'python-requests'
  'python-retry' # This package installs retry2
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-setuptools'
)
checkdepends=(
  'python-cryptography'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
)

source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('c3b779f019770c5c84023002033bdec3760d6f33de2ac0d9903703f943390a6bc304255b6a3b1fcd76b9abc08e97469bd0f95949755c25280af86059789733b0')


build() {
  cd "$_upstream_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_upstream_name-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_whl_name-$pkgver"-*.whl
  # Run tests, integration tests are automatically skipped if the required environment variables are not set
  test-env/bin/python -m pytest -v tests
}

package() {
  cd "$_upstream_name-$pkgver"

  python -m installer --destdir="$pkgdir" "dist/$_whl_name-$pkgver"-*.whl

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
