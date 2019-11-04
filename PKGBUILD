# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-socketpool
pkgname=('python-socketpool' 'python2-socketpool')
pkgver=0.5.3
pkgrel=5
pkgdesc="A simple Python socket pool"
arch=('any')
license=('MIT')
url="https://github.com/benoitc/socketpool"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-pytest' 'python2-pytest')
source=("git+https://github.com/benoitc/socketpool.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  sed -i 's/data_files.*$/)/' socketpool/setup.py
  cp -a socketpool{,-py2}
}

build() {
  cd "$srcdir/socketpool"
  LC_CTYPE=en_US.UTF-8 python setup.py build

  cd "$srcdir/socketpool-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/socketpool"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" \
  py.test tests/

  cd "$srcdir/socketpool-py2"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" \
  py.test2 tests/
}

package_python-socketpool() {
  depends=('python')

  cd socketpool
  LC_CTYPE=en_US.UTF-8 python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-socketpool() {
  depends=('python2')

  cd socketpool-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
