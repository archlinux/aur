# Maintainer: Andy Botting <andy@andybotting.com>

_module='oslo.concurrency'
pkgname=('python-oslo-concurrency' 'python2-oslo-concurrency')
pkgver='3.20.0'
pkgrel='1'
pkgdesc='Oslo concurrency library'
arch=('any')
url="http://docs.openstack.org/developer/${_module}"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-oslotest' 'python2-oslotest'
              'python-coverage' 'python2-coverage'
              'python-fixtures' 'python2-fixtures'
              'python-fasteners' 'python2-fasteners')
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cp -a ${_module}{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}"-py2
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  python setup.py testr

  cd "${srcdir}/${_module}"-py2
  PYTHON=python2 python2 setup.py testr
}

package_python-oslo-concurrency() {
  depends=('python-pbr' 'python-oslo-config' 'python-oslo-i18n'
           'python-oslo-utils' 'python-six' 'python-fasteners')

  cd "${srcdir}/${_module}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-oslo-concurrency() {
  depends=('python2-pbr' 'python2-oslo-config' 'python2-oslo-i18n'
           'python2-oslo-utils' 'python2-six' 'python2-fasteners')

  cd "${srcdir}/${_module}"-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}"/usr/bin/lockutils-wrapper{,2}
}

# vim:set ts=2 sw=2 et:
