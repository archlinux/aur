# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranopkgcheck
pkgver=0.3.0
pkgrel=7
pkgdesc='Murano package validator tool'
arch=(any)
url='https://docs.openstack.org/murano-pkg-check/'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-yaml python-yaql python-six
         python-stevedore python-semantic-version python-oslo-i18n)
checkdepends=(python-subunit python-oslotest python-oslotest
              python-testrepository python-testscenarios python-testtools
              python-stestr python-mock)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/murano-pkg-check/archive/$pkgver.tar.gz")
sha512sums=('1cc99cb6131d2c30f09405e443d41f577c217cd49bfef60f76882509f90711ddd75803e8e26b4a91392724f6cf6364d86b8aa38d03b0d04dcabb424c3ad5c098')

export PBR_VERSION=$pkgver

build() {
  cd murano-pkg-check
  python setup.py build
}

check() {
  cd murano-pkg-check
  #stestr run
  sed -i 's/cases.extend(list(yaml.load_all(f)))/cases.extend(list(yaml.load_all(f, yaml.SafeLoader)))/g' muranopkgcheck/tests/functional/test_cases.py
  python setup.py test
}

package() {
  cd murano-pkg-check
  python setup.py install --root="$pkgdir" --optimize=1
}
