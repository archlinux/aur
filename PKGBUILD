# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-manilaclient' 'python2-manilaclient')
pkgver='1.26.0'
pkgrel='1'
pkgdesc='Client library for OpenStack Manila API'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
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
sha512sums=('53e52e226d5eb0256c6a49946ba926135fef5cd96dc9866e7ce35958c0233c3341cc202bf40a493516680f28bd5842d4ed5e25f9e1b5a4cc4a4cefb447edcdd7')

prepare() {
  # Fix tests where ~ is not replaced with %7E
  sed -i 's/%7E/~/' "${srcdir}/${pkgname}-${pkgver}"/manilaclient/tests/unit/v2/*.py
  cp -a "${srcdir}/${pkgname}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-manilaclient() {
  depends=('python2-oslo-config' 'python2-oslo-log'
           'python2-oslo-serialization' 'python2-oslo-utils' 'python2-pbr'
           'python2-prettytable' 'python2-requests' 'python2-simplejson'
           'python2-babel' 'python2-six' 'python2-keystoneclient')
  cd "${srcdir}/python-manilaclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/manila{,2}
}

# vim:set ts=2 sw=2 et:
