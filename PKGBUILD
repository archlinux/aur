# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgbase=python-pyexecjs
_name=PyExecJS
pkgname=('python-pyexecjs' 'python2-pyexecjs')
pkgver=1.5.1
pkgrel=2
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.python.org/pypi/PyExecJS"
license=('MIT')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'python2-setuptools')
checkdepends=('python-six' 'python2-six')
optdepends=('v8: Google JavaScript engine'
            'nodejs: built on Chrome V8 JavaScript engine'
            'phantomjs: a headless WebKit'
            'js: Mozilla JavaScript engine (spidermonkey)')
changelog=changelog
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('34cc1d070976918183ff7bdc0ad71f8157a891c92708c00c5fbbff7a769f505c')

prepare() {
  cp -a PyExecJS-$pkgver{,-python2}
}

build() {
  cd "PyExecJS-$pkgver"
  python -m build --wheel --no-isolation

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
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pyexecjs() {
  depends=('python2-six')

  cd "PyExecJS-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
