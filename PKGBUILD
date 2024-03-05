# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranoclient
pkgver=2.8.0
pkgrel=1
pkgdesc='Python client library for Murano'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-prettytable python-glanceclient
         python-keystoneclient python-iso8601 python-six python-babel
         python-pyopenssl python-requests python-yaml python-yaql
         python-osc-lib python-muranopkgcheck python-oslo-serialization
         python-oslo-utils python-oslo-log python-oslo-i18n)
checkdepends=(python-fixtures python-mock python-requests-mock
              python-tempest python-stestr python-testscenarios
              python-testtools python-oslotest python-os-testr)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e1904e8c4d87d9c17e0b5ea786f7d9794fa0cdaab2326e65eb214fc12d92028411d9a4a34c39b0d38357ccebecabaf1a1b5f858f11218b9a6cf793440db9d25b')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' muranoclient/tests/unit/osc/v1/*.py
  stestr run
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}
