# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-http-parser
pkgname=('python-http-parser' 'python2-http-parser')
pkgver=0.8.3
pkgrel=3
pkgdesc="HTTP request/response parser for Python"
arch=('x86_64')
license=('MIT')
url="https://github.com/benoitc/http-parser"
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'git')
checkdepends=('python-pytest' 'python2-pytest')
source=("git+https://github.com/benoitc/http-parser.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  rm http-parser/http_parser/parser.c
  cp -a http-parser{,-py2}
}

build() {
  cd "$srcdir/http-parser"
  python setup.py build

  cd "$srcdir/http-parser-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/http-parser"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.7:$PYTHONPATH" \
  py.test testing/

  cd "$srcdir/http-parser-py2"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7:$PYTHONPATH" \
  py.test2 testing/
}

package_python-http-parser() {
  depends=('python')

  cd http-parser
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-http-parser() {
  depends=('python2')

  cd http-parser-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
