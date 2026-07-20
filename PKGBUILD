# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>
# Contributor: Chris Snell <chris dot snell at gmail.com>

_pyname=okta
_upstream_name=okta-sdk-python
pkgname="python-${_pyname}"
pkgver=3.4.4
pkgrel=1
pkgdesc='A Python SDK library for the Okta Management APIs'
arch=('any')
license=('Apache-2.0')
url="https://github.com/okta/okta-sdk-python"

depends=(
  'python'
  'python-aenum'
  'python-aiohttp'
  'python-blinker'
  'python-dateutil'
  'python-jwcrypto'
  'python-pycryptodomex'
  'python-pydantic'
  'python-pydash'
  'python-pyjwt'
  'python-requests'
  'python-xmltodict'
  'python-yaml'
)

optdepends=(
  'python-pillow: for image processing support'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-mock'
  'python-pytest-randomly'
  'python-pytest-recording'
)

source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('d4e59567dd395688add1dab28fc8bb9eaf4e9192dc912acd320d4c327b2f083d68a1239c382aa8bc624a001d83aa892faf6abbabad527aeace1e023ad0621c70')


build() {
  cd "$_upstream_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_upstream_name-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  # Run tests, excluding integration tests (which require an Okta account and credentials)
  test-env/bin/python -m pytest -v tests -k "not integration"
}

package() {
  cd "$_upstream_name-$pkgver"

  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
