# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-manilaclient' 'python2-manilaclient')
pkgver='1.24.1'
pkgrel='1'
pkgdesc='Client library for OpenStack Manila API'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
checkdepends=('python-pbr' 'python2-pbr'
              'python-oslo-config' 'python2-oslo-config'
              'python-oslo-log' 'python2-oslo-log'
              'python-oslo-serialization' 'python2-oslo-serialization'
              'python-oslo-utils' 'python2-oslo-utils'
              'python-prettytable' 'python2-prettytable'
              'python-requests' 'python2-requests'
              'python-simplejson' 'python2-simplejson'
              'python-babel' 'python2-babel'
              'python-six' 'python2-six'
              'python-keystoneclient' 'python2-keystoneclient'
              'python-ddt' 'python2-ddt'
              'python-fixtures' 'python2-fixtures'
              'python-mock' 'python2-mock'
              'python-oslotest'  'python2-oslotest'
              'python-testtools' 'python2-testtools'
              'python-stestr' 'python2-stestr'
              'python-tempest')
sha512sums=('SKIP')

prepare() {
  # Fix tests where ~ is not replaced with %7E
  sed -i 's/%7E/~/' "${srcdir}/${pkgname}"/manilaclient/tests/unit/v2/*.py
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

  # No python2-tempest
  #cd "${srcdir}/${pkgname}-py2"
  #PYTHON=python2 stestr2 run
}

package_python-manilaclient() {
  depends=('python-oslo-config' 'python-oslo-log' 'python-oslo-serialization'
           'python-oslo-utils' 'python-pbr' 'python-prettytable'
           'python-requests' 'python-simplejson' 'python-babel' 'python-six'
           'python-keystoneclient')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-manilaclient() {
  depends=('python2-oslo-config' 'python2-oslo-log'
           'python2-oslo-serialization' 'python2-oslo-utils' 'python2-pbr'
           'python2-prettytable' 'python2-requests' 'python2-simplejson'
           'python2-babel' 'python2-six' 'python2-keystoneclient')
  cd "${srcdir}/python-manilaclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/manila{,2}
}

# vim:set ts=2 sw=2 et:
