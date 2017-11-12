# Maintainer: Felix Höffken <fupduck at sacknagel dot com>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net
_srcname=srp

pkgname=(python-$_srcname python2-$_srcname)
pkgbase=python-srp
pkgver=1.0.8
pkgrel=1
pkgdesc='Python implementation of the Secure Remote Password protocol (SRP)'
arch=('any')
url="https://github.com/cocagne/py$_srcname"
license=('MIT')
makedepends=('python' 'python2')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('7312375d8aff85bff3fad7d75cf80152')

prepare() {
  cd "$srcdir"

  # workaround for now - delete if https://github.com/cocagne/pysrp/pull/32
  # or similar is merged
  sed -i 's/libssl.so/libssl.so.1.0.0/' "py$_srcname-$pkgver/srp/_ctsrp.py"

  cp -a "py$_srcname-$pkgver"{,-py2}
}

build() {
  cd "$srcdir/py$_srcname-$pkgver"
  python setup.py build

  cd "$srcdir/py$_srcname-$pkgver-py2"
  python2 setup.py build
}

check() {
  # Test script isn’t compatible with Python 3 by the looks of it
  cd "$srcdir/py$_srcname-$pkgver"
  python srp/test_srp.py

  cd "$srcdir/py$_srcname-$pkgver-py2"
  python2 srp/test_srp.py
}

package_python-srp() {
  depends=('python')

  cd "$srcdir/py$_srcname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-srp() {
  depends=('python2')

  cd "$srcdir/py$_srcname-$pkgver-py2"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

