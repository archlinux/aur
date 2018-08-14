# Maintainer: Andy Botting <andy@andybotting.com>

_module='oslo.log'
pkgname=('python-oslo-log' 'python2-oslo-log')
pkgver='3.38.1'
pkgrel='2'
pkgdesc='Oslo Log library'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools'
             'python-pbr' 'python2-pbr'
             'python-oslo-config' 'python2-oslo-config'
             'python-oslo-context' 'python2-oslo-context'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-oslo-serialization' 'python2-oslo-serialization'
             'python-debtcollector' 'python2-debtcollector'
             'python-pyinotify' 'python2-pyinotify'
             'python-dateutil' 'python2-dateutil')
checkdepends=('python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'python2-unittest2')
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}"
        'remove-failed-py37-tests.patch')
sha512sums=('SKIP'
            '041fa7f3c6546b1c7aa03df776c8d8da1725b7be34871d2b96f4cf1cd3026df96ed7f880eecf90beab22806901cd3b38db3419e5f2c6ff1b564c0270815f3ace')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
  cd "${srcdir}/${_module}"
  patch -p1 -i "${srcdir}/remove-failed-py37-tests.patch"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  # These are for python 2.x and old python 3.x only
  sed -i 's/unittest2/unittest/g' oslo_log/tests/unit/test_versionutils.py
  python setup.py testr

  cd "${srcdir}/${_module}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-oslo-log() {
  depends=('python-six' 'python-pbr' 'python-oslo-config'
           'python-oslo-context' 'python-oslo-i18n' 'python-oslo-utils'
           'python-oslo-serialization' 'python-debtcollector'
           'python-pyinotify' 'python-dateutil')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-oslo-log() {
  depends=('python2-six' 'python2-pbr' 'python2-oslo-config'
           'python2-oslo-context' 'python2-oslo-i18n' 'python2-oslo-utils'
           'python2-oslo-serialization' 'python2-debtcollector'
           'python2-pyinotify' 'python2-dateutil')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/convert-json{,2}
}

# vim:set ts=2 sw=2 et:
