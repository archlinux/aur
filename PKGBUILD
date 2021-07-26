# Maintainer: Felix Höffken <felix at ctrl.alt.coop>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net
_srcname=srp

pkgname=(python-$_srcname python2-$_srcname)
pkgbase=python-srp
pkgver=1.0.18
pkgrel=0
pkgdesc='Python implementation of the Secure Remote Password protocol (SRP)'
arch=('any')
url="https://github.com/cocagne/py$_srcname"
license=('MIT')
makedepends=('python' 'python2' 'python-six' 'python2-six')
source=("$url/archive/$pkgver.tar.gz" "0001-Use-libssl.so.1.1.patch")
sha256sums=('7cdcffc4c0bc32798ad054c3bca99d95a97b92b37df708eaca9e748153141a76'
            '301627f7766f09e7cfda7b374699311da657490a8e63ab34d6c2cb4628bd8427')

prepare() {
  cd "$srcdir/py$_srcname-$pkgver"
  patch -p1 < "${srcdir}/0001-Use-libssl.so.1.1.patch"

  cd "$srcdir"
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
  # cd "$srcdir/py$_srcname-$pkgver"
  # python srp/test_srp.py

  cd "$srcdir/py$_srcname-$pkgver-py2"
  python2 srp/test_srp.py
}

package_python-srp() {
  depends=('python' 'openssl')

  cd "$srcdir/py$_srcname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-srp() {
  depends=('python2' 'openssl')

  cd "$srcdir/py$_srcname-$pkgver-py2"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

