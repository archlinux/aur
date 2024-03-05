# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-troveclient
pkgver=8.4.0
pkgrel=1
pkgdesc='Client library for OpenStack DBaaS API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-prettytable python-requests python-oslo-i18n
         python-oslo-utils python-babel python-keystoneauth1 python-six
         python-swiftclient python-mistralclient python-osc-lib)
checkdepends=(python-fixtures python-oslotest python-openstackclient
              python-requests-mock python-stestr python-testscenarios
              python-testtools python-mock python-httplib2)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz"
        'trove.bash_completion')
sha512sums=('bd8b1f08433dee53b32a1d09df7f429cc0f268f9648c69ffcbf867e30d7cd39122cf266d4dd0e83cee7d6615c4b25f235e814f6ea4f348e384d29aa48978aef7'
            '53a8603e7add596e847fcfcea9b454168956af581fb48794ab0ac08f6dce1d8c71ef47682e8b974bf184fc19e8473d362c75e9d70cd99d761ca7e113ea1f0ee9')

export PBR_VERSION=$pkgver

prepare() {
  cd $pkgname
  sed -i '/simplejson/d' requirements.txt
  sed -i 's/assertItemsEqual/assertCountEqual/g' troveclient/tests/osc/v1/test_database_logs.py
}

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  stestr run
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
  install -D --mode 644 $srcdir/trove.bash_completion $pkgdir/usr/share/bash-completion/completions/trove
}
