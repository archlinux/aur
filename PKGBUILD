# Maintainer: Andy Botting <andy@andybotting.com>

_module='murano-pkg-check'
pkgname=('python-muranopkgcheck' 'python2-muranopkgcheck')
pkgver='0.3.0'
pkgrel='3'
pkgdesc='Murano package validator tool'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-yaml' 'python2-yaml'
              'python-yaql' 'python2-yaql'
              'python-six' 'python2-six'
              'python-stevedore' 'python2-stevedore'
              'python-semantic-version' 'python2-semantic-version'
              'python-oslo-i18n' 'python2-oslo-i18n'
              'python-subunit' 'python2-subunit'
              'python-oslotest' 'python2-oslotest'
              'python-testtools' 'python2-testtools')
source=("https://github.com/openstack/${_module}/archive/${pkgver}.tar.gz")
sha512sums=('98a08661957e09c9ee0b4f018bd874696e586d296c9233514d7f46099d02068a72185317708fd9755917ed6fb1b773d9ccad70b9fd841af59e91f7969d93b6b5')

prepare() {
  cp -a "${srcdir}/${_module}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py test

  cd "${srcdir}/${_module}-${pkgver}-py2"
  PYTHON=python2 python2 setup.py test
}

package_python-muranopkgcheck() {
  depends=('python-pbr' 'python-yaml' 'python-yaql' 'python-six'
           'python-stevedore' 'python-semantic-version' 'python-oslo-i18n')
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-muranopkgcheck() {
  depends=('python2-pbr' 'python2-yaml' 'python2-yaql' 'python2-six'
           'python2-stevedore' 'python2-semantic-version' 'python2-oslo-i18n')
  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/murano-pkg-check{,2}
}

# vim:set ts=2 sw=2 et:
