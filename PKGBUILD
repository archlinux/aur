# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pytest-flake8
pkgname=('python-pytest-flake8' 'python2-pytest-flake8')
pkgver=1.0.3
pkgrel=1
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
makedepends=('python-pytest' 'python2-pytest' 'flake8' 'python2-flake8')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz")
sha512sums=('c17b9d3b635c61e61242abb7cdb457fd6906c4a7c1d2ece9ea625cfe4d0675caabff366511b4114e6afc1742b7ccf9d8d56658fe69b28b819a42d1af183cbe87')

prepare() {
  sed -i 's/ignore = E128/ignore = E128 W605/' pytest-flake8-$pkgver/tox.ini

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
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH" py.test

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
