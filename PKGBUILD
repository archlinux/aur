# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-oslo-log' 'python2-oslo-log')
pkgver='3.20.0'
pkgrel='2'
pkgdesc='Oslo Log library'
arch=('any')
url="https://pypi.python.org/pypi/oslo.log/$pkgver"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'python-pbr' 'python2-pbr' 'python-oslo-config'
             'python2-oslo-config' 'python-oslo-context' 'python2-oslo-context' 'python-oslo-i18n' 
             'python2-oslo-i18n' 'python-oslo-utils' 'python2-oslo-utils' 'python-oslo-serialization'
             'python-debtcollector' 'python2-debtcollector' 'python-pyinotify' 'python2-pyinotify'
             'python-dateutil' 'python2-dateutil')
checkdepends=('python-oslotest' 'python2-oslotest' 'python2-unittest2')
source=("git+https://git.openstack.org/openstack/oslo.log#tag=$pkgver"
        '1640564d.patch')
sha256sums=('SKIP'
            '7692de02f8fd3411972d43505a78d23f0ccb6faa107ba3df7e511921372cb786')

prepare() {
  cd "$srcdir"/oslo.log
  patch -p1 < "$srcdir"/1640564d.patch
  cp -a "$srcdir"/oslo.log{,-py2}
}

build() {
  cd "$srcdir"/oslo.log
  python setup.py build

  cd "$srcdir"/oslo.log-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/oslo.log
  # These are for python 2.x and old python 3.x only
  sed -i 's/unittest2/unittest/g' oslo_log/tests/unit/test_versionutils.py
  python setup.py testr

  cd "$srcdir"/oslo.log-py2
  PYTHON=python2 python2 setup.py testr
}

package_python-oslo-log() {
  depends=('python-six' 'python-pbr' 'python-oslo-config' 'python-oslo-context' 'python-oslo-i18n'
           'python-oslo-utils' 'python-oslo-serialization' 'python-debtcollector' 'python-pyinotify'
           'python-dateutil')

  cd "$srcdir"/oslo.log
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-oslo-log() {
  depends=('python2-six' 'python2-pbr' 'python2-oslo-config' 'python2-oslo-context' 'python2-oslo-i18n'
           'python2-oslo-utils' 'python2-oslo-serialization' 'python2-debtcollector' 'python2-pyinotify'
           'python2-dateutil')

  cd "$srcdir"/oslo.log-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}"/usr/bin/convert-json{,2}
}

# vim:set ts=2 sw=2 et:
