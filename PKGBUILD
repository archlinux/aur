# Maintainer: Andy Botting <andy@andybotting.com>

_module='yaql'
pkgname=('python-yaql' 'python2-yaql')
pkgver='1.1.3'
pkgrel='2'
pkgdesc='YAQL - Yet Another Query Language'
arch=('any')
url='https://yaql.readthedocs.io'
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-dateutil' 'python2-dateutil'
              'python-ply' 'python2-ply'
              'python-six' 'python2-six'
              'python-fixtures' 'python2-fixtures'
              'python-subunit' 'python2-subunit'
              'python-testrepository' 'python2-testrepository'
              'python-testtools' 'python2-testtools')
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' yaql/tests/*.py
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

package_python-yaql() {
  depends=('python-six' 'python-pbr' 'python-babel' 'python-dateutil'
           'python-ply')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-yaql() {
  depends=('python2-six' 'python2-pbr' 'python2-babel' 'python2-dateutil'
           'python2-ply')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/yaql{,2}
}

# vim:set ts=2 sw=2 et:
