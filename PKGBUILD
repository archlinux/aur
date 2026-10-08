# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pip-api
pkgver=0.0.35
pkgrel=1
pkgdesc="An unofficial, importable pip API"
url="https://github.com/di/pip-api"
license=('Apache-2.0')
arch=('any')
depends=(
  'python'
  'python-packaging'
  'python-packaging-legacy'
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/di/pip-api/archive/$pkgver.tar.gz")
sha512sums=('c2ea3935d720e50ea411ff7af0b1431ce1350092f7ab885c3ee2cf44c374d304587accdf658aa2557ca68452240067effbeb42322424a8c8a8c758ac207e45b6')

prepare() {
  cd pip-api-$pkgver

  # Devendor
  sed -i \
    -e 's/from pip_api\._vendor\./from /' \
    -e 's/from pip_api\._vendor //' \
    pip_api/*.py tests/*.py
  rm -r pip_api/_vendor
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
