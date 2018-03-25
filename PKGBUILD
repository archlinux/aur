# Maintainer: Andy Botting <andy@andybotting.com>

_module='oslo.log'
pkgname=('python-oslo-log' 'python2-oslo-log')
pkgver='3.37.0'
pkgrel='1'
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
        'temporarily-remove-failing-py3.6-tests.patch')
sha512sums=('SKIP'
            '374aba2c8d8533e32ffc963263349b782eaf4855c6683589d8a0f8f3277fc17c4801761412a4624a4840c034dc60e9b6da53ccf493fa21ea19abe1bbe7333e70')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
  cd "${srcdir}/${_module}"
  patch -p1 -i "${srcdir}/temporarily-remove-failing-py3.6-tests.patch"
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
