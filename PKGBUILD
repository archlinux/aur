# Maintainer: Andy Botting <andy@andybotting.com>
_module=murano-pkg-check
pkgname=('python-muranopkgcheck' 'python2-muranopkgcheck')
pkgver='0.3.0'
pkgrel='1'
pkgdesc='Murano package validator tool'
arch=('any')
url="http://docs.openstack.org/developer/${_module}"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-oslotest' 'python2-oslotest' 'python2-unittest2'
              'python-semantic-version' 'python2-semantic-version')
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cp -a ${_module}{,-py2}
}

# Tests are failing v0.3.0
#build() {
#  cd "${srcdir}/${_module}"
#  python setup.py build
#
#  cd "${srcdir}/${_module}-py2"
#  python2 setup.py build
#}

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
