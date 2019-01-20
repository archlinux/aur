# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pytest-plugins
pkgname=('python-pytest-fixture-config' 'python2-pytest-fixture-config'
         'python-pytest-shutil'         'python2-pytest-shutil'
         'python-pytest-virtualenv'     'python2-pytest-virtualenv')
pkgver=1.4.0
pkgrel=1
arch=('any')
license=('BSD')
url='https://github.com/manahl/pytest-plugins'
makedepends=('python-pytest' 'python2-pytest' 'python-setuptools-git' 'python2-setuptools-git'
             'python-pypandoc' 'python2-pypandoc' 'python-execnet' 'python2-execnet'
             'python-path.py' 'python2-path.py' 'python-mock' 'python2-mock' 'python2-contextlib2'
             'python-virtualenv' 'python2-virtualenv' 'python-termcolor' 'python2-termcolor')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/manahl/pytest-plugins/archive/v$pkgver.tar.gz")
sha512sums=('a9a9dd5a44449a82942e6094e0a3478f9146dd2c241c24fabc110590a7de17474768630688936138f50c39407f7ee8c8138c67f86451603886234be5ff2ebf26')

prepare() {
  # New pypandoc?
  sed -i "s/'rst')/'rst', format='markdown')/" pytest-plugins-$pkgver/common_setup.py

  # Our /bin is a symlink
  sed -i "s|'/bin'|'/usr/bin'|" pytest-plugins-$pkgver/pytest-shutil/tests/integration/test_cmdline_integration.py

  # Pytest 4
  sed -i 's/< *4.0/<5/' pytest-plugins-$pkgver/pytest-*/setup.py

  (cd pytest-plugins-$pkgver; make copyfiles)

  cp -a pytest-plugins-$pkgver{,-py2}
  sed -i '/contextlib2/d' pytest-plugins-$pkgver/pytest-shutil/setup.py
}

build() {
  for _pkg in pytest-fixture-config pytest-shutil pytest-virtualenv; do
    cd "$srcdir"/pytest-plugins-$pkgver/$_pkg
    python setup.py build

    cd "$srcdir"/pytest-plugins-$pkgver-py2/$_pkg
    python2 setup.py build
  done
}

check() {
  # Hack entry points by installing it

  for _pkg in pytest-fixture-config pytest-shutil pytest-virtualenv; do
    cd "$srcdir"/pytest-plugins-$pkgver/$_pkg
    python setup.py install --root="$srcdir"/tmp_install --optimize=1
    PYTHONPATH="$srcdir"/tmp_install/usr/lib/python3.7/site-packages py.test

    cd "$srcdir"/pytest-plugins-$pkgver-py2/$_pkg
    python2 setup.py install --root="$srcdir"/tmp_install --optimize=1
    PYTHONPATH="$srcdir"/tmp_install/usr/lib/python2.7/site-packages py.test2
  done
}

package_python-pytest-fixture-config() {
  pkgdesc='Fixture configuration utils for py.test'
  depends=('python-pytest')

  cd pytest-plugins-$pkgver/pytest-fixture-config
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pytest-fixture-config() {
  pkgdesc='Fixture configuration utils for py.test'
  depends=('python2-pytest')

  cd pytest-plugins-$pkgver-py2/pytest-fixture-config
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-pytest-shutil() {
  pkgdesc='A goodie-bag of unix shell and environment tools for py.test'
  depends=('python-pytest' 'python-execnet' 'python-path.py' 'python-mock' 'python-termcolor')

  cd pytest-plugins-$pkgver/pytest-shutil
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pytest-shutil() {
  pkgdesc='A goodie-bag of unix shell and environment tools for py.test'
  depends=('python2-pytest' 'python2-execnet' 'python2-path.py' 'python2-mock' 'python2-termcolor'
           'python2-contextlib2')

  cd pytest-plugins-$pkgver-py2/pytest-shutil
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-pytest-virtualenv() {
  pkgdesc='Virtualenv fixture for py.test'
  depends=('python-pytest-fixture-config' 'python-pytest-shutil' 'python-virtualenv')

  cd pytest-plugins-$pkgver/pytest-virtualenv
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pytest-virtualenv() {
  pkgdesc='Virtualenv fixture for py.test'
  depends=('python2-pytest-fixture-config' 'python2-pytest-shutil' 'python2-virtualenv')

  cd pytest-plugins-$pkgver-py2/pytest-virtualenv
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
