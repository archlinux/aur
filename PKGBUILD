# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-barbicanclient' 'python2-barbicanclient')
pkgver='4.7.0'
pkgrel='1'
pkgdesc='Client library for the Barbican Key Management API'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}"
license=('Apache')
makedepends=('git' 'python-pbr' 'python2-pbr'
             'python-prettytable' 'python2-prettytable'
             'python-requests' 'python2-requests'
             'python-six' 'python2-six'
             'python-cliff' 'python2-cliff'
             'python-keystoneauth1' 'python2-keystoneauth1'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-serialization' 'python2-oslo-serialization'
             'python-oslo-utils' 'python2-oslo-utils')
checkdepends=('python-fixtures' 'python2-fixtures'
              'python-requests-mock' 'python2-requests-mock'
              'python-mock' 'python2-mock'
              'python-testrepository' 'python2-testrepository'
              'python-testtools' 'python2-testtools'
              'python-oslotest' 'python2-oslotest'
              'python-nose' 'python2-nose'
              'python-oslo-config' 'python2-oslo-config'
              'python-openstackclient' 'python2-openstackclient')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's/assertItemsEqual/assertCountEqual/g' barbicanclient/tests/v1/*.py
  cp -a "${srcdir}/${pkgname}"{,-py2}
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build

  cd "${srcdir}/${pkgname}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}"
  stestr run

  cd "${srcdir}/${pkgname}-py2"
  stestr2 run
}

package_python-barbicanclient() {
  depends=('python-pbr' 'python-six' 'python-requests' 'python-cliff'
           'python-keystoneauth1' 'python-oslo-i18n'
           'python-oslo-serialization' 'python-oslo-utils')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-barbicanclient() {
  depends=('python2-pbr' 'python2-six' 'python2-requests' 'python2-cliff'
           'python2-keystoneauth1' 'python2-oslo-i18n'
           'python2-oslo-serialization' 'python2-oslo-utils')
  cd "${srcdir}/python-barbicanclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/barbican{,2}
}

# vim:set ts=2 sw=2 et:
