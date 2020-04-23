# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-http-parser
pkgname=('python-http-parser' 'python2-http-parser')
pkgver=0.9.0
pkgrel=1
pkgdesc="HTTP request/response parser for Python"
arch=('x86_64')
license=('MIT')
url="https://github.com/benoitc/http-parser"
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
checkdepends=('python-pytest' 'python2-pytest')
source=("https://github.com/benoitc/http-parser/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('75e51bef43d9d7698aad69f8bfe651e24784b97603cac55f33bf4c12c86792c8c71d6206f31847d052e4d8621a5ea65a7b34eca5bebdb8189f58e6d98d33139d')

prepare() {
  rm http-parser-$pkgver/http_parser/parser.c
  cp -a http-parser-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/http-parser-$pkgver
  python setup.py build

  cd "$srcdir"/http-parser-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/http-parser-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8:$PYTHONPATH" \
  py.test testing/

  cd "$srcdir"/http-parser-$pkgver-py2
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7:$PYTHONPATH" \
  py.test2 testing/
}

package_python-http-parser() {
  depends=('python')

  cd http-parser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-http-parser() {
  depends=('python2')

  cd http-parser-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
