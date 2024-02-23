# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pip-api
pkgver=0.0.33
pkgrel=1
pkgdesc="An unofficial, importable pip API"
url="https://github.com/di/pip-api"
license=('Apache-2.0')
arch=('any')
depends=(
  'python-packaging'
  'python-pyparsing'
  'python-pip'
  'python-tomli'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest-runner' 'python-pretend' 'python-virtualenv')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/di/pip-api/archive/$pkgver.tar.gz"
  'skip-unsupported-test.patch'
)

sha512sums=(
  '4f711de7a05209b0aa57ef39fa1e507a171f8b807de0915fdacaef9b0a943e3ba03edb190d6b0a804c3a54e2575c501abe4ab3f27ad50b4b912c7703cb0144e3'
  '41e55d61912e6f010d1087f8883cc2ed1796caaf11a54be950afc5b409ad3ce1f99d7fa9980b83e6b1a4725f9fc402cc213a8f42d71e6f824f9a8fa0442c8d79'
)

prepare() {
  cd pip-api-$pkgver

  # Devendor
  sed -i \
    -e 's/from pip_api\._vendor\./from /' \
    -e 's/from pip_api\._vendor //' \
    pip_api/*.py tests/*.py
  rm -r pip_api/_vendor

  # Mark irrelevant failing test as xfail.
  # This workaround is permanent. Remove it only if upstream ever
  # removes or skips the affected test. For details, see the patch.
  patch -p1 < "${srcdir}/skip-unsupported-test.patch"
}

build() {
  cd pip-api-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pip-api-$pkgver
  python -m pytest
}

package() {
  cd pip-api-$pkgver
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
