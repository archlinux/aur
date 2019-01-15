# Maintainer: Andy Botting <andy@andybotting.com>

_module='yaql'
pkgname=('python-yaql' 'python2-yaql')
pkgver='1.1.3'
pkgrel='3'
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
source=("https://github.com/openstack/${_module}/archive/${pkgver}.tar.gz")
sha512sums=('a4c5e8311d181d64f17db9b01cb6ce6cc28bc4ca91f9ddfd539c2fb58f1f989d7d091f7d4e74d51d70d44c71ea223276b7e6c03e83802a468b2db0d486c62d86')

prepare() {
  cp -a "${srcdir}/${_module}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' yaql/tests/*.py
  python setup.py build

  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py testr

  cd "${srcdir}/${_module}-${pkgver}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-yaql() {
  depends=('python-six' 'python-pbr' 'python-babel' 'python-dateutil'
           'python-ply')
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-yaql() {
  depends=('python2-six' 'python2-pbr' 'python2-babel' 'python2-dateutil'
           'python2-ply')
  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/yaql{,2}
}

# vim:set ts=2 sw=2 et:
