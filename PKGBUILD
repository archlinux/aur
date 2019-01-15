# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-muranoclient' 'python2-muranoclient')
pkgver='1.1.1'
pkgrel='2'
pkgdesc='Python client library for Murano'
arch=('any')
url="https://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-prettytable' 'python2-prettytable'
              'python-glanceclient' 'python2-glanceclient'
              'python-keystoneclient' 'python2-keystoneclient'
              'python-iso8601' 'python2-iso8601'
              'python-babel' 'python2-babel'
              'python-pyopenssl' 'python2-pyopenssl'
              'python-requests' 'python2-requests'
              'python-yaml' 'python2-yaml'
              'python-yaql' 'python2-yaql'
              'python-osc-lib' 'python2-osc-lib'
              'python-oslo-serialization' 'python2-oslo-serialization'
              'python-oslo-utils' 'python2-oslo-utils'
              'python-oslo-log' 'python2-oslo-log'
              'python-oslo-i18n' 'python2-oslo-i18n'
              'python-muranopkgcheck' 'python2-muranopkgcheck'
              'python-fixtures' 'python2-fixtures'
              'python-mock' 'python2-mock'
              'python-requests-mock' 'python2-requests-mock'
              'python-testtools' 'python2-testtools'
              'python-oslotest' 'python2-oslotest')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7f70df32554d757e2ab9dce10ffa0167a249428310bc18d93a04014b3be135c2c1830dfc1462e2bb20968ef1c0f9618865f408b5deed03ce2fdd6cfdfd36449a')

prepare() {
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
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' muranoclient/tests/unit/osc/v1/*.py
  stestr run

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  PYTHON=python2 stestr2 run
}

package_python-muranoclient() {
  depends=('python-pbr' 'python-prettytable' 'python-glanceclient'
           'python-keystoneclient' 'python-iso8601' 'python-babel'
           'python-pyopenssl' 'python-requests' 'python-yaml' 'python-yaql'
           'python-osc-lib' 'python-oslo-serialization' 'python-oslo-utils'
           'python-oslo-log' 'python-oslo-i18n')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-muranoclient() {
  depends=('python2-pbr' 'python2-prettytable' 'python2-glanceclient'
           'python2-keystoneclient' 'python2-iso8601' 'python2-babel'
           'python2-pyopenssl' 'python2-requests' 'python2-yaml' 'python2-yaql'
           'python2-osc-lib' 'python2-oslo-serialization' 'python2-oslo-utils'
           'python2-oslo-log' 'python2-oslo-i18n')
  cd "${srcdir}/python-muranoclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/murano{,2}
}

# vim:set ts=2 sw=2 et:
