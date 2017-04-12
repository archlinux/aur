# Maintainer: Andy Botting <andy@andybotting.com>

_module='murano-pkg-check'
pkgname=('python-muranopkgcheck' 'python2-muranopkgcheck')
pkgver='0.3.0'
pkgrel='2'
pkgdesc='Murano package validator tool'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
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
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  python setup.py testr

  cd "${srcdir}/${_module}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-muranopkgcheck() {
  depends=('python-pbr' 'python-yaml' 'python-yaql' 'python-six'
           'python-stevedore' 'python-semantic-version' 'python-oslo-i18n')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-muranopkgcheck() {
  depends=('python2-pbr' 'python2-yaml' 'python2-yaql' 'python2-six'
           'python2-stevedore' 'python2-semantic-version' 'python2-oslo-i18n')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/murano-pkg-check{,2}
}

# vim:set ts=2 sw=2 et:
