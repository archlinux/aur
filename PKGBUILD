# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-troveclient
pkgver='3.0.0'
pkgrel='1'
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
        'trove.bash_completion'
        'skip-failing-py37-tests.patch')
sha512sums=('25eb83d2bb1079077bc5eeb92d2a37e0cc534272aa9af892d790145fb8e44392a9c6dcfbaf981342ef14212e4ba7c3e67bf7b198da6810a74d1af456736dcc77'
            '53a8603e7add596e847fcfcea9b454168956af581fb48794ab0ac08f6dce1d8c71ef47682e8b974bf184fc19e8473d362c75e9d70cd99d761ca7e113ea1f0ee9'
            '33eb1e68cccf282ed2b0ba40a44efedd6fa10e9b9c670c3ccd1473fce38c5e5a648da9e1388b7eb2601095f84078b2638f46819ac1e4d20ba3a8dd55ac16aabe')

export PBR_VERSION=$pkgver

prepare() {
  cd $pkgname-$pkgver
  sed -i '/simplejson/d' requirements.txt
  patch -p1 -i $srcdir/skip-failing-py37-tests.patch
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
