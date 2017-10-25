# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pytest-flake8
pkgname=('python-pytest-flake8' 'python2-pytest-flake8')
pkgver=0.9
pkgrel=1
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
makedepends=('python-pytest' 'python2-pytest' 'flake8' 'python2-flake8')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz")
sha512sums=('07d35cf636824178065ace6113afa6a37cb5d451f43da2683a694e6104bf72f27e7c89da59573b817031522f5827d06ef3136ee91db0162d9dcb25e63454592d')

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
