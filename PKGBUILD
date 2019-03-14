# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-muranoclient' 'python2-muranoclient')
pkgver='1.2.0'
pkgrel='1'
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
sha512sums=('6c8281a694b637d73a48e4f2f81b515c97ffc7a0432a2653258690b31ceb72d1a1793462d61901c628bd2699c0fbbbd6beaf9b1257bd2f9a9114103dd06c5434')

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
