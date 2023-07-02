# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-troveclient
pkgver=8.1.0
pkgrel=2
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
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz"
        'trove.bash_completion')
sha512sums=('406299dc950cd80a5cb419a559af2a7274419b7c150f1162caa66fb8979db1f946e7fda35f627565c2ee67a19be755f3519660c00f9206e8023dc74a44bb97c2'
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

# vim:set ts=2 sw=2 et:
