# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_pyname=okta
_upstream_name=okta-sdk-python
pkgname="python-${_pyname}-git"
pkgver=3.4.4.r0.gf6850979
pkgrel=1
pkgdesc='A Python SDK library for the Okta Management APIs'
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
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
  'git'
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

source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed "s/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g"
}


build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-${pkgver//.r*/}"-*.whl
  # Run tests, excluding integration tests (which require an Okta account and credentials)
  test-env/bin/python -m pytest -v tests -k "not integration"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" "dist/$_pyname-${pkgver//.r*/}"-*.whl

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
