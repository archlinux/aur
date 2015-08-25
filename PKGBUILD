# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgbase=python-future
pkgname=(python-future python2-future)
pkgver=0.15.0
pkgrel=2
pkgdesc="Clean single-source support for Python 3 and 2"
url="http://python-future.org/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/f/future/future-$pkgver.tar.gz")
md5sums=('cf1ee211567cc0b1021de5839064fe7b')
sha256sums=('7f8ad46e287ac32e3dae78be41098c83d690b364142e0a5f11958c2b549420b0')

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
