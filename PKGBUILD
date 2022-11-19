# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python38-pytest-plugins
pkgname=('python38-pytest-fixture-config' 'python38-pytest-shutil' 'python38-pytest-virtualenv')
pkgver=1.7.0
pkgrel=8
arch=('any')
license=('BSD')
url='https://github.com/manahl/pytest-plugins'
makedepends=('python38-pytest' 'python38-setuptools' 'python38-pypandoc' 'python38-execnet' 'python38-path'
             'python38-mock' 'python38-virtualenv' 'python38-termcolor')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/manahl/pytest-plugins/archive/v$pkgver.tar.gz")
sha512sums=('6ce64f554359ae8b4e8b1cdab9908226501bad1d6bcdec9d7968133bbf0b3530842883cf3ea7ef14e09372fd1454d685d4b1bf4e8d95498b69a8b0f20177e2be')

prepare() {
  # New pypandoc?
  sed -i "s/'rst')/'rst', format='markdown')/" pytest-plugins-$pkgver/common_setup.py

  # Our /bin is a symlink
  sed -i "s|'/bin'|'/usr/bin'|" pytest-plugins-$pkgver/pytest-shutil/tests/integration/test_cmdline_integration.py

  # Pytest 4
  sed -i 's/< *4.0/<5/' pytest-plugins-$pkgver/pytest-*/setup.py

  (cd pytest-plugins-$pkgver; make copyfiles)

  sed -i '/contextlib2/d' pytest-plugins-$pkgver/pytest-shutil/setup.py
}

build() {
  for _pkg in pytest-fixture-config pytest-shutil pytest-virtualenv; do
    cd "$srcdir"/pytest-plugins-$pkgver/$_pkg
    python3.8 setup.py build
  done
}

check() {
  # Hack entry points by installing it

  for _pkg in pytest-fixture-config pytest-shutil pytest-virtualenv; do
    cd "$srcdir"/pytest-plugins-$pkgver/$_pkg
    python3.8 setup.py install --root="$srcdir"/tmp_install --optimize=1
    PYTHONPATH="$srcdir"/tmp_install/usr/lib/python3.10/site-packages py.test
  done
}

package_python38-pytest-fixture-config() {
  pkgdesc='Fixture configuration utils for py.test'
  depends=('python38-pytest')

  cd pytest-plugins-$pkgver/pytest-fixture-config
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python38-pytest-shutil() {
  pkgdesc='A goodie-bag of unix shell and environment tools for py.test'
  depends=('python38-pytest' 'python38-execnet' 'python38-path' 'python38-mock' 'python38-termcolor')

  cd pytest-plugins-$pkgver/pytest-shutil
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python38-pytest-virtualenv() {
  pkgdesc='Virtualenv fixture for py.test'
  depends=('python38-pytest-fixture-config' 'python38-pytest-shutil' 'python38-virtualenv')

  cd pytest-plugins-$pkgver/pytest-virtualenv
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
