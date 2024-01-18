# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pip-api
pkgver=0.0.31
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
  '2ebace64e4ca0fbd0c38cdfa39e34655ce45fc209e73bf76b8eb605389ea48893ae891b1a136b6ce29ac7c6291b5192a49cf69b298d909d91ca19c77e385ac0e'
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
