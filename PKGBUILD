# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pytest-flake8
pkgname=('python-pytest-flake8' 'python2-pytest-flake8')
pkgver=0.5
pkgrel=1
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='http://github.com/tholo/pytest-flake8'
makedepends=('python-pytest' 'python2-pytest' 'flake8' 'python2-flake8' 'git')
source=("git+https://github.com/tholo/pytest-flake8#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a pytest-flake8{,-py2}
}

build() {
  cd "$srcdir"/pytest-flake8
  python setup.py build

  cd "$srcdir"/pytest-flake8-py2
  python2 setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir"/pytest-flake8
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.5/site-packages:$PYTHONPATH" py.test

  cd "$srcdir"/pytest-flake8-py2
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH" py.test2
}

package_python-pytest-flake8() {
  depends=('python-pytest' 'flake8')

  cd pytest-flake8
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pytest-flake8() {
  depends=('python2-pytest' 'python2-flake8')

  cd pytest-flake8-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
