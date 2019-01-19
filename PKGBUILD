# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=asgiref
pkgbase=python-asgiref1
pkgname=('python-asgiref1' 'python2-asgiref1')
pkgver=1.1.2
pkgrel=1
pkgdesc="ASGI in-memory channel layer (v1)"
url="https://github.com/django/asgiref"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('4b00936710ee10c72b656eb90e47c0000d353d0741961df8ce9b3c8bbed49020')

prepare() {
  cp -a ${_name}-${pkgver}{,-py2}
}

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build

  cd "$srcdir/${_name}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/${_name}-${pkgver}"
  for test_module in `ls tests/*.py`
  do
    python -m unittest $test_module
  done

  cd "$srcdir/${_name}-${pkgver}-py2"
  for test_module in `ls tests/*.py`
  do
    test_module=`echo $test_module | sed 's/\//./g'`
    test_module=${test_module%.py}
    python2 -m unittest $test_module
  done
}

package_python-asgiref1() {
  checkdepends=('python-six')
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-asgiref1() {
  checkdepends=('python2-six')
  cd "$srcdir/${_name}-${pkgver}-py2/"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
