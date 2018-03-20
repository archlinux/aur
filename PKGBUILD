# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pytest-flake8
pkgname=('python-pytest-flake8' 'python2-pytest-flake8')
pkgver=1.0.0
pkgrel=1
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
makedepends=('python-pytest' 'python2-pytest' 'flake8' 'python2-flake8')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz")
sha512sums=('6c48375dfd99f549738fc1f3488d51a2c5211e5459d8dde993bd8f6fb6203923c9257e17543e12d792ff6bfcf178b2c898bd80bd35734b671e37db0731e2c89f')

prepare() {
  # https://github.com/tholo/pytest-flake8/pull/14
  sed -i 's/flake8-ignore = E128/flake8-ignore = E128 E501/' pytest-flake8-$pkgver/tox.ini

  cp -a pytest-flake8-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pytest-flake8-$pkgver
  python setup.py build

  cd "$srcdir"/pytest-flake8-$pkgver-py2
  python2 setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir"/pytest-flake8-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.6/site-packages:$PYTHONPATH" py.test

  cd "$srcdir"/pytest-flake8-$pkgver-py2
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH" py.test2
}

package_python-pytest-flake8() {
  depends=('python-pytest' 'flake8')

  cd pytest-flake8-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pytest-flake8() {
  depends=('python2-pytest' 'python2-flake8')

  cd pytest-flake8-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
