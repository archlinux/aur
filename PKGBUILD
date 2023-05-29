# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pip-api
pkgver=0.0.30
pkgrel=2
pkgdesc="An unofficial, importable pip API"
url="https://github.com/di/pip-api"
license=('Apache')
arch=('any')
depends=('python-packaging' 'python-pyparsing' 'python-pip')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest-runner' 'python-pretend' 'python-virtualenv')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/di/pip-api/archive/$pkgver.tar.gz"
  'skip-unsupported-tests.patch'
)

sha512sums=(
  '0fa69d55c919f2985c0acfdc719eff0a89ac065df8eca84d518a5ed0bcfb3a79c559002441041ef3382ca60a4d6c8bd991fd71316cd4e4d1643a3e084ed60f89'
  'de12a6edf6c6c37f5da4b192631d9d633b798e8585d8f57000425a6a15110b7ab855476895019a09a204d285e411955560691a67a6306d3ce2f9d0d5b95b2849'
)

prepare() {
  cd pip-api-$pkgver

  # Devendor
  sed -i 's/pip_api._vendor.//' pip_api/*.py tests/*.py
  rm -r pip_api/_vendor

  # Mark and skip irrelevant failing tests.
  # This workaround is permanent. Remove it only if upstream ever
  # removes both affected tests. For details, see the patch file.
  patch -p1 < "${srcdir}/skip-unsupported-tests.patch"
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
