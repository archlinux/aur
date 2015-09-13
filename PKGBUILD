# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgbase=python-future
pkgname=(python-future python2-future)
pkgver=0.15.1
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2"
url="http://python-future.org/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/f/future/future-$pkgver.tar.gz")
md5sums=('e7f0acf03544be4a11452da9e337469a')
sha256sums=('d61405f32beb357eeef6e32bbfe4c0e463cac658f59601a5ddeabf87bb8c46c1')

prepare() {
  cp -a future-$pkgver{,-py2}
}

build() {
  cd "$srcdir/future-$pkgver"
  python setup.py build

  cd "$srcdir/future-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/future-${pkgver}"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python setup.py test

  cd "$srcdir/future-${pkgver}-py2"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python2 setup.py test
}

package_python-future() {
  depends=('python')
  optdepends=('python-setuptools: futurize and pasteurize scripts')
  provides=('futurize' 'pasteurize')

  cd "$srcdir/future-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-future() {
  depends=('python2')
  optdepends=('python2-setuptools: futurize2 and pasteurize2 scripts')

  cd "$srcdir/future-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir/usr/bin/futurize"{,2}
  mv "$pkgdir/usr/bin/pasteurize"{,2}

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
