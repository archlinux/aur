# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-troveclient
pkgver=7.0.0
pkgrel=1
pkgdesc='Client library for OpenStack DBaaS API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-prettytable' 'python-requests' 'python-oslo-i18n'
         'python-oslo-utils' 'python-babel' 'python-keystoneauth1' 'python-six'
         'python-swiftclient' 'python-mistralclient' 'python-osc-lib')
checkdepends=('python-fixtures' 'python-oslotest' 'python-openstackclient'
              'python-requests-mock' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-mock' 'python-httplib2')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz"
        'trove.bash_completion')
sha512sums=('ed45a30aa00e7047539a3473d631b4f6e375a2997faa488f5d20e83deaab483f2c5ddd692322798232801d34f11b0b6df79b90bb7df3d88cad61ad5e0aa91fbc'
            '53a8603e7add596e847fcfcea9b454168956af581fb48794ab0ac08f6dce1d8c71ef47682e8b974bf184fc19e8473d362c75e9d70cd99d761ca7e113ea1f0ee9')

export PBR_VERSION=$pkgver

prepare() {
  cd $pkgname-$pkgver
  sed -i '/simplejson/d' requirements.txt
  sed -i 's/assertItemsEqual/assertCountEqual/g' troveclient/tests/osc/v1/test_database_logs.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D --mode 644 $srcdir/trove.bash_completion $pkgdir/usr/share/bash-completion/completions/trove
}

# vim:set ts=2 sw=2 et:
