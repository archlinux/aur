# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgbase=python-pyexecjs
_name=PyExecJS
pkgname=('python-pyexecjs' 'python2-pyexecjs')
pkgver=1.5.0
pkgrel=1
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.python.org/pypi/PyExecJS"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('v8: Google JavaScript engine'
            'nodejs: built on Chrome V8 JavaScript engine'
            'phantomjs: a headless WebKit'
            'spidermonkey: Mozilla JavaScript engine')
changelog=changelog
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('e8d262b4b6fbc4ba6084f1e1c6469d1f')

prepare() {
  cp -a PyExecJS-$pkgver{,-python2}
}

build() {
  cd "PyExecJS-$pkgver"
  python setup.py build

  cd "../PyExecJS-$pkgver-python2"
  python2 setup.py build
}

check() {
  cd "PyExecJS-$pkgver"
  LC_CTYPE=en_US.utf8 python test_execjs.py || warning "Tests failed"

  cd "../PyExecJS-$pkgver-python2"
  LC_CTYPE=en_US.utf8 python2 test_execjs.py || warning "Tests failed"
}

package_python-pyexecjs() {
  depends=('python-six')

  cd "PyExecJS-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pyexecjs() {
  depends=('python2-six')

  cd "PyExecJS-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
